/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import dao.book.BookDAO;
import dao.book.BookSetDAO;
import dao.book.CategoryDAO;
import entity.book.Book;
import entity.book.BookSet;
import entity.book.Category;
import entity.person.employee.Employee;
import tool.MyTool;

/**
 *
 * @author zOzDarKzOz
 */
@Controller
@RequestMapping(value = "staffmanager")
public class StaffManagerCtr {

    private final MyTool myTool = new MyTool();

    @SuppressWarnings("rawtypes")
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView staffmanager(ModelAndView model,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session,
            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
            @RequestParam(value = "op", defaultValue = "") String op,
            @RequestParam(value = "key", defaultValue = "") String key,
            @RequestParam(value = "ct", defaultValue = "") String ct,
            @RequestParam(value = "bs", defaultValue = "") String bs)
            throws IOException {
        Employee ee = (Employee) session.getAttribute("emLogged");
        if (ee == null || !ee.geteType().equals("staffManager")) {
            response.sendRedirect(request.getContextPath() + "/home.html");
        } else {
            model = new ModelAndView("/back/staffManager");
            model.addObject("title", "Staff Manager");
            try {
                ArrayList<Book> listBook = new ArrayList<Book>();
                if (ct.equals("") && bs.equals("")) {
                    listBook = doSearch(op, key);
                } else if (ct.equals("")) {
                    listBook = doSearchBookbyBookSet(bs);
                } else {
                    listBook = doSearchBookbyCategory(ct);
                }
                ArrayList listCandBS = getAllCateogryAndBookSet();

                int numProduct = 9;
                ArrayList<Integer> pages = myTool.getPages(listBook.size(), pageNum, numProduct);
                model.addObject("pages", pages);
                model.addObject("listBook", listBook);
                model.addObject("listCandBS", listCandBS);
            } catch (Exception e) {
                e.getStackTrace();
            }
            return model;
        }
        return null;
    }

    @SuppressWarnings({"rawtypes"})
    @RequestMapping(value = "/addBook", method = RequestMethod.GET)
    public ModelAndView addBook(HttpServletResponse response,
            HttpSession session, HttpServletRequest request
    ) throws IOException {
        Employee ee = (Employee) session.getAttribute("emLogged");
        if (ee == null || !ee.geteType().equals("staffManager")) {
            response.sendRedirect(request.getContextPath() + "/home.html");
        } else {
            ModelAndView mav = new ModelAndView("/back/addBook");
            mav.addObject("book", new Book());
            try {
                ArrayList list = getAllCateogryAndBookSet();
                mav.addObject("list", list);
            } catch (Exception e) {
                e.getStackTrace();
            }
            return mav;
        }
        return null;
    }

