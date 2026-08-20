package lk.jiat.scm.web.resource;

import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import lk.jiat.scm.core.service.CartBeanService;
import lk.jiat.scm.entities.entity.User;

import java.math.BigDecimal;
import java.util.Map;

@Stateless
@Path("/cart")
public class CartResource {

    @EJB
    private CartBeanService cartBeanService;

    @POST
    @Path("/update")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response updateWeight(Map<String, Object> payload, @Context HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                return Response.status(Response.Status.UNAUTHORIZED).entity(Map.of("error", "Unauthorized")).build();
            }
            User user = (User) session.getAttribute("user");

            Long cartItemId = Long.valueOf(payload.get("cartItemId").toString());
            BigDecimal newWeight = new BigDecimal(payload.get("weight").toString());

            cartBeanService.updateCartItemWeight(user, cartItemId, newWeight);

            return Response.ok(Map.of("status", "success", "message", "Weight updated successfully")).build();
        } catch (Exception e) {
            e.printStackTrace();
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity(Map.of("error", e.getMessage())).build();
        }
    }

    @DELETE
    @Path("/remove/{cartItemId}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response removeItem(@PathParam("cartItemId") Long cartItemId, @Context HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                return Response.status(Response.Status.UNAUTHORIZED).entity(Map.of("error", "Unauthorized")).build();
            }
            User user = (User) session.getAttribute("user");

            cartBeanService.removeFromCart(user, cartItemId);

            return Response.ok(Map.of("status", "success", "message", "Item removed successfully")).build();
        } catch (Exception e) {
            e.printStackTrace();
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity(Map.of("error", e.getMessage())).build();
        }
    }
}