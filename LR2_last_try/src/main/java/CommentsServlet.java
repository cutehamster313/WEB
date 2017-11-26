import entities.Comment;
import org.joda.time.DateTime;
import org.joda.time.format.ISODateTimeFormat;
import utils.DatabaseUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/Comments")
public class CommentsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("comments.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DatabaseUtils.addEntity(new Comment(req.getUserPrincipal().getName(), req.getParameter("commentText"),
                ISODateTimeFormat.dateTime().print(new DateTime())));
    }
}
