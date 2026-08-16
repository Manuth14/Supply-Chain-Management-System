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

import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    @EJB
    private UserBeanService userBeanService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // 1. EJB එක මඟින් Login ක්‍රියාවලිය පරීක්ෂා කිරීම
            boolean isAuthenticated = userBeanService.login(email, password);

            if (isAuthenticated) {
                // 2. අදාළ යුසර්ගේ විස්තර ලබාගෙන Session එකක තබා ගැනීම (අවශ්‍ය නම්)
                User user = userBeanService.findByEmail(email);

                HttpSession session = request.getSession();
                session.setAttribute("user", user); // Session එකට user object එක දැමීම

                // 3. සාර්ථක නම් ඩෑෂ්බෝඩ් එකකට රීඩිරෙක්ට් කිරීම
                response.sendRedirect("index");
            }
        } catch (InvalidCredentialException e) {
            // 4. යුසර් හෝ පාස්වර්ඩ් වැරදි නම් දෝෂය සමඟ නැවත ලොගින් පේජ් එකටම යැවීම
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } catch (Exception e) {
            // වෙනත් අනපේක්ෂිත දෝෂ සඳහා
            request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    // බ්‍රව්සරයෙන් කෙලින්ම /login URL එක ගැහුවොත් login.jsp එකට යැවීමට
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            // ලොග් වී සිටී නම් නැවත ලොගින් පේජ් එකට යාමට නොදී ඩෑෂ්බෝඩ් එකටම යැවීම
            response.sendRedirect("index");
            return;
        }

        // 2. බ්‍රව්සරය මඟින් Login පේජ් එක Cache කිරීම වැළැක්වීම සඳහා (Browser Caching Disable කිරීම)
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setDateHeader("Expires", 0); // Proxies

        // 3. ලොගින් පේජ් එක පෙන්වීම
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}