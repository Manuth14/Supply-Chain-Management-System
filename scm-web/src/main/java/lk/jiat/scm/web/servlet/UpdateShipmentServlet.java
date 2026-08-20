package lk.jiat.scm.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.scm.core.service.logistics.DashboardBeanService;
import lk.jiat.scm.entities.entity.ShipmentStatus;

import java.io.IOException;

@WebServlet(name = "UpdateShipmentServlet", urlPatterns = {"/logistics/update-shipment"})
public class UpdateShipmentServlet extends HttpServlet {

    @EJB
    private DashboardBeanService dashboardService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Long shipmentId = Long.parseLong(request.getParameter("shipmentId"));
            ShipmentStatus status = ShipmentStatus.valueOf(request.getParameter("status"));
            String currentLocation = request.getParameter("currentLocation");

            dashboardService.updateShipmentStatus(shipmentId, status, currentLocation);

            response.sendRedirect(request.getContextPath() + "/logistics/dashboard?success=true");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/logistics/dashboard?error=true");
        }
    }
}