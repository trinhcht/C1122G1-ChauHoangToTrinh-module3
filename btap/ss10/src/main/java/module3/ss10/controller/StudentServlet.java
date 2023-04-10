package module3.ss10.controller;

import module3.ss10.model.Student;
import module3.ss10.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlet", value = "/student")
public class StudentServlet extends HttpServlet {
    private List<Student> studentList = new ArrayList<>();

    public void init() {
        studentList.add(new Student(1, "Nguyễn Văn A", "1", 85.0));
        studentList.add(new Student(2, "Nguyễn Văn B", "1", 80.0));
        studentList.add(new Student(3, "Nguyễn Văn C", "0", 55.0));
        studentList.add(new Student(4, "Nguyễn Văn D", "1", 95.0));
        studentList.add(new Student(5, "Nguyễn Văn E", "1", null));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(studentList.size()==0){
            request.setAttribute("msg","Danh sách rỗng");
        }
        request.setAttribute("studentList", studentList);
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
