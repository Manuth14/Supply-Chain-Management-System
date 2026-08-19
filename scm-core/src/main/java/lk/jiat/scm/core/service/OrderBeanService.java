package lk.jiat.scm.core.service;

import jakarta.ejb.Local;
import lk.jiat.scm.core.exceptions.OrderProcessingException;
import lk.jiat.scm.entities.entity.Order;
import lk.jiat.scm.entities.entity.User;

@Local
public interface OrderBeanService {
    Order placeOrder(User user) throws OrderProcessingException;
}
