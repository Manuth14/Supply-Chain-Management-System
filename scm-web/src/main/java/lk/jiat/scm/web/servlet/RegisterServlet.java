package lk.jiat.scm.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.scm.core.service.UserBeanService;

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

        boolean isRegistered = userBean.registerUser(firstName, lastName, email, password, role);

        if (isRegistered) {
            // සාර්ථක නම් Login පේජ් එකට යොමු කරන්න
            response.sendRedirect("login.jsp?success=1");
        } else {
            // අසාර්ථක නම් හෝ ඊමේල් එක පවතී නම් ආපසු Signup පේජ් එකටම යවන්න
            response.sendRedirect("signup.jsp?error=exists");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }
}
