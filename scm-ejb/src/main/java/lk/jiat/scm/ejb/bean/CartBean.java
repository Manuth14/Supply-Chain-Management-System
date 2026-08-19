package lk.jiat.scm.ejb.bean;

import jakarta.ejb.Stateless;
import jakarta.ejb.TransactionAttribute;
import jakarta.ejb.TransactionAttributeType;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import lk.jiat.scm.core.exceptions.CartItemNotFoundException;
import lk.jiat.scm.core.service.CartBeanService;
import lk.jiat.scm.entities.entity.Cart;
import lk.jiat.scm.entities.entity.CartItem;
import lk.jiat.scm.entities.entity.Product;
import lk.jiat.scm.entities.entity.User;

import java.math.BigDecimal;

@Stateless
@TransactionAttribute(TransactionAttributeType.REQUIRED)
public class CartBean implements CartBeanService {

    @PersistenceContext(unitName = "SCMPU")
    private EntityManager em;

    @Override
    public void addToCart(User user, Long productId, BigDecimal weight) {

        Product product = em.find(Product.class, productId);
        if (product == null) {
            throw new IllegalArgumentException("Product not found!");
        }

        Cart cart = getCartByUser(user);
        if (cart == null) {
            cart = new Cart();
            cart.setUser(user);
            em.persist(cart);
        }

        CartItem existingItem = null;
        for (CartItem item : cart.getCartItems()) {
            if (item.getProduct().getId().equals(productId)) {
                existingItem = item;
                break;
            }
        }

        if (existingItem != null) {
            BigDecimal newWeight = existingItem.getWeight().add(weight);
            existingItem.setWeight(newWeight);
            em.merge(existingItem);
        } else {
            CartItem newItem = new CartItem();
            newItem.setProduct(product);
            newItem.setWeight(weight);
            cart.addCartItem(newItem);
            em.persist(newItem);
        }
    }

    @Override
    public void updateCartItemWeight(User user, Long cartItemId, BigDecimal weight) throws CartItemNotFoundException {
        CartItem cartItem = em.find(CartItem.class, cartItemId);
        if (cartItem == null) {
            throw new CartItemNotFoundException("Cart item not found!");
        }

        if (weight == null || weight.compareTo(BigDecimal.ZERO) <= 0) {
            removeFromCart(user, cartItemId);
            return;
        }

        cartItem.setWeight(weight);
        em.merge(cartItem);
    }

    @Override
    public void removeFromCart(User user, Long cartItemId) throws CartItemNotFoundException {
        CartItem cartItem = em.find(CartItem.class, cartItemId);
        if (cartItem == null) {
            throw new CartItemNotFoundException("Cart item not found!");
        }

        // Cart collection ekenuth item eka ain karamu (Memory state eka sync wenna)
        Cart cart = cartItem.getCart();
        if (cart != null) {
            cart.getCartItems().remove(cartItem);
        }

        // Direct database eken remove karanna (Null query eka avoid karaganna)
        em.remove(cartItem);
    }

    @Override
    public Cart getCartByUser(User user) {
        try {
            return em.createQuery("SELECT c FROM Cart c WHERE c.user = :user", Cart.class)
                    .setParameter("user", user)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    @Override
    public void clearCart(User user) {
        Cart cart = getCartByUser(user);
        if (cart != null) {
            for (CartItem item : cart.getCartItems()) {
                em.remove(item);
            }
            cart.getCartItems().clear();
            em.merge(cart);
        }
    }
}