package lk.jiat.scm.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.jiat.scm.core.service.CartBeanService;
import lk.jiat.scm.entities.entity.User;

import java.io.IOException;
import java.math.BigDecimal;

@WebServlet(name = "CartServlet", value = "/place-order")
public class CartServlet extends HttpServlet {

    @EJB
    private CartBeanService cartBeanService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        String productIdStr = request.getParameter("productId");

        if (productIdStr != null && !productIdStr.isEmpty()) {
            try {
                Long productId = Long.parseLong(productIdStr);

                BigDecimal weight = new BigDecimal("1.00");

                cartBeanService.addToCart(user, productId, weight);

                response.sendRedirect("place-order.jsp?success=added");

            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("products.jsp?error=failed");
            }
        } else {
            response.sendRedirect("products.jsp?error=invalid_product");
        }
    }

}
