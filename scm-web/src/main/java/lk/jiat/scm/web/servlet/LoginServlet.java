package lk.jiat.scm.web.servlet;

import jakarta.ejb.EJB;
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

        try {
            boolean isAuthenticated = userBeanService.login(email, password);

            if (isAuthenticated) {
                User user = userBeanService.findByEmail(email);

                if (user.getUserStatus() == UserStatus.APPROVED) {

                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);

                    Set<String> roles = user.getRoles();
                    String redirectUrl = "index.jsp";

                    if (roles != null && !roles.isEmpty()) {
                        if (roles.contains("CUSTOMER") || roles.contains("CUSTOMER_PORTAL")) {
                            redirectUrl = "index.jsp";
                        } else if (roles.contains("VENDOR")) {
                            redirectUrl = "vendor/dashboard.jsp";
                        } else if (roles.contains("LOGISTICS_STAFF") || roles.contains("LOGISTICS_PERSONNEL")) {
                            redirectUrl = "logistics_dashboard.jsp";
                        } else if (roles.contains("CUSTOMS_OFFICIAL")) {
                            redirectUrl = "customs_documentation.jsp";
                        }
                    }

                    response.sendRedirect(redirectUrl);
                }else {
                    System.out.println("Oya kathai Passe ennaa");
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
            response.sendRedirect("index");
            return;
        }

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}