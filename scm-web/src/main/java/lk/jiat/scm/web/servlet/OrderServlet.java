package lk.jiat.scm.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.jiat.scm.core.exceptions.InsufficientStockException;
import lk.jiat.scm.core.exceptions.OrderProcessingException;
import lk.jiat.scm.core.service.OrderBeanService;
import lk.jiat.scm.entities.entity.Order;
import lk.jiat.scm.entities.entity.User;

import java.io.IOException;

@WebServlet(name = "OrderServlet", value = "/order-confirm")
public class OrderServlet extends HttpServlet {

    @EJB
    private OrderBeanService orderService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        try {
            Order order = orderService.placeOrder(user);
            request.setAttribute("order", order);
            RequestDispatcher dispatcher = request.getRequestDispatcher("order-confirm.jsp");
            dispatcher.forward(request, response);

        }catch (OrderProcessingException | InsufficientStockException e){
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("place-order.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
            request.getRequestDispatcher("place-order.jsp").forward(request, response);
        }
    }
}