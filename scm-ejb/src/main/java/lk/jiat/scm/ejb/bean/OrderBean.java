package lk.jiat.scm.ejb.bean;

import jakarta.ejb.EJB;
import jakarta.ejb.TransactionAttribute;
import jakarta.ejb.TransactionAttributeType;
import lk.jiat.scm.core.exceptions.OrderProcessingException;
import lk.jiat.scm.core.service.CartBeanService;
import lk.jiat.scm.core.service.OrderBeanService;
import lk.jiat.scm.entities.entity.*;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

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
    public Order placeOrder(User user) throws OrderProcessingException {
        // 1. Get user's active cart
        TypedQuery<Cart> query = em.createQuery("SELECT c FROM Cart c WHERE c.user = :user", Cart.class);
        query.setParameter("user", user);
        Cart cart = query.getResultStream().findFirst().orElse(null);

        if (cart == null || cart.getCartItems() == null || cart.getCartItems().isEmpty()) {
            throw new OrderProcessingException("Cart is empty or not found!");
        }

        // 2. Create Order object
        Order order = new Order();
        order.setUser(user);
        order.setOrderDate(LocalDateTime.now()); // LocalDateTime use karala
        order.setStatus(OrderStatus.PENDING);    // Enum value eka set karanna

        List<OrderItem> orderItems = new ArrayList<>();
        double totalAmount = 0.0;

        // 3. Convert CartItems to OrderItems
        for (CartItem cartItem : cart.getCartItems()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrder(order);
            orderItem.setProduct(cartItem.getProduct());

            // CartItem eketh weight kiyala thiyenawa nam (e.g., cartItem.getWeight())
            BigDecimal weight = cartItem.getWeight();
            orderItem.setWeight(weight);

            double itemPrice = cartItem.getProduct().getPrice().doubleValue();
            orderItem.setPrice(itemPrice);

            // Total amount calculate karanna (Weight * Price)
            double itemTotal = weight.doubleValue() * itemPrice;
            totalAmount += itemTotal;

            orderItems.add(orderItem);
        }

        order.setOrderItems(orderItems);
        order.setTotalAmount(totalAmount);

        em.persist(order);
        cartService.clearCart(user);

        return order;
    }
}