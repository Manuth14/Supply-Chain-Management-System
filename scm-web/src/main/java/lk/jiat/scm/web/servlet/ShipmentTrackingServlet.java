package lk.jiat.scm.web.servlet;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.scm.entities.entity.ShipmentTracking;
import java.io.IOException;

@WebServlet("/track-shipment")
public class ShipmentTrackingServlet extends HttpServlet {

    @PersistenceContext
    private EntityManager em;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // URL eken orderId eka gannawa (e.g., track-shipment?orderId=1)
        String orderIdParam = request.getParameter("orderId");

        if (orderIdParam != null && !orderIdParam.isEmpty()) {
            try {
                Long orderId = Long.parseLong(orderIdParam);

                // Database eken Order ID ekata adala tracking details query karanawa
                ShipmentTracking tracking = em.createQuery(
                                "SELECT s FROM ShipmentTracking s WHERE s.order.id = :orderId", ShipmentTracking.class)
                        .setParameter("orderId", orderId)
                        .getResultStream()
                        .findFirst()
                        .orElse(null);

                if (tracking != null) {
                    request.setAttribute("tracking", tracking);
                } else {
                    request.setAttribute("errorMessage", "No tracking information found for this Order ID.");
                }

            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Invalid Order ID format.");
            }
        } else {
            request.setAttribute("errorMessage", "Order ID is missing.");
        }

        // track-shipment.jsp ekata forward karanawa
        request.getRequestDispatcher("track-shipment.jsp").forward(request, response);
    }
}
