package lk.jiat.scm.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.jiat.scm.core.exceptions.DashboardServiceException;
import lk.jiat.scm.core.service.logistics.DashboardBeanService;

import java.io.IOException;
import java.util.Map;

@WebServlet(name = "LogisticsDashboardServlet", urlPatterns = {"/logistics/dashboard"})
public class LogisticsDashboardServlet extends HttpServlet {

    @EJB
    private DashboardBeanService dashboardService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        try {
            Map<String, Object> metrics = dashboardService.getDashboardMetrics();

            request.setAttribute("totalShipments", metrics.get("totalShipments"));
            request.setAttribute("activeRoutes", metrics.get("activeRoutes"));
            request.setAttribute("inTransitCount", metrics.get("inTransitCount"));
            request.setAttribute("deliveredCount", metrics.get("deliveredCount"));
            request.setAttribute("activeShipments", metrics.get("activeShipments"));

            request.getRequestDispatcher("/logistics/dashboard.jsp").forward(request, response);

        } catch (DashboardServiceException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
