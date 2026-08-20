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
import lk.jiat.scm.entities.entity.CustomsDocument;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomsComplianceServlet", urlPatterns = {"/logistics/customs-compliance"})
public class CustomsComplianceServlet extends HttpServlet {

    @EJB
    private DashboardBeanService dashboardService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<CustomsDocument> complianceList = dashboardService.getAllCustomsDocuments();

            request.setAttribute("complianceList", complianceList);
            request.getRequestDispatcher("/logistics/customs-compliance.jsp").forward(request, response);

        } catch (DashboardServiceException e) {
            e.printStackTrace();
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