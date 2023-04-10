package module3.ss11.controller;

import module3.ss11.model.Book;
import module3.ss11.model.Category;
import module3.ss11.service.IBookService;
import module3.ss11.service.ICategoryService;
import module3.ss11.service.impl.BookService;
import module3.ss11.service.impl.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BookServlet", value = "/book")
public class BookServlet extends HttpServlet {
    private IBookService iBookService = new BookService();
    private ICategoryService iCategoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreate(request, response);
                break;
            case "edit":
                showEdit(request, response);
                break;
            case "search":
                performSearch(request, response);
                break;
            default:
                showBookList(request, response);
                break;
        }
    }

    private void performSearch(HttpServletRequest request, HttpServletResponse response) {

    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Book book = iBookService.findById(id);
        request.setAttribute("book", book);
        request.setAttribute("categoryList", iCategoryService.bookCategoryList());
        request.getRequestDispatcher("/view/edit.jsp").forward(request, response);

    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("categoryList", iCategoryService.bookCategoryList());
        request.getRequestDispatcher("/view/create.jsp").forward(request, response);
    }

    private void showBookList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("bookList", iBookService.findAll());
        request.getRequestDispatcher("/view/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        String tittleSearch = request.getParameter("tittleSearch");
        if (tittleSearch == null) {
            tittleSearch = "";
        }
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                performCreate(request, response);
                break;
            case "edit":
                performEdit(request, response);
                break;
            case "delete":
                deleteBook(request, response);
                break;
            default:
                showBookList(request, response);
                break;

        }

    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        String mess = "Xóa Không thành công";
        boolean check = iBookService.deleteBook(id);
        if (!check) {
            mess = "Xóa Thành công";
        }
        request.setAttribute("mess", mess);
        List<Book> bookList = iBookService.findAll();
        request.setAttribute("bookList",bookList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/list.jsp");
        dispatcher.forward(request,response);
    }

    private void performEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        int pageSize = Integer.parseInt(request.getParameter("pageSizeBook"));
        String author = request.getParameter("author");
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));

        Category categorySel = null;
        List<Category> categoryList= new ArrayList<>();
        categoryList = iCategoryService.findAllCategory();
        for(Category category: categoryList){
            if(category.getIdCategory().equals(categoryID)){
                categorySel = category;
                break;
            }
        }
        Book book = new Book(id, title, pageSize, author);
        book.setCategory(categorySel);
        iBookService.updateBook(id, book);
    }

    private void performCreate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("idBook"));
        String title = request.getParameter("titleBook");
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        String author = request.getParameter("author");
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        Category category = iCategoryService.findByID(categoryID);
        Book book = new Book(id, title, pageSize, author, category);
        iBookService.save(book);
        response.sendRedirect("/book");
    }
}
