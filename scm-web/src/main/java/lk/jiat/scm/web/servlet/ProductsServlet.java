package lk.jiat.scm.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.scm.core.service.ProductBeanService;
import lk.jiat.scm.entities.entity.Product;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductsServlet", value = "/products")
public class ProductsServlet extends HttpServlet {

    @EJB
    private ProductBeanService productBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Product> products = productBean.getAllProducts();

        request.setAttribute("productList", products);

        request.getRequestDispatcher("/products.jsp").forward(request, response);
    }
}