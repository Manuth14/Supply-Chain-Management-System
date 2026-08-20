package lk.jiat.scm.ejb.bean.logistics;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lk.jiat.scm.core.exceptions.DashboardServiceException;
import lk.jiat.scm.core.exceptions.ResourceNotFoundException;
import lk.jiat.scm.core.service.logistics.DashboardBeanService;
import lk.jiat.scm.entities.entity.*;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Stateless
public class DashboardBean implements DashboardBeanService {

    @PersistenceContext
    private EntityManager em;

    @Override
    public Map<String, Object> getDashboardMetrics() throws DashboardServiceException {
        Map<String, Object> metrics = new HashMap<>();

        try {
            List<Object[]> results = em.createQuery(
                            "SELECT s.status, COUNT(s) FROM ShipmentTracking s GROUP BY s.status", Object[].class)
                    .getResultList();

            Long activeRoutes = em.createQuery("SELECT COUNT(r) FROM Route r WHERE r.status = :status", Long.class)
                    .setParameter("status", RouteStatus.ACTIVE)
                    .getSingleResult();

            List<ShipmentTracking> activeShipments = em.createQuery(
                            "SELECT s FROM ShipmentTracking s ORDER BY s.updatedAt DESC", ShipmentTracking.class)
                    .getResultList();

            Long totalShipments = 0L;
            Long inTransitCount = 0L;
            Long deliveredCount = 0L;

            for (Object[] row : results) {
                ShipmentStatus status = (ShipmentStatus) row[0];
                Long count = (Long) row[1];

                totalShipments += count;

                if (status == ShipmentStatus.IN_TRANSIT) {
                    inTransitCount = count;
                } else if (status == ShipmentStatus.DELIVERED) {
                    deliveredCount = count;
                }
            }

            metrics.put("totalShipments", totalShipments);
            metrics.put("activeRoutes", activeRoutes != null ? activeRoutes : 0L);
            metrics.put("inTransitCount", inTransitCount);
            metrics.put("deliveredCount", deliveredCount);
            metrics.put("activeShipments", activeShipments);

        } catch (Exception e) {
            e.printStackTrace();
            throw new DashboardServiceException("Failed to retrieve dashboard metrics from database");
        }

        return metrics;
    }

    @Override
    public void updateShipmentStatus(Long shipmentId, ShipmentStatus status, String currentLocation) throws ResourceNotFoundException {
        try {
            ShipmentTracking shipment = em.find(ShipmentTracking.class, shipmentId);
            if (shipment != null) {
                shipment.setStatus(status);
                if (currentLocation != null && !currentLocation.trim().isEmpty()) {
                    shipment.setCurrentLocation(currentLocation);
                }
                shipment.setUpdatedAt(LocalDateTime.now());
                em.merge(shipment);
            } else {
                throw new ResourceNotFoundException("Shipment not found with ID: " + shipmentId);
            }
        } catch (Exception e) {
            throw new ResourceNotFoundException(e.getMessage());
        }
    }

    @Override
    public List<ShipmentTracking> getAllShipments() throws DashboardServiceException {
        try {
            return em.createQuery("SELECT s FROM ShipmentTracking s ORDER BY s.updatedAt DESC", ShipmentTracking.class)
                    .getResultList();
        } catch (Exception e) {
            throw new DashboardServiceException("Failed to fetch shipments list");
        }
    }

    @Override
    public List<CustomsDocument> getAllCustomsDocuments() throws DashboardServiceException {
        try {
            return em.createQuery("SELECT c FROM CustomsDocument c ORDER BY c.id DESC", CustomsDocument.class)
                    .getResultList();
        } catch (Exception e) {
            throw new DashboardServiceException("Failed to fetch customs compliance documents");
        }
    }

    @Override
    public List<Route> getAllRoutes() throws DashboardServiceException {
        try {
            return em.createQuery("SELECT r FROM Route r ORDER BY r.id DESC", Route.class)
                    .getResultList();
        } catch (Exception e) {
            throw new DashboardServiceException("Failed to fetch routes list");
        }
    }
}