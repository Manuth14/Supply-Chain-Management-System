package lk.jiat.scm.ejb.bean;

import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;
import jakarta.ejb.TransactionAttribute;
import jakarta.ejb.TransactionAttributeType;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import lk.jiat.scm.core.exceptions.InsufficientStockException;
import lk.jiat.scm.core.exceptions.OrderProcessingException;
import lk.jiat.scm.core.service.CartBeanService;
import lk.jiat.scm.core.service.OrderBeanService;
import lk.jiat.scm.entities.entity.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Stateless
@TransactionAttribute(TransactionAttributeType.REQUIRED)
public class OrderBean implements OrderBeanService {

    @PersistenceContext
    private EntityManager em;

    @EJB
    private CartBeanService cartService;

    @Override
    public Order placeOrder(User user) throws OrderProcessingException, InsufficientStockException {

        TypedQuery<Cart> query = em.createQuery("SELECT c FROM Cart c WHERE c.user = :user", Cart.class);
        query.setParameter("user", user);
        Cart cart = query.getResultStream().findFirst().orElse(null);

        if (cart == null || cart.getCartItems() == null || cart.getCartItems().isEmpty()) {
            throw new OrderProcessingException("Cart is empty or not found!");
        }

        // 2. Create Order object
        Order order = new Order();
        order.setUser(user);
        order.setOrderDate(LocalDateTime.now());
        order.setStatus(OrderStatus.PENDING);

        List<OrderItem> orderItems = new ArrayList<>();
        double totalAmount = 0.0;

        for (CartItem cartItem : cart.getCartItems()) {
            Product product = cartItem.getProduct();
            double orderedWeight = cartItem.getWeight().doubleValue();

            if (product.getStock() < orderedWeight) {
                throw new InsufficientStockException("Insufficient stock for product: " + product.getName());
            }

            product.setStock(product.getStock() - orderedWeight);
            em.merge(product);
        }

        for (CartItem cartItem : cart.getCartItems()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrder(order);
            orderItem.setProduct(cartItem.getProduct());

            BigDecimal weight = cartItem.getWeight();
            orderItem.setWeight(weight);

            double itemPrice = cartItem.getProduct().getPrice().doubleValue();
            orderItem.setPrice(itemPrice);

            double itemTotal = weight.doubleValue() * itemPrice;
            totalAmount += itemTotal;

            orderItems.add(orderItem);
        }

        order.setOrderItems(orderItems);
        order.setTotalAmount(totalAmount);

        em.persist(order);

        ShipmentTracking tracking = new ShipmentTracking();
        tracking.setOrder(order);
        tracking.setStatus(ShipmentStatus.ORDER_PLACED);
        tracking.setCurrentLocation("Warehouse - Initial Processing");
        tracking.setUpdatedAt(LocalDateTime.now());

        em.persist(tracking);
        cartService.clearCart(user);

        return order;
    }
}