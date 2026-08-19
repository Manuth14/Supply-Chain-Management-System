package lk.jiat.scm.core.exceptions;

import jakarta.ejb.ApplicationException;

@ApplicationException(rollback = true)
public class CartItemNotFoundException extends Exception {
    public CartItemNotFoundException(String message) {
        super(message);
    }
}
