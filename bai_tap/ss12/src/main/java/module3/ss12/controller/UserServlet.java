package module3.ss12.controller;

import module3.ss12.model.User;
import module3.ss12.service.IUserService;
import module3.ss12.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/users")
public class UserServlet extends HttpServlet {
    IUserService userService = new UserService();
    private static final long serialVersionUID = 1L;
    private User user;
    public void init(){
        user = new User();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        String action = request.getParameter("action");
        if (action==null){
            action = "";
        }
        try {
            switch (action){
                case "create":
                  userService.createUser();
                  break;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    private void createUser (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException{
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        int id = Integer.parseInt(request.getParameter("id"));
        User book = new User(id,name,email, country);
        userService.updateUser(book);
    }
}