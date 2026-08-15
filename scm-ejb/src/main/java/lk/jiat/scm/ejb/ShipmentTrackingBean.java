package lk.jiat.scm.ejb;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lk.jiat.scm.entities.entity.User;

@Stateless
public class ShipmentTrackingBean {

    // scm-entities එකේ persistence.xml එකේ දීපු PU නම මෙතැනට දෙන්න
    @PersistenceContext(unitName = "SCMPU")
    private EntityManager entityManager;

    public String trackShipment(String trackingNumber) {
        return "Tracking logistics data for shipment ID: " + trackingNumber;
    }

    // අලුත් User කෙනෙක් ඩේටාබේස් එකට සේව් කරන මෙතඩ් එක
    public String registerUser(String email, String password, String fullName) {
        try {
            User user = new User();
            user.setEmail(email);
            user.setPassword(password); // ඇත්ත ප්‍රොජෙක්ට් වලදී පාස්වර්ඩ් එක Hash කරන්න ඕනේ
            user.setFirstName(fullName);

            entityManager.persist(user);
            return "User successfully registered and saved to database!";
        } catch (Exception e) {
            return "Error saving user: " + e.getMessage();
        }
    }
}