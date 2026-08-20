package lk.jiat.scm.web.servlet;

import jakarta.ejb.EJB;
import jakarta.ejb.EJBException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.jiat.scm.core.exceptions.InvalidCredentialException;
import lk.jiat.scm.core.service.UserBeanService;
import lk.jiat.scm.entities.entity.User;
import lk.jiat.scm.entities.entity.UserStatus;

import java.io.IOException;
import java.util.Set;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    @EJB
    private UserBeanService userBeanService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String contextPath = request.getContextPath();

        try {
            boolean isAuthenticated = userBeanService.login(email, password);

            if (isAuthenticated) {
                User user = userBeanService.findByEmail(email);

                if (user.getUserStatus() == UserStatus.APPROVED) {

                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);

                    Set<String> roles = user.getRoles();
                    String redirectUrl = contextPath + "/index";

                    if (roles != null && !roles.isEmpty()) {
                        if (roles.contains("ADMIN")) {
                            redirectUrl = contextPath + "/admin/customs-compliance.jsp";
                        } else if (roles.contains("LOGISTICS_STAFF")) {
                            redirectUrl = contextPath + "/logistics/dashboard";
                        } else if (roles.contains("VENDOR")) {
                            redirectUrl = contextPath + "/vendor/dashboard.jsp";
                        } else if (roles.contains("CUSTOMER")) {
                            redirectUrl = contextPath + "/index";
                        }
                    }
                    response.sendRedirect(redirectUrl);
                } else {
                    request.setAttribute("errorMessage", "Your account is still pending approval. Please wait!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        } catch (InvalidCredentialException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/index");
            return;
        }

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}