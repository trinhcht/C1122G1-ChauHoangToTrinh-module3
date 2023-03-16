package module3.ss12.controller;

import module3.ss12.model.User;
import module3.ss12.service.IUserService;
import module3.ss12.service.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {
    private final IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            default:
                listUser(request, response);
                break;
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = this.userService.selectUser(id);
        if (user == null) {
            try {
                request.getRequestDispatcher("views/error-404.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                request.setAttribute("user", user);
                request.getRequestDispatcher("views/delete.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = this.userService.selectUser(id);
        if (user == null) {
            try {
                request.getRequestDispatcher("views/error-404.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                request.setAttribute("user", user);
                request.getRequestDispatcher("views/edit.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("views/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createUser(request, response);
                break;
            case "edit":
                editUser(request, response);
                break;
            case "delete":
                try {
                    deleteUser(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "search":
                findUser(request, response);
                break;
            case "sort":
                sortByNameUser(request, response);
                break;
            default:
                listUser(request, response);
                break;
        }
    }

    private void sortByNameUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> users = this.userService.sortByNameUser();
        request.setAttribute("user", users);
        if (users == null) {
            try {
                request.getRequestDispatcher("views/error-404.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                request.getRequestDispatcher("views/sort.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void findUser(HttpServletRequest request, HttpServletResponse response) {
        String country = request.getParameter("country");
        List<User> user = this.userService.selectUserByCountry(country);
        request.setAttribute("user", user);
        if (user == null) {
            try {
                request.getRequestDispatcher("views/error-404.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                request.getRequestDispatcher("views/list.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        this.userService.deleteUser(id);
        try {
            response.sendRedirect("user");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User user = new User(id, name, email, country);
        this.userService.updateUser(user);
        request.setAttribute("message", "User update successful!");
        try {
            request.getRequestDispatcher("views/edit.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        this.userService.insertUser(new User(id, name, email, country));
        request.setAttribute("message", "New user was created!");
        try {
            request.getRequestDispatcher("views/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response){
        List<User> users = this.userService.selectAllUser();
        request.setAttribute("user", users);
        try {
            request.getRequestDispatcher("views/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}