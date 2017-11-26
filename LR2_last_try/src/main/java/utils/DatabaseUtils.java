package utils;

import entities.*;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.joda.time.DateTime;
import org.joda.time.format.ISODateTimeFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.Enumeration;
import java.util.List;

public class DatabaseUtils {

    private static final SessionFactory ourSessionFactory;

    static {
        try {
            ourSessionFactory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    private static Session getSession() throws HibernateException {
        return ourSessionFactory.openSession();
    }

    public static Toy getToy(long id) {
        try (Session session = getSession()) {
            return session.get(Toy.class, id);
        }
    }

    public static List<Toy> getAllToys(String category) {
        try (Session session = getSession()) {
            if (category.equals("0")) {
                return session.createQuery("from Toy").getResultList();
            } else {
                return session.createQuery("from Toy where category=:category")
                        .setParameter("category", Integer.parseInt(category)).getResultList();
            }

        }
    }

    public static void addOrder(HttpSession session, Principal user, Boolean isPickup, String shopId, String address) {
        Order order;
        String nowDate = ISODateTimeFormat.dateTime().print(new DateTime());
        if (isPickup) {
            order = new Order(user.getName(), nowDate, true, getShop(Long.parseLong(shopId)), null);
        } else {
            order = new Order(user.getName(), nowDate, false, null, address);
        }
        addEntity(order);

        Enumeration param = session.getAttributeNames();
        String name;
        Integer flag;
        while (param.hasMoreElements()) {
            name = (String) param.nextElement();
            if (!isNumeric(name)) {
                continue;
            }

            flag = (Integer) session.getAttribute(name);

            addEntity(new OrderDetail(flag, order, getToy(Long.parseLong(name))));
        }

    }


    public static List<Shop> getShops() {
        try (Session session = getSession()) {
            return session.createQuery("from Shop").getResultList();
        }
    }

    public static void addEntity(Object object) {
        try (Session session = getSession()) {
            Transaction t = session.beginTransaction();
            session.save(object);
            t.commit();
        }
    }

    private static Shop getShop(long shopId) {
        try (Session session = getSession()) {
            return session.get(Shop.class, shopId);
        }
    }

    public static List<Comment> getCommentOfUser(HttpServletRequest req) {
        String login = req.getUserPrincipal().getName();
        try (Session session = getSession()) {
            return session.createQuery("from Comment where userLogin=:login")
                    .setParameter("login", login)
                    .getResultList();
        }
    }

    public static List<Order> getOrdersOfUser(HttpServletRequest req) {
        String login = req.getUserPrincipal().getName();
        try (Session session = getSession()) {
            List<Order> orders = session.createQuery("from Order where userLogin=:login")
                    .setParameter("login", login)
                    .getResultList();
            for (Order order : orders) {
                order.setDetails(session.createQuery("from OrderDetail where order.id=:id")
                        .setParameter("id", order.getId()).getResultList());
            }
            return orders;
        }
    }

    private static boolean isNumeric(String number) {
        try {
            Integer i = Integer.parseInt(number);
        } catch (NumberFormatException e) {
            return false;
        }
        return true;
    }

}
