import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.Locale;
import java.util.ResourceBundle;

@WebServlet(name = "main.java.LR1.LR1")
public class LR1 extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        StringBuilder sb = new StringBuilder();

        ResourceBundle rb;
        String defaultLanguage = getInitParameter("defaultLanguage");

        File file = new File("C:\\Users\\User\\IdeaProjects\\LR2_last_try\\src");
        URL[] urls = {file.toURI().toURL()};
        ClassLoader loader = new URLClassLoader(urls);
        rb = ResourceBundle.getBundle("_language", Locale.forLanguageTag(defaultLanguage), loader);

        String language = request.getParameter("language");

        if (language != null) {
            language = language.toLowerCase();
            if (language.equals("ru")) {
                rb = ResourceBundle.getBundle("_language", Locale.forLanguageTag("ru"), loader);
            }
            if (language.equals("en")) {
                rb = ResourceBundle.getBundle("_language", Locale.forLanguageTag("en"), loader);
            }
            if (language.equals("de")) {
                rb = ResourceBundle.getBundle("_language", Locale.forLanguageTag("de"), loader);
            }
        }
        else {
            language = defaultLanguage;
        }


        sb.append("<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <script>\n" +
                "        var language = '"+ language +"'; "+
                "         function changeDescription(param){\n" +
                "            switch(param){\n" +
                "                case \"short_description\":{\n" +
                "                    var text = \"<p align=\\\"center\\\" style=\\\"margin-right: 80px\\\">\\n\" +\n" +
                "                        \"                "+ rb.getString("description")+"<br>\\n\" +\n" +
                "                        \"            </p>\";\n" +

                "                    document.getElementById(\"text\").innerHTML = text;\n" +
                "                    break;\n" +
                "                }\n" +
                "                case \"detail_description\":{\n" +
                "                    var text = \"<p align=\\\"center\\\" >\\n\" +\n" +
                "                        \"                "+rb.getString("detail_description")+"<br>\\n\" +\n" +
                "                        \"            </p>\";\n" +
                "                    document.getElementById(\"text\").innerHTML = text;\n" +
                "                    break;\n" +
                "                }\n" +
                "                case \"feedbacks\":{\n" +
                "                    var text = \"<p align=\\\"center\\\" style=\\\"margin-right: 80px\\\">\\n\" +\n" +
                "                        \"                <b>"+rb.getString("feedbacks")+"</b><br>\\n\" +\n" +
                "                        \"            </p>\\n\" +\n" +
                "                        \"            <table border=\\\"1\\\"; width=\\\"300px\\\" style=\\\"background: pink\\\" height=\\\"60px\\\">\\n\" +\n" +
                "                        \"                <tr>\\n\" +\n" +
                "                        \"                    <td><b>Daniil</b></td>\\n\" +\n" +
                "                        \"                </tr>\\n\" +\n" +
                "                        \"                <tr>\\n\" +\n" +
                "                        \"                    <td>Замечательный енот!</td>\\n\" +\n" +
                "                        \"                </tr>\\n\" +\n" +
                "                        \"            </table>\";\n" +
                "                    document.getElementById(\"text\").innerHTML = text;\n" +
                "                    break;\n" +
                "                }\n" +
                "            }\n" +
                "        }\n" +
                "        function forwardBasket(name){\n" +
                "          if (name === undefined)\n" +
                "              location.href = \"http://localhost:8080/Basket?language=\" + language;\n" +
                "          else\n" +
                "              location.href = \"http://localhost:8080/Basket?language=\" + language + \"&\" + name + \"=1\";\n" +
                "      }" +
                "    </script>\n" +
                "    <style>\n" +
                "        body {\n" +
                "            background: rgb(255, 174, 192);\n" +
                "        }\n" +
                "        #square{\n" +
                "            width: 74%;\n" +
                "            height: 700px;\n" +
                "            background: white;\n" +
                "            margin-top: 5%;\n" +
                "            margin-left:  13%;\n" +
                "            margin-right: 13%;\n" +
                "            margin-bottom: 7%;\n" +
                "        }\n" +
                "\n" +
                "        #line{\n" +
                "            width: 100%;\n" +
                "            height: 80px;\n" +
                "            background: rgb(215, 0, 70);\n" +
                "            margin-top: 5%;\n" +
                "        }\n" +
                "\n" +
                "        #picture{\n" +
                "            float: left;\n" +
                "            width: 33%;\n" +
                "            height: 413px;\n" +
                "            background: lightgrey;\n" +
                "            margin-top: 20px;\n" +
                "            margin-left:  70px;\n" +
                "            /*margin-right: 67%;*/\n" +
                "        }\n" +
                "\n" +
                "        h1 {\n" +
                "            color: white;\n" +
                "        }\n" +
                "\n" +
                "        h2{\n" +
                "            color: rgb(215, 0, 70);\n" +
                "        }\n" +
                "\n" +
                "        #description{\n" +
                "            float: right;\n" +
                "            margin-top: 70px;\n" +
                "            width: 55%;\n" +
                "            height: 10px;\n" +
                "        }\n" +
                "        .button_style {\n" +
                "            margin-right: 15px;\n" +
                "            border: 0;\n" +
                "            background: lightgrey;\n" +
                "            width: 145px;\n" +
                "            height: 40px;\n" +
                "        }\n" +
                "\n" +
                "        #buy{\n" +
                "            float: left;\n" +
                "            margin-top: 30px;\n" +
                "            margin-left: 100px;\n" +
                "            width: 120px;\n" +
                "            heigth: 50px;\n" +
                "            background: rgb(215, 0, 70);\n" +
                "        }\n" +
                "           #title_href{\n" +
                        "            text-decoration: none;\n" +
                        "        }\n" +
                        "        #title_href:active{\n" +
                        "            text-decoration: underline;\n" +
                        "        }" +
                "\n" +
                "        .button_style:hover {\n" +
                "            background: pink;\n" +
                "        }\n" +
                "        .button_style:active {\n" +
                "            background: rgb(215, 0, 70);\n" +
                "        }" +
                "       #title_href:hover{\n" +
                        "            cursor: pointer;\n" +
                        "        }" +
                "\n" +
                "    </style>\n" +
                "</head>\n" +
                "<body>\n" +
                "\n" +
                "<div id=\"square\">\n" +
                "    <div id=\"line\">\n" +
                "     <a id=\"title_href\" onclick=\"location.href = 'http://localhost:8080/LR2?language=' + language\">" +
                "            <h1 align=\"center\" style=\"font-style: normal; font-size: 60px\"> Mimimishka</h1>\n" +
                "        </a>" +
                "    </div>\n" +
                "    <br>\n" +
                "    <div id=\"language\" style=\"float: right; margin-right: 10px\">\n" +
                "        <a href=\"http://localhost:8080/LR1?language=ru\">\n" +
                "            <img src=\"rus.jpg\" width=\"50\" height=\"25\" style=\"margin-right: 10px\">\n" +
                "        </a>\n" +
                "        <a href=\"http://localhost:8080/LR1?language=en\">\n" +
                "            <img src=\"en.png\" width=\"50\" height=\"25\" style=\"margin-right: 10px\">\n" +
                "        </a>\n" +
                "        <a href=\"http://localhost:8080/LR1?language=de\">\n" +
                "            <img src=\"de.jpg\" width=\"50\" height=\"25\" style=\"margin-right: 10px\">\n" +
                "        </a>\n" +
                "    </div>\n" +
                "\n" +
                "    <div style=\"clear: both\"></div>\n" +
                "    <div id=\"picture\">\n" +
                "        <h2 align=\"center\" style=\"font_stile: normal; font-size: 50px; margin-top: 0\">"+rb.getString("enotic_title")+"</h2>\n" +
                "        <img src=\"enot1.jpg\" width=\"300\" height=\"300\" style=\"margin-left: 13px\">\n" +
                "<div id=\"buy\">\n" +
                "            <button style=\"background: none; border: 0; width: 120px\" onclick=\"forwardBasket('Racoon'); return false;\">\n" +
                "                <h3 align = \"center\"; style=\"font-size: 25px;color: white\">\n" +
                "                    "+rb.getString("buy")+"\n" +
                "                </h3>\n" +
                "            </button>\n" +
                "        </div>" +
                "    </div>\n" +
                "    <div id=\"description\">\n" +
                "        <div id=\"bookmarks\" style=\"\">\n" +
                "            <button id=\"short_description\" class=\"button_style\" onclick=\"changeDescription('short_description')\">\n" +
                "                "+rb.getString("description_title")+"\n" +
                "            </button>\n" +
                "            <button id=\"detail_description\" width=\"150px \" class=\"button_style\" onclick=\"changeDescription('detail_description')\">\n" +
                "                "+rb.getString("detail_description_title")+"\n" +
                "            </button>\n" +
                "            <button id=\"feedbacks\" class=\"button_style\" onclick=\"changeDescription('feedbacks')\">\n" +
                "                "+rb.getString("feedbacks_title")+"\n" +
                "            </button>\n" +
                "        </div>\n" +
                "        <br><br>\n" +
                "        <div id=\"text\">\n" +
                "\n" +
                "        </div>\n" +
                "    </div>\n" +
                "</div>\n" +
                "</body>\n" +
                "<script>" +
                "changeDescription('"+ getInitParameter("bookmark") +"')" +
                "</script>" +
                "</html>");
        PrintWriter out = response.getWriter();
        out.println(sb);
        out.close();
    }
}
