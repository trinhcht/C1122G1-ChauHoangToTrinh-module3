package module3.ss9.controller;

import module3.ss9.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private static List<User> userList = new ArrayList<>();

    static {
        userList.add(new User(1, "admin", "123abc"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String useName = request.getParameter("useName");
        String password = request.getParameter("password");
        User userLogin = null;
        for (User user : userList) {
            if (user.getUseName().equals(useName) && user.getPasswword().equals(password)) {
                userLogin = user;
                break;
            }
        }
        if (userLogin != null) {
            response.sendRedirect("success.jsp");
        } else {
            String messengerLogin = "Username or password is incorrect. Please re-enter";
            request.setAttribute("messengerLogin", messengerLogin);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
