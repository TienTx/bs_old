/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.order;

import controller.LoadDefaultData;
import dao.book.BookDAO;
import dao.order.CardPointDAO;
import dao.order.CartDAO;
import dao.order.OrderDAO;
import dao.order.PaymentDAO;
import dao.order.ShippingInforDAO;
import dao.person.PersonDAOAbstractFactory;
import dao.person.PersonDAOFactoryProducer;
import entity.book.Book;
import entity.order.BookOrder;
import entity.order.CardPoint;
import entity.order.Cart;
import entity.order.Order;
import entity.order.Payment;
import entity.order.ShippingInfor;
import entity.person.PersonAbstractFactory;
import entity.person.PersonFactoryProducer;
import entity.person.customer.Customer;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author zOzDarKzOz
 */
@Controller
public class OrderCtr {

    @RequestMapping(value = "member/memberorder", method = RequestMethod.POST)
    public @ResponseBody
    String mbAddressShipping(@RequestParam("idCartSave") String idCartSave,
            HttpSession session) {
        String res = "cancelOrder";
        try {
            int idCart = Integer.parseInt(idCartSave);
            Cart cart = new CartDAO().getCarSavedtById(idCart);
            Customer cusMb = (Customer) session.getAttribute("ssLogged");
            if (cart != null && cusMb != null) {
                session.setAttribute("crCartOrder", cart);
                res = cusMb.getCustomerMemberUsername();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @RequestMapping(value = "member/membercartorder", method = RequestMethod.POST)
    public @ResponseBody
    String mbAddressShipping2(HttpSession session) {
        String res = "cancelOrder";
        try {
            Cart cart = (Cart) session.getAttribute("cart");
            Customer cusMb = (Customer) session.getAttribute("ssLogged");
            if (cart != null && cusMb != null) {
                session.setAttribute("crCartOrder", cart);
                res = cusMb.getCustomerMemberUsername();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @RequestMapping(value = "member/{member}/order.html", method = RequestMethod.POST)
    public void mbOrder(
            @RequestParam("mbsnumber") String mbsnumber,
            @RequestParam("mbslane") String mbslane,
            @RequestParam("mbsstreet") String mbsstreet,
            @RequestParam("mbsward") String mbsward,
            @RequestParam("mbsdistrict") String mbsdistrict,
            @RequestParam("mbscity") String mbscity,
            @RequestParam("mbscountry") String mbscountry,
            @RequestParam(name = "code", required = false) String code,
            HttpSession session, HttpServletResponse response,
            @PathVariable Map<String, String> pathVars,
            HttpServletRequest request) throws IOException {

        String userName = pathVars.get("member");
        Cart cart = (Cart) session.getAttribute("crCartOrder");
        Customer cus = (Customer) session.getAttribute("ssLogged");
        if (cus == null || !cus.getCustomerType().equals("customerMember")
                || !userName.equals(cus.getCustomerMemberUsername())) {
            response.sendRedirect(request.getContextPath() + "/home.html");
        } else if (cart == null) {
            response.sendRedirect(request.getContextPath() + "/user/" + cus.getCustomerMemberUsername() + "/cartsaved.html");
        } else {
            cart = doCustomerMemberCart(cart, code);
            if (cart != null) {
                String strRefirect = "/home.html";
                try {
                    PersonAbstractFactory customerFactory = PersonFactoryProducer.getFactory("customer");
                    Customer mb = customerFactory.getCustomer("customerMember");
                    mb.setIdCustomer(cus.getIdCustomer());
                    ShippingInfor shippingAdded = new ShippingInforDAO().addMbShippingInfor(mbsnumber, mbslane, mbsstreet, mbsward, mbsdistrict, mbscity, mbscountry, mb);
                    strRefirect = handleRedirectString(shippingAdded, cart, cus);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                response.sendRedirect(request.getContextPath() + strRefirect);
            }
        }
    }

    private Cart doCustomerMemberCart(Cart cart, String code) {
        if (code != null && code.toUpperCase().matches("([0-9a-zA-Z]){6,6}")) {
            CardPoint cusCardPoint = new CardPointDAO().getCustomerCardPointByCode(code);
            if (cusCardPoint != null) {
                int p = cusCardPoint.getPoints();
                float totalPr = cart.getTotalPrice();
                if (totalPr >= 100000 && p <= 7) {
                    cart.setBonnusPoint(p);
                    p = 0;
                    cart.setTotalPrice(totalPr - (p * 10000));
                } else if (totalPr >= 100000 && p > 7) {
                    cart.setBonnusPoint(7);
                    p = p - 7;
                    cart.setTotalPrice(totalPr - 70000);
                }
                if (totalPr >= 50000 && totalPr < 100000) {
                    p += 1;
                } else if (totalPr >= 100000 && totalPr < 200000) {
                    p += 2;
                } else if (totalPr >= 200000 && totalPr < 400000) {
                    p += 5;
                } else if (totalPr >= 400000) {
                    p += 10;
                }
                try {
                    boolean isUpdated = new CardPointDAO().updatePointById(cusCardPoint.getIdCardPoint(), p);
                    if (isUpdated) {
                        return cart;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    private String handleRedirectString(ShippingInfor shippingAdded,
            Cart cart, Customer cus) {
        if (shippingAdded != null) {
            int idCart = new CartDAO().saveCartAndGetCartId(cart, cus.getIdCustomer());
            cart.setIdCart(idCart);
            Payment paymentAdded = new PaymentDAO().addPayment(cart, true);
            if (paymentAdded != null) {
                try {
                    Calendar c = Calendar.getInstance();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    String crDate = sdf.format(c.getTime());
                    Date date = new Date(sdf.parse(crDate).getTime());
                    Order order = new Order(paymentAdded, shippingAdded, date, "Đã gửi");
                    boolean orderAdded = new OrderDAO().addOrder(order);
                    if (orderAdded) {
                        boolean deletedCartSave = new CartDAO().deleteCartSave(cart.getIdCart());
                        if (deletedCartSave) {
                            return "/member/" + cus.getCustomerMemberUsername() + "/ordersaved.html";
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else {
            return "/member/" + cus.getCustomerMemberUsername() + "/cartsaved.html";
        }
        return null;
    }

    @RequestMapping(value = "crbookorder", method = RequestMethod.POST)
    public @ResponseBody
    String getCurrentBookOrder(HttpSession session,
            @RequestParam("it") String it) {
        String res = "Fail";
        if (it != null) {
            try {
                int id = Integer.parseInt(it);
                if (id >= 1) {
                    Book book = findBookInSession(session, id);
                    if (book == null) {
                        try {
                            book = new BookDAO().getBookById(id);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    if (book != null) {
                        res = "OK";
                        session.setAttribute("currentBookOrder", book);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return res;
    }

    @RequestMapping(value = "bookorder.html", method = RequestMethod.GET)
    public ModelAndView bookOrderView(HttpSession session, ModelAndView model,
            HttpServletRequest request, HttpServletResponse response
    ) throws IOException {
        Customer cus = (Customer) session.getAttribute("ssLogged");
        if (cus == null) {
            Book book = (Book) session.getAttribute("currentBookOrder");
            if (book != null) {
                model = new ModelAndView("/front/bookOrder");
                model.addObject("currentBookOrder", book);
                LoadDefaultData.getAndSetCookieAndScopeOfCategoryAndBookSet(request, response, model);
                return model;
            }
        }
        response.sendRedirect(request.getContextPath() + "/home.html");
        return null;
    }

    @RequestMapping(value = "ordersuccessful.html", method = RequestMethod.GET)
    public ModelAndView orderSuccesful(HttpSession session, ModelAndView model,
            HttpServletRequest request, HttpServletResponse response
    ) throws IOException {
        Book book = (Book) session.getAttribute("currentBookOrder");
        Cart cart = (Cart) session.getAttribute("currentCartOrder");
        if (book != null || cart != null) {
            model = new ModelAndView("/front/ordersuccess");
            model.addObject("currentBookOrder", null);
            model.addObject("currentCartOrder", null);
            LoadDefaultData.getAndSetCookieAndScopeOfCategoryAndBookSet(request, response, model);
            return model;
        }
        response.sendRedirect(request.getContextPath() + "/home.html");
        return null;
    }

    //////////////////////////////////////
    @RequestMapping(value = "cartorder", method = RequestMethod.POST)
    public @ResponseBody
    String cartOrder(HttpSession session,
            @RequestParam(name = "email1", required = false) String email1,
            @RequestParam(name = "phoneNumber1", required = false) String phoneNumber1,
            @RequestParam(name = "email2", required = false) String email2,
            @RequestParam(name = "phoneNumber2", required = false) String phoneNumber2,
            @RequestParam("number") String number,
            @RequestParam("lane") String lane,
            @RequestParam("street") String street,
            @RequestParam("ward") String ward,
            @RequestParam("district") String district,
            @RequestParam("city") String city,
            @RequestParam("country") String country,
            @RequestParam(name = "code", required = false) String code
    ) {
        String res = "fail";
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            return res;
        }
        if (number != null && number.length() >= 1 && number.length() <= 10
                && lane != null && lane.length() >= 1 && lane.length() <= 10
                && street != null && street.length() >= 6 && street.length() <= 20
                && ward != null && ward.length() >= 6 && ward.length() <= 20
                && district != null && district.length() >= 6 && district.length() <= 20
                && city != null && city.length() >= 6 && city.length() <= 20) {
            PersonDAOAbstractFactory customerDAOFactory = PersonDAOFactoryProducer.getDAOFactory("customerDAO");
            try {
                Customer cus = null;
                if (code != null && code.toUpperCase().matches("([0-9a-zA-Z]){6,6}")
                        && email1 != null && email1.length() <= 30
                        && phoneNumber1 != null && phoneNumber1.length() >= 2 && phoneNumber1.length() <= 12) {
                    cus = customerDAOFactory.getCustomerDAO("customerNotMemberDAO").addAndGetCustomer(phoneNumber1, email1);
                } else if (email2 != null && email2.length() <= 30
                        && phoneNumber2 != null && phoneNumber2.length() >= 2 && phoneNumber2.length() <= 12) {
                    cus = customerDAOFactory.getCustomerDAO("customerNotMemberDAO").addAndGetCustomer(phoneNumber2, email2);
                }
                ShippingInfor shippingAdded = new ShippingInforDAO().addMbShippingInfor(number, lane, street, ward, district, city, country, cus);
                CardPoint cusCardPoint = null;
                int points = setAndUpdateCustomerCardPoint(code, cart, email2, cusCardPoint);
                if (points == -1) {
                    return res;
                }
                if (shippingAdded != null) {
                    res = addCustomerCartOrder(cart, shippingAdded, session, cusCardPoint, points, cus);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return res;
    }

    private String addCustomerCartOrder(Cart cart,
            ShippingInfor shippingAdded, HttpSession session,
            CardPoint cusCardPoint, int points, Customer cus) {
        int idCart = new CartDAO().addCart(cart);
        cart.setIdCart(idCart);
        Payment paymentAdded = new PaymentDAO().addPayment(cart, false);
        if (paymentAdded != null) {
            try {
                Calendar c = Calendar.getInstance();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String crDate = sdf.format(c.getTime());
                Date date = new Date(sdf.parse(crDate).getTime());
                Order order = new Order(paymentAdded, shippingAdded, date, "Đã gửi");
                boolean orderAdded = new OrderDAO().addOrder(order);
                if (orderAdded) {
                    session.setAttribute("currentCartOrder", cart);
                    if (cusCardPoint == null) {
                        cusCardPoint = new CardPointDAO().newCardPoint(cus.getIdCustomer(), points);
                        return cusCardPoint.getCardCode() + "#" + cusCardPoint.getPoints();
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    //////////////////////////////////////
    @RequestMapping(value = "bookorder", method = RequestMethod.POST)
    public @ResponseBody
    String bookOrder(HttpSession session,
            @RequestParam("q") String q,
            @RequestParam(name = "email1", required = false) String email1,
            @RequestParam(name = "phoneNumber1", required = false) String phoneNumber1,
            @RequestParam(name = "email2", required = false) String email2,
            @RequestParam(name = "phoneNumber2", required = false) String phoneNumber2,
            @RequestParam("number") String number,
            @RequestParam("lane") String lane,
            @RequestParam("street") String street,
            @RequestParam("ward") String ward,
            @RequestParam("district") String district,
            @RequestParam("city") String city,
            @RequestParam("country") String country,
            @RequestParam(name = "code", required = false) String code
    ) {
        String res = "fail";
        Book book = (Book) session.getAttribute("currentBookOrder");
        if (book == null) {
            return res;
        }
        if (number != null && number.length() >= 1 && number.length() <= 10
                && lane != null && lane.length() >= 1 && lane.length() <= 10
                && street != null && street.length() >= 6 && street.length() <= 20
                && ward != null && ward.length() >= 6 && ward.length() <= 20
                && district != null && district.length() >= 6 && district.length() <= 20
                && city != null && city.length() >= 6 && city.length() <= 20) {
            PersonDAOAbstractFactory customerDAOFactory = PersonDAOFactoryProducer.getDAOFactory("customerDAO");
            try {
                Customer cus = null;
                if (code != null && code.toUpperCase().matches("([0-9a-zA-Z]){6,6}")
                        && email1 != null && email1.length() <= 30
                        && phoneNumber1 != null && phoneNumber1.length() >= 2 && phoneNumber1.length() <= 12) {
                    cus = customerDAOFactory.getCustomerDAO("customerNotMemberDAO").addAndGetCustomer(phoneNumber1, email1);
                } else if (email2 != null && email2.length() <= 30
                        && phoneNumber2 != null && phoneNumber2.length() >= 2 && phoneNumber2.length() <= 12) {
                    cus = customerDAOFactory.getCustomerDAO("customerNotMemberDAO").addAndGetCustomer(phoneNumber2, email2);
                }
                Cart cart = doCustomerBookOrderCard(q, book);
                ShippingInfor shippingAdded = new ShippingInforDAO().addMbShippingInfor(number, lane, street, ward, district, city, country, cus);
                CardPoint cusCardPoint = null;
                int points = setAndUpdateCustomerCardPoint(code, cart, email2, cusCardPoint);
                if (points == -1) {
                    return res;
                }
                if (shippingAdded != null) {
                    res = addCustomerBookOrder(cart, shippingAdded, cusCardPoint, cus, points);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return res;
    }

    private Cart doCustomerBookOrderCard(String q, Book book) {
        try {
            int qtty = Integer.parseInt(q);
//            int dc = 0;
//            if (book.getListDeals() != null && book.getListDeals().size() > 0) {
//                for (int i = 0; i < book.getListDeals().size(); i++) {
//                    dc += book.getListDeals().get(i).getDiscount();
//                }
//            }
//            float spr = Float.parseFloat(book.getSalePrice());
//            spr = spr - (spr * dc) / 100;
//            float totalPr = (float) qtty * spr;
            float totalPr = (float) qtty * Float.parseFloat(book.getSalePrice());
            BookOrder bod = new BookOrder(qtty, totalPr, book);
            ArrayList<BookOrder> listBod = new ArrayList<>();
            listBod.add(bod);
            return new Cart(listBod, 0, totalPr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private int setAndUpdateCustomerCardPoint(String code, Cart cart,
            String email2, CardPoint cusCardPoint) {
        int p = 0;
        float totalPr = 0;
        if (code != null && code.toUpperCase().matches("([0-9a-zA-Z]){6,6}")) {
            cusCardPoint = new CardPointDAO().getCustomerCardPointByCode(code);
            if (cusCardPoint != null) {
                p = cusCardPoint.getPoints();
                totalPr = cart.getTotalPrice();
                if (totalPr >= 100000 && p <= 7) {
                    cart.setBonnusPoint(p);
                    p = 0;
                    cart.setTotalPrice(totalPr - (p * 10000));
                } else if (totalPr >= 100000 && p > 7) {
                    cart.setBonnusPoint(7);
                    p = p - 7;
                    cart.setTotalPrice(totalPr - 70000);
                }
            }
        } else if (email2 != null && email2.length() <= 30) {
            try {
                cusCardPoint = new CardPointDAO().getCustomerCardPointByEmail(email2);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (cusCardPoint != null) {
            if (totalPr >= 100000 && totalPr < 200000) {
                p += 1;
            } else if (totalPr >= 200000 && totalPr < 300000) {
                p += 2;
            } else if (totalPr >= 300000 && totalPr < 500000) {
                p += 5;
            } else if (totalPr >= 500000) {
                p += 10;
            }
            try {
                boolean isUpdated = new CardPointDAO().updatePointById(cusCardPoint.getIdCardPoint(), p);
                if (!isUpdated) {
                    return -1;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return p;
    }

    private String addCustomerBookOrder(Cart cart, ShippingInfor shippingAdded,
            CardPoint cusCardPoint, Customer cus, int points) {
        String res = "fail";
        int idCart = new CartDAO().addCart(cart);
        cart.setIdCart(idCart);
        Payment paymentAdded = new PaymentDAO().addPayment(cart, false);
        if (paymentAdded != null) {
            try {
                Calendar c = Calendar.getInstance();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String crDate = sdf.format(c.getTime());
                Date date = new Date(sdf.parse(crDate).getTime());
                Order order = new Order(paymentAdded, shippingAdded, date, "Đã gửi");
                boolean orderAdded = new OrderDAO().addOrder(order);
                if (orderAdded) {
                    res = "OK";
                    if (cusCardPoint == null) {
                        cusCardPoint = new CardPointDAO().newCardPoint(cus.getIdCustomer(), points);
                        res = cusCardPoint.getCardCode() + "#" + cusCardPoint.getPoints();
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return res;
    }

    @RequestMapping(value = "checkcode", method = RequestMethod.POST)
    public @ResponseBody
    String checkcode(@RequestParam("ttprc") String ttprc,
            @RequestParam("code") String code
    ) {
        String res = "fail";
        try {
            float ttpr = Float.parseFloat(ttprc);
            if (ttpr < 100000) {
                return res;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (code != null && code.trim().matches("([0-9a-zA-Z]){6,6}")) {
            CardPoint cardPoint = new CardPointDAO().getCustomerCardPointByCode(code);
            if (cardPoint != null) {
                if (cardPoint.getCardCode().equals(code.toUpperCase())) {
                    int p = cardPoint.getPoints();
                    if (p > 7) {
                        res = p + "#7(70.000VND)#" + cardPoint.getCustomer().getEmail()
                                + "#" + cardPoint.getCustomer().getPhoneNum();
                    } else {
                        res = p + "#" + p + "(" + p + "0.000VND)#" + cardPoint.getCustomer().getEmail()
                                + "#" + cardPoint.getCustomer().getPhoneNum();
                    }
                }
            }
        }
        return res;
    }

    @RequestMapping(value = "member/{member}/bookorder.html", method = RequestMethod.GET)
    public ModelAndView mbBookOrderView(HttpSession session, ModelAndView model,
            HttpServletRequest request, HttpServletResponse response,
            @PathVariable Map<String, String> pathVars
    ) throws IOException {
        String username = pathVars.get("member");
        Customer crCusMb = (Customer) session.getAttribute("ssLogged");
        if (crCusMb == null
                || !crCusMb.getCustomerType().equals("customerMember")
                || !username.equals(crCusMb.getCustomerMemberUsername())) {
            response.sendRedirect(request.getContextPath() + "/home.html");
        } else {
            model = new ModelAndView("/front/memberBookOrder");
            Book book = (Book) session.getAttribute("currentBookOrder");
            if (book != null) {
                model.addObject("currentBookOrder", book);
                model.addObject("customerMemberUsername", crCusMb.getCustomerMemberUsername());
            } else {
                model.addObject("bookNotFound", true);
            }
            LoadDefaultData.getAndSetCookieAndScopeOfCategoryAndBookSet(request, response, model);
            return model;
        }
        return null;
    }

    @RequestMapping(value = "member/{member}/bookorder", method = RequestMethod.POST)
    public @ResponseBody
    String mbBookOrder(HttpSession session,
            @RequestParam("q") String q,
            @RequestParam("number") String number,
            @RequestParam("lane") String lane,
            @RequestParam("street") String street,
            @RequestParam("ward") String ward,
            @RequestParam("district") String district,
            @RequestParam("city") String city,
            @RequestParam("country") String country,
            @RequestParam(name = "code", required = false) String code,
            @PathVariable Map<String, String> pathVars
    ) {
        String res = "fail";
        String username = pathVars.get("member");
        Customer crCusMb = (Customer) session.getAttribute("ssLogged");
        Book book = (Book) session.getAttribute("currentBookOrder");
        if (crCusMb == null
                || !crCusMb.getCustomerType().equals("customerMember")
                || !username.equals(crCusMb.getCustomerMemberUsername())
                || book == null) {
            return res;
        }
        if (number != null && number.length() >= 1 && number.length() <= 10
                && lane != null && lane.length() >= 1 && lane.length() <= 10
                && street != null && street.length() >= 6 && street.length() <= 20
                && ward != null && ward.length() >= 6 && ward.length() <= 20
                && district != null && district.length() >= 6 && district.length() <= 20
                && city != null && city.length() >= 6 && city.length() <= 20) {
            try {
                PersonAbstractFactory customerFactory = PersonFactoryProducer.getFactory("customer");
                Customer mb = customerFactory.getCustomer("customerMember");
                mb.setIdCustomer(crCusMb.getIdCustomer());
                ShippingInfor shippingAdded = new ShippingInforDAO().addMbShippingInfor(number, lane, street, ward, district, city, country, mb);
                Cart cart = doMemberBookOrderCart(q, book);
                boolean isUpdated = setAndUpdateMemberCardPoint(cart, code, session, crCusMb);
                if (!isUpdated) {
                    return res;
                }
                if (shippingAdded != null) {
                    res = addMemberBookOrder(cart, crCusMb, shippingAdded);
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        return res;
    }

    private Cart doMemberBookOrderCart(String q, Book book) {
        try {
            int qtty = Integer.parseInt(q);
//            int dc = 0;
//            if (book.getListDeals() != null && book.getListDeals().size() > 0) {
//                for (int i = 0; i < book.getListDeals().size(); i++) {
//                    dc += book.getListDeals().get(i).getDiscount();
//                }
//            }
//            float spr = Float.parseFloat(book.getSalePrice());
//            spr = spr - (spr * dc) / 100;
//            float totalPr = (float) qtty * spr;
            float totalPr = (float) qtty * Float.parseFloat(book.getSalePrice());
            BookOrder bod = new BookOrder(qtty, totalPr, book);
            ArrayList<BookOrder> listBod = new ArrayList<>();
            listBod.add(bod);
            return new Cart(listBod, 0, totalPr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private boolean setAndUpdateMemberCardPoint(Cart cart, String code,
            HttpSession session, Customer crCusMb) {
        CardPoint crmbCardPoint = (CardPoint) session.getAttribute("ssMbCardPoint");
        if (crmbCardPoint == null) {
            crmbCardPoint = new CardPointDAO().getCustomerMemberCardPoint(crCusMb);
        }
        if (crmbCardPoint != null) {
            session.setAttribute("ssMbCardPoint", crmbCardPoint);
            int p = crmbCardPoint.getPoints();
            float totalPr = cart.getTotalPrice();
            if (code != null && code.trim().matches("([0-9a-zA-Z]){6,6}")
                    && totalPr >= 100000) {
                if (p <= 7) {
                    cart.setBonnusPoint(p);
                    p = 0;
                    cart.setTotalPrice(totalPr - (p * 10000));
                } else {
                    cart.setBonnusPoint(7);
                    p = p - 7;
                    cart.setTotalPrice(totalPr - 70000);
                }
            }
            if (totalPr >= 50000 && totalPr < 100000) {
                p += 1;
            } else if (totalPr >= 100000 && totalPr < 200000) {
                p += 2;
            } else if (totalPr >= 200000 && totalPr < 400000) {
                p += 5;
            } else if (totalPr >= 400000) {
                p += 10;
            }
            try {
                return new CardPointDAO().updatePointById(crmbCardPoint.getIdCardPoint(), p);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    private String addMemberBookOrder(Cart cart, Customer crCusMb,
            ShippingInfor shippingAdded) {
        int idCart = new CartDAO().saveCartAndGetCartId(cart, crCusMb.getIdCustomer());
        cart.setIdCart(idCart);
        Payment paymentAdded = new PaymentDAO().addPayment(cart, true);
        if (paymentAdded != null) {
            try {
                Calendar c = Calendar.getInstance();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String crDate = sdf.format(c.getTime());
                Date date = new Date(sdf.parse(crDate).getTime());
                Order order = new Order(paymentAdded, shippingAdded, date, "Đã gửi");
                boolean orderAdded = new OrderDAO().addOrder(order);
                if (orderAdded) {
                    boolean deletedCartSave = new CartDAO().deleteCartSave(cart.getIdCart());
                    if (deletedCartSave) {
                        return "OK";
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "fail";
    }

    @RequestMapping(value = "member/{member}/checkcardpoint", method = RequestMethod.POST)
    public @ResponseBody
    String checkCardPoint(HttpSession session,
            @RequestParam("code") String code,
            @RequestParam("ttprc") String ttprc,
            @PathVariable Map<String, String> pathVars
    ) {
        String res = "fail";
        try {
            float ttpr = Float.parseFloat(ttprc);
            if (ttpr < 100000) {
                return res;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        String username = pathVars.get("member");
        Customer crCusMb = (Customer) session.getAttribute("ssLogged");
        if (crCusMb == null
                || !crCusMb.getCustomerType().equals("customerMember")
                || !username.equals(crCusMb.getCustomerMemberUsername())) {
            return res;
        }
        if (code != null && code.trim().matches("([0-9a-zA-Z]){6,6}")) {
            CardPoint crmbCardPoint = (CardPoint) session.getAttribute("ssMbCardPoint");
            if (crmbCardPoint == null) {
                crmbCardPoint = new CardPointDAO().getCustomerMemberCardPoint(crCusMb);
            }
            if (crmbCardPoint != null) {
                session.setAttribute("ssMbCardPoint", crmbCardPoint);
                if (crmbCardPoint.getCardCode().equals(code.toUpperCase())) {
                    int p = crmbCardPoint.getPoints();
                    if (p > 7) {
                        res = p + "#7(70.000VND)";
                    } else {
                        res = p + "#" + p + "(" + p + "0.000VND)";
                    }
                }
            }
        }
        return res;
    }

    private Book findBookInSession(HttpSession session, int idBook) {
        ArrayList<Book> currentListBook = (ArrayList<Book>) session.getAttribute("ssListBook");
        if (currentListBook != null) {
            int size = currentListBook.size();
            for (int i = 0; i < size; i++) {
                if (currentListBook.get(i).getIdBook() == idBook) {
                    return currentListBook.get(i);
                }
            }
        }
        return null;
    }
}
