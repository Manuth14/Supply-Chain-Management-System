package lk.jiat.scm.web.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LogoutServlet", value = "/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. පවතින සෙෂන් එක ලබා ගැනීම (false යෙදීමෙන් අලුත් සෙෂන් එකක් හැදීම වැළකේ)
        HttpSession session = request.getSession(false);

        if (session != null) {
            // 2. සෙෂන් එක සම්පූර්ණයෙන්ම මකා දැමීම (Destroy / Invalidate)
            session.invalidate();
        }

        // 3. බ්‍රව්සරය මඟින් Cache කිරීම වැළැක්වීම (පසුපස බටන් එකෙන් නැවත ඇතුළු වීම වැළැක්වීමට)
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        // 4. ලොගින් පේජ් එකට රීඩිරෙක්ට් කිරීම (අවශ්‍ය නම් මැසේජ් එකක් සමඟ යැවිය හැක)
        response.sendRedirect("login");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}