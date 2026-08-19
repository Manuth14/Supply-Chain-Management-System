package lk.jiat.scm.core.service;

import jakarta.ejb.Local;
import lk.jiat.scm.core.exceptions.CartItemNotFoundException;
import lk.jiat.scm.entities.entity.Cart;
import lk.jiat.scm.entities.entity.User;
import java.math.BigDecimal;

@Local
public interface CartBeanService {
    void addToCart(User user, Long productId, BigDecimal weight);
    void updateCartItemWeight(User user, Long cartItemId, BigDecimal weight) throws CartItemNotFoundException;
    void removeFromCart(User user, Long cartItemId) throws CartItemNotFoundException;
    Cart getCartByUser(User user);
    void clearCart(User user);
}