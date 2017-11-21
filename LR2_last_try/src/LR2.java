import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LR2")
public class LR2 extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getCookies() != null){
            for (Cookie cookie : request.getCookies()){
                if (cookie.getName().equals("toy"))
                    request.setAttribute("toy", cookie.getValue());
                if (cookie.getName().equals("language"))
                    request.setAttribute("language", cookie.getValue());
            }
        }

        if (request.getAttribute("language") == null){
            request.setAttribute("language", getInitParameter("defaultLanguage"));
        }
        if (request.getAttribute("toy") == null){
            request.setAttribute("toy", getInitParameter("defaultToy"));
        }


        if (request.getParameter("toy") != null){
            Cookie toy = new Cookie("toy", request.getParameter("toy"));
            toy.setMaxAge(60*60*24);
            response.addCookie(toy);
        }

        if (request.getParameter("language") != null){
            Cookie language = new Cookie("language", request.getParameter("language"));
            language.setMaxAge(60*60*24);
            response.addCookie(language);
        }
        getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
        //request.getRequestDispatcher("/index.jsp").forward(request,response);
    }
}