    @RequestMapping(value = "/checkAddBook", method = RequestMethod.POST)
    public String addBook(HttpServletRequest request, ModelAndView mav,
            HttpServletResponse response, HttpSession session,
            @ModelAttribute("StringWeb") Book book,
            @RequestParam("fImage") MultipartFile file
    ) throws IOException {
        Employee ee = (Employee) session.getAttribute("emLogged");
        if (ee == null || !ee.geteType().equals("staffManager")) {
            response.sendRedirect(request.getContextPath() + "/home.html");
        } else {
            String urlForder = "H:\\Ky8\\MyBookStore\\web\\resources\\image\\thumb\\";
            InputStream fis = null;
            OutputStream fos = null;
            try {
                String image = file.getOriginalFilename();
                fis = file.getInputStream();
                fos = new FileOutputStream(urlForder + image);
                int readBytes = 0;
                byte[] buffer = new byte[8192];
                while ((readBytes = fis.read(buffer, 0, 8192)) != -1) {
                    fos.write(buffer, 0, readBytes);
                }
                book.setImage(image);
                BookDAO bookDAO = new BookDAO();
                if (bookDAO.addBook(book)) {
                    mav.addObject("msg", "Sách đã được thêm");
                    return "redirect:";
                }
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (fis != null) {
                        fis.close();
                    }
                    if (fos != null) {
                        fos.close();
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            mav.addObject("msg", "Lỗi");
            return "redirect:addBook";
        }
        return null;
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    @RequestMapping(value = "/editBook", method = RequestMethod.GET)
    public ModelAndView editBook(HttpServletRequest request,
            HttpServletResponse response, HttpSession session,
            @RequestParam("idBook") int idBook
    ) throws IOException {
        Employee ee = (Employee) session.getAttribute("emLogged");
        if (ee == null || !ee.geteType().equals("staffManager")) {
            response.sendRedirect(request.getContextPath() + "/home.html");
        } else {
            ModelAndView mav = new ModelAndView("/back/editBook");
            mav.addObject("bookEdit", new Book());
            try {
                BookDAO bookDAO = new BookDAO();
                Book book = bookDAO.getBookById(idBook);
                mav.addObject("book", book);

                BookSetDAO bookSetDAO = new BookSetDAO();
                ArrayList<BookSet> listBS = bookSetDAO.getAll();
                int pos = 0;
                for (int i = 0; i < listBS.size(); i++) {
                    if (listBS.get(i).getIdBookSet() == book.getSet().getIdBookSet()) {
                        pos = i;
                        break;
                    }
                }
                listBS.remove(pos);
                CategoryDAO categoryDAO = new CategoryDAO();
                ArrayList<Category> listC = categoryDAO.getAll();
                for (int i = 0; i < listC.size(); i++) {
                    if (listC.get(i).getIdCategory() == book.getCategory().getIdCategory()) {
                        pos = i;
                        break;
                    }
                }
                listC.remove(pos);
                ArrayList list = new ArrayList();
                list.add(listC);
                list.add(listBS);
                mav.addObject("list", list);
            } catch (Exception e) {
                e.getStackTrace();
            }
            return mav;
        }
        return null;
    }

    @RequestMapping(value = "checkEditBook", method = RequestMethod.POST)
    public String editBook(ModelAndView mav, HttpServletRequest request,
            HttpServletResponse response, HttpSession session,
            @ModelAttribute("StringWeb") Book book,
            @RequestParam("fImage") MultipartFile file
    ) throws IOException {
        Employee ee = (Employee) session.getAttribute("emLogged");
        if (ee == null || !ee.geteType().equals("staffManager")) {
            response.sendRedirect(request.getContextPath() + "/home.html");
        } else {
            if (file.getOriginalFilename().equals("")) {
            } else {
                String urlForder = "H:\\Ky8\\MyBookStore\\web\\resources\\image\\thumb\\";
                InputStream fis = null;
                OutputStream fos = null;
                try {
                    String image = file.getOriginalFilename();
                    fis = file.getInputStream();
                    fos = new FileOutputStream(urlForder + image);
                    int readBytes = 0;
                    byte[] buffer = new byte[8192];
                    while ((readBytes = fis.read(buffer, 0, 8192)) != -1) {
                        fos.write(buffer, 0, readBytes);
                    }
                    book.setImage(image);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    try {
                        fis.close();
                        fos.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
            try {
                BookDAO bookDAO = new BookDAO();
                if (bookDAO.editBook(book)) {
                    mav.addObject("msg", "Sách đã được cập nhật");
                    return "redirect:";
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            mav.addObject("msg", "Lỗi");
            return "redirect:";
        }
        return null;
    }

    @RequestMapping(value = "/delBook", method = RequestMethod.POST)
    @ResponseBody
    public String delBook(HttpServletRequest request,
            HttpServletResponse response, HttpSession session,
            @RequestParam(value = "idBook") int idBook
    ) throws IOException {
        Employee ee = (Employee) session.getAttribute("emLogged");
        if (ee == null || !ee.geteType().equals("staffManager")) {
            response.sendRedirect(request.getContextPath() + "/home.html");
        } else {
            try {
                BookDAO bookDAO = new BookDAO();
                Book book = new Book();
                book.setIdBook(idBook);
                if (bookDAO.delBook(book)) {
                    return "true";
                }
            } catch (Exception e) {
                e.getStackTrace();
            }
            return "false";
        }
        return null;
    }

    public ArrayList<Book> doSearch(String op, String key) {
        ArrayList<Book> listBook = new ArrayList<Book>();
        BookDAO bookDAO = new BookDAO();
        if (op.equals("")) {
            listBook = bookDAO.getAllBook();
        } else if (op.equals("n1")) {
            listBook = bookDAO.getListOfBookByName(key);
        } else {
            String str = op.substring(0, 2);
            int id = Integer.parseInt(op.substring(2));
            if (str.equals("ct")) {
                listBook = bookDAO.getListOfBookByNameAndIdCategory(key, id);
            } else if (str.equals("bs")) {
                listBook = bookDAO.getListOfBookByNameAndIdBookSet(key, id);
            }
        }
        return listBook;
    }

    private ArrayList<Book> doSearchBookbyCategory(String ct) {
        if (ct.equals("")) {
        } else {
            BookDAO bookDAO = new BookDAO();
            int idCategory = Integer.parseInt(ct);
            ArrayList<Book> listBook = bookDAO.getListOfBookByIdCategory(idCategory);
            return listBook;
        }
        return null;
    }

    private ArrayList<Book> doSearchBookbyBookSet(String bs) {
        if (bs.equals("")) {
        } else {
            BookDAO bookDAO = new BookDAO();
            int idBookSet = Integer.parseInt(bs);
            ArrayList<Book> listBook = bookDAO.getListOfBookByIdBookSet(idBookSet);
            return listBook;
        }
        return null;
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    private ArrayList getAllCateogryAndBookSet() {
        ArrayList<Category> listC = new CategoryDAO().getAll();
        ArrayList<BookSet> listBS = new BookSetDAO().getAll();
        ArrayList listCandBS = new ArrayList();
        listCandBS.add(listC);
        listCandBS.add(listBS);
        return listCandBS;
    }
}
