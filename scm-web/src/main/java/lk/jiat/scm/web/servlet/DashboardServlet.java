package lk.jiat.scm.web.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.jiat.scm.entities.entity.User;
import lk.jiat.scm.entities.entity.UserStatus;

import java.io.IOException;
import java.util.Set;

@WebServlet(name = "DashboardServlet", value = "/index")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || user.getUserStatus() != UserStatus.APPROVED) {
            response.sendRedirect("login");
            return;
        }

        Set<String> roles = user.getRoles();
        boolean isCustomer = roles != null && (roles.contains("CUSTOMER"));

        if (!isCustomer) {
            response.sendRedirect("error.jsp");
            return;
        }

        req.getRequestDispatcher("index.jsp").forward(req, response);
    }
}