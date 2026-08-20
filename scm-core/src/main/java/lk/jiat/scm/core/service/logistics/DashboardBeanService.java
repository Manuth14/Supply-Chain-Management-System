package lk.jiat.scm.core.service.logistics;

import jakarta.ejb.Local;
import lk.jiat.scm.core.exceptions.DashboardServiceException;
import lk.jiat.scm.core.exceptions.ResourceNotFoundException;
import lk.jiat.scm.entities.entity.ShipmentStatus;

import java.util.Map;

@Local
public interface DashboardBeanService {
    Map<String, Object> getDashboardMetrics() throws DashboardServiceException;
    void updateShipmentStatus(Long shipmentId, ShipmentStatus status, String currentLocation) throws ResourceNotFoundException;
}
