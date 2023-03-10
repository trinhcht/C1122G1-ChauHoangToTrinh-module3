package module3.bt_ss10_2;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    float firstOperand = Float.parseFloat(request.getParameter("firstOperand"));
    char operator = request.getParameter("operator").charAt(0);
    float secondOperand = Float.parseFloat(request.getParameter("secondOperand"));
    float result = Calculator.calculator(firstOperand, secondOperand, operator);
    request.setAttribute("result", result);
    request.getRequestDispatcher("result.jsp").forward(request,response);
    }
}
