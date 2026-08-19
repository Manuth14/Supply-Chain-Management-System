package lk.jiat.scm.ejb.bean;

import jakarta.ejb.Stateless;
import jakarta.ejb.TransactionAttribute;
import jakarta.ejb.TransactionAttributeType;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lk.jiat.scm.core.service.ProductBeanService;
import lk.jiat.scm.entities.entity.Product;

import java.util.List;

@Stateless
@TransactionAttribute(TransactionAttributeType.REQUIRED)
public class ProductBean implements ProductBeanService {

    @PersistenceContext(unitName = "SCMPU")
    private EntityManager em;

    @Override
    public List<Product> getAllProducts() {
        return em.createQuery("SELECT p FROM Product p", Product.class).getResultList();
    }
}
