package lk.jiat.scm.core.service;

import jakarta.ejb.Local;
import lk.jiat.scm.entities.entity.Product;

import java.util.List;

@Local
public interface ProductBeanService {
    List<Product> getAllProducts();
}
