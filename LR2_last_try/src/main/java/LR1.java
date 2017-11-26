import utils.DatabaseUtils;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/LR1", initParams = {@WebInitParam(name = "bookmark", value = "short_description")})
public class LR1 extends HttpServlet {

    private String defaultMethod;

    @Override
    public void init(ServletConfig config) throws ServletException {
        defaultMethod = config.getInitParameter("bookmark");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setAttribute("toy", DatabaseUtils.getToy(Long.parseLong(request.getParameter("id"))));
        request.setAttribute("bookmark", defaultMethod);
        request.getRequestDispatcher("/page.jsp").forward(request, response);
    }
}
