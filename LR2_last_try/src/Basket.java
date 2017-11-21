import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Enumeration;

@WebServlet(name = "Basket")
public class Basket extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getCookies() != null){
            for (Cookie cookie : req.getCookies()){
                if (cookie.getName().equals("language"))
                    req.setAttribute("language", cookie.getValue());
            }
        }
        if (req.getAttribute("language") == null)  req.setAttribute("language", getInitParameter("defaultLanguage"));

        if (req.getParameter("language") != null){
            Cookie language_cookie = new Cookie("language", req.getParameter("language"));
            language_cookie.setMaxAge(5);
            resp.addCookie(language_cookie);
        }

        Enumeration param = req.getParameterNames();
        String name;
        int flag;
        while (param.hasMoreElements()){
            name = (String)param.nextElement();
            if (name.equals("language")) {
                continue;
            }

            flag = Integer.parseInt(req.getParameter(name));
            HttpSession session = req.getSession();

            int count = session.getAttribute(name) == null ?
                    1 : (Integer)session.getAttribute(name) + flag;
            session.setAttribute(name, count);
            if (count > 0){
                session.setAttribute(name, count);
            }
            else{
                session.removeAttribute(name);
            }
        }
        req.getRequestDispatcher("/basket.jsp").forward(req,resp);
    }
}
