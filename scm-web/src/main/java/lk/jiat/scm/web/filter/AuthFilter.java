package lk.jiat.scm.web.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.jiat.scm.entities.entity.User;
import lk.jiat.scm.entities.entity.UserStatus;

import java.io.IOException;
import java.util.Set;

@WebFilter(urlPatterns = {
        "/index.jsp",
        "/index",
        "/place-order.jsp",
        "/products.jsp",
        "/login.jsp",
        "/login"
})
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;

        httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        httpResponse.setHeader("Pragma", "no-cache");
        httpResponse.setDateHeader("Expires", 0);

        HttpSession session = httpRequest.getSession(false);
        String requestURI = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();

        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);
        boolean isLoginRequest = requestURI.endsWith("login.jsp") || requestURI.endsWith("/login");

        if (isLoggedIn && isLoginRequest) {
            httpResponse.sendRedirect(contextPath + "/index");
            return;
        }

        if (!isLoggedIn) {
            if (isLoginRequest) {
                filterChain.doFilter(servletRequest, servletResponse);
                return;
            }
            httpResponse.sendRedirect(contextPath + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");
        Set<String> roles = user.getRoles();

        boolean isAuthorized = (user.getUserStatus() == UserStatus.APPROVED
                && roles != null
                && roles.contains("CUSTOMER"));

        if (isAuthorized || isLoginRequest) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            httpResponse.sendRedirect(contextPath + "/login.jsp?error=unauthorized");
        }
    }
}