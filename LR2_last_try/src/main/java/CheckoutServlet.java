import utils.CommonUtils;
import utils.DatabaseUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/Checkout")
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/checkout.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Boolean isPickup = req.getParameter("isPickup").equals("true");
        String shopId = req.getParameter("shopId");
        String address = req.getParameter("address");
        DatabaseUtils.addOrder(req.getSession(), req.getUserPrincipal(), isPickup, shopId, address);
        CommonUtils.cleanCart(req.getSession());
    }
}
