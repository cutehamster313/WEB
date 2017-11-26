package utils;

import entities.Toy;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.ISODateTimeFormat;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

public class CommonUtils {

    public static List<Toy> getToysForCategory(HttpServletRequest req, HttpServletResponse resp) {
        return DatabaseUtils.getAllToys(getToyCategoryCookie(req, resp));
    }

    public static String getLanguageCookie(HttpServletRequest req, HttpServletResponse resp) {
        String locale = getCookie(req, resp, "language", "ru").toLowerCase();
        if (locale.equals("en")) {
            return "en_GB";
        } else {
            return locale + "_" + locale.toUpperCase();
        }
    }

    public static String getToyCategoryCookie(HttpServletRequest req, HttpServletResponse resp) {
        return getCookie(req, resp, "toy", "0");
    }

    private static String getCookie(HttpServletRequest req, HttpServletResponse resp, String id, String defaultValue) {
        if (req.getCookies() != null) {
            for (Cookie cookie : req.getCookies()) {
                if (cookie.getName().equals(id)) {
                    return cookie.getValue();
                }
            }
        }
        resp.addCookie(new Cookie(id, defaultValue));
        return defaultValue;
    }

    public static String getUserName(HttpServletRequest req) {
        if (req.getUserPrincipal() == null) {
            return "";
        } else {
            return req.getUserPrincipal().getName();
        }
    }

    public static void logout(HttpServletRequest req) {
        req.getSession().invalidate();
    }

    public static void cleanCart(HttpSession session) {
        Enumeration param = session.getAttributeNames();
        List<String> itemsToDelete = new ArrayList<>();
        String name;
        while (param.hasMoreElements()) {
            name = (String) param.nextElement();
            if (!name.equals("language")) {
                itemsToDelete.add(name);
            }
        }

        itemsToDelete.forEach(session::removeAttribute);
    }

    public static boolean checkCart(HttpServletRequest req) {
        Enumeration param = req.getSession().getAttributeNames();
        String name;
        while (param.hasMoreElements()) {
            name = (String) param.nextElement();
            if (isNumeric(name) && !req.getSession().getAttribute(name).equals("0")) {
                return true;
            }
        }
        return false;
    }

    public static String getDateForUser(String date) {
        return DateTimeFormat.forPattern("dd.MM.yyyy HH.mm.ss")
                .print(ISODateTimeFormat.dateTime().parseDateTime(date));
    }

    private static boolean isNumeric(String number) {
        try {
            Integer i = Integer.parseInt(number);
        } catch (NumberFormatException e) {
            return false;
        }
        return true;
    }

    public static Toy getToy(String number) {
        if (isNumeric(number)) {
            return DatabaseUtils.getToy(Long.parseLong(number));
        } else {
            return null;
        }
    }

    public static int countCart(HttpServletRequest req) {
        Enumeration param = req.getSession().getAttributeNames();
        String name;
        int count = 0;
        while (param.hasMoreElements()) {
            name = (String) param.nextElement();
            if (isNumeric(name)) {
                count += getToy(name).getCost() * (Integer) req.getSession().getAttribute(name);
            }
        }
        return count;
    }

}
