package lk.jiat.scm.ejb.bean;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lk.jiat.scm.core.exceptions.TradeComplianceException;
import lk.jiat.scm.core.service.TradeComplianceBeanService;
import lk.jiat.scm.entities.entity.*;
import java.time.LocalDateTime;
import java.util.logging.Logger;

@Stateless
public class TradeComplianceServiceBean implements TradeComplianceBeanService {

    private static final Logger LOGGER = Logger.getLogger(TradeComplianceServiceBean.class.getName());

    @PersistenceContext
    private EntityManager em;

    public void generateComplianceAndCustomsDoc(Order order) throws  TradeComplianceException {
        try {
            if (order == null || order.getId() == 0) {
                throw new IllegalArgumentException("Order cannot be null or invalid.");
            }

            CustomsDocument doc = new CustomsDocument();
            doc.setOrder(order);
            doc.setDocumentType(DocumentType.COMMERCIAL_INVOICE);
            doc.setDeclarationStatus(DeclarationStatus.PENDING);

            // Automated Compliance checks
            doc.setHsCode("HS-9801.00");
            doc.setTradeAgreement("Bilateral Trade Accord 2026");
            doc.setEstimatedDuty(order.getTotalAmount() * 0.05);
            doc.setComplianceStatus(ComplianceStatus.COMPLIANT);
            doc.setGeneratedAt(LocalDateTime.now());

            em.persist(doc);

        } catch (Exception e) {
            LOGGER.severe("Failed to generate trade compliance for order: " + e.getMessage());
            // Custom exception eka throw karanawa (Transaction eka auto rollback wei)
            throw new TradeComplianceException("Customs document generation failed for Order ID: " + order.getId());
        }
    }
}