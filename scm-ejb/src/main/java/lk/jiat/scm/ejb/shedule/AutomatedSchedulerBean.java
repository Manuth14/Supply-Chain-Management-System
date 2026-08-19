package lk.jiat.scm.ejb.shedule;

import jakarta.ejb.Schedule;
import jakarta.ejb.Singleton;
import jakarta.ejb.Startup;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lk.jiat.scm.entities.entity.Product;
import lk.jiat.scm.entities.entity.ShipmentStatus;
import lk.jiat.scm.entities.entity.ShipmentTracking;

import java.time.LocalDateTime;
import java.util.List;

@Singleton
@Startup
public class AutomatedSchedulerBean {

    @PersistenceContext
    private EntityManager em;

    @Schedule(hour = "*", minute = "0", second = "0", persistent = false)
    public void processShipmentTracking() {
        System.out.println("[BACKGROUND SCHEDULER] Updating active shipments status...");

        List<ShipmentTracking> activeShipments = em.createQuery(
                        "SELECT s FROM ShipmentTracking s WHERE s.status <> :deliveredStatus", ShipmentTracking.class)
                .setParameter("deliveredStatus", ShipmentStatus.DELIVERED)
                .getResultList();

        for (ShipmentTracking shipment : activeShipments) {

            if (shipment.getStatus() == ShipmentStatus.ORDER_PLACED) {
                shipment.setStatus(ShipmentStatus.DISPATCHED);
                shipment.setCurrentLocation("Central Hub - Colombo");
            } else if (shipment.getStatus() == ShipmentStatus.DISPATCHED) {
                shipment.setStatus(ShipmentStatus.IN_TRANSIT);
                shipment.setCurrentLocation("In-flight / International Port");
            } else if (shipment.getStatus() == ShipmentStatus.IN_TRANSIT) {
                shipment.setStatus(ShipmentStatus.DELIVERED);
                shipment.setCurrentLocation("Destination Reached");
            }

            shipment.setUpdatedAt(LocalDateTime.now());
            em.merge(shipment);
        }
    }

    @Schedule(hour = "12", minute = "0", second = "0", persistent = false)
    public void checkInventoryLevels() {
        System.out.println("[AUTOMATED SERVICE] Running Inventory Replenishment Check...");

        List<Product> lowStockProducts = em.createQuery(
                        "SELECT p FROM Product p WHERE p.stock <= p.reorderLevel", Product.class)
                .getResultList();

        for (Product product : lowStockProducts) {
            System.out.println("[ALERT] Low stock detected for: " + product.getName() +
                    " | Current Stock: " + product.getStock());

            product.setStock(product.getStock() + 100);
            em.merge(product);
        }
    }
}
