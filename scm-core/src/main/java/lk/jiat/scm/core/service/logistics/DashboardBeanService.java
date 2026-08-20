package lk.jiat.scm.core.service.logistics;

import jakarta.ejb.Local;
import lk.jiat.scm.core.exceptions.DashboardServiceException;
import lk.jiat.scm.core.exceptions.ResourceNotFoundException;
import lk.jiat.scm.entities.entity.CustomsDocument;
import lk.jiat.scm.entities.entity.Route;
import lk.jiat.scm.entities.entity.ShipmentStatus;
import lk.jiat.scm.entities.entity.ShipmentTracking;

import java.util.List;
import java.util.Map;

@Local
public interface DashboardBeanService {
    Map<String, Object> getDashboardMetrics() throws DashboardServiceException;
    void updateShipmentStatus(Long shipmentId, ShipmentStatus status, String currentLocation) throws ResourceNotFoundException;
    List<ShipmentTracking> getAllShipments() throws DashboardServiceException;
    List<CustomsDocument> getAllCustomsDocuments() throws DashboardServiceException;
    List<Route> getAllRoutes() throws DashboardServiceException;
}
