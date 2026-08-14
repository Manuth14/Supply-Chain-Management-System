

import jakarta.ejb.Stateless;

@Stateless
public class ShipmentTrackingBean {

    public String trackShipment(String trackingNumber) {
        // Business logic here
        return "Tracking status for: " + trackingNumber;
    }
}