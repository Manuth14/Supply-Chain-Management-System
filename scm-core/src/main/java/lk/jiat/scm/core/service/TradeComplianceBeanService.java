package lk.jiat.scm.core.service;

import jakarta.ejb.Local;
import lk.jiat.scm.core.exceptions.TradeComplianceException;
import lk.jiat.scm.entities.entity.Order;

@Local
public interface TradeComplianceBeanService {
    void generateComplianceAndCustomsDoc(Order Order) throws TradeComplianceException;
}
