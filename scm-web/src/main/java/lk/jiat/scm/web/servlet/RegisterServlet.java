package lk.jiat.scm.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.scm.core.service.UserBeanService;
import lk.jiat.scm.entities.entity.UserStatus;

import java.io.IOException;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {

    @EJB
    private UserBeanService userBean;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String status = request.getParameter("status");

        boolean isRegistered = userBean.registerUser(firstName, lastName, email, password, status, role);

        if (isRegistered) {
            response.sendRedirect("login.jsp?success=1");
        } else {
            response.sendRedirect("signup.jsp?error=exists");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }
}
