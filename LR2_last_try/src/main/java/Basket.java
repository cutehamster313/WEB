import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Enumeration;

@WebServlet(urlPatterns = "/Basket")
public class Basket extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Enumeration param = req.getParameterNames();
        String name;
        int flag;
        while (param.hasMoreElements()) {
            name = (String) param.nextElement();
            if (name.equals("language")) {
                continue;
            }

            flag = Integer.parseInt(req.getParameter(name));
            HttpSession session = req.getSession();

            int count = session.getAttribute(name) == null ?
                    1 : (Integer) session.getAttribute(name) + flag;
            session.setAttribute(name, count);
            if (count > 0) {
                session.setAttribute(name, count);
            } else {
                session.removeAttribute(name);
            }
        }
        req.getRequestDispatcher("/basket.jsp").forward(req, resp);
    }
}
