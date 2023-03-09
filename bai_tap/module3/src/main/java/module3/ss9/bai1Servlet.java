package module3.ss9;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "bai1Servlet", value = "/bai1Servlet")
public class bai1Servlet extends HttpServlet {

    private String message;
    public void init(){message="Calculate Discount";}
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.sendRedirect("product.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        float discount = Float.parseFloat(request.getParameter("discount"));

        float discountAmount = (float) (price * discount * 0.01);
        float discountPrice = price - discountAmount;
        System.out.println("Mô tả của sản phẩm" + description);
        System.out.println("Giá niêm yết của sản phẩm" + price);
        System.out.println("Tỷ lệ chiết khấu " + discount);
        System.out.println("Lượng chiết khấu" + discountAmount);
        System.out.println("Giá sau khi đã được chiết khấu" + discountPrice);

        request.setAttribute("productDescription", description);
        request.setAttribute("listPrice", price);
        request.setAttribute("discountPercent", discount);
        request.setAttribute("discountAmount", discountAmount);
        request.setAttribute("discountPrice", discountPrice);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
