//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package Servlets;

import Classes.DBManager;
import Classes.Items;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/details"})
public class DetailsServlet extends HttpServlet {
    public DetailsServlet() {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.valueOf(req.getParameter("id"));
        Items item = DBManager.getItemById(id);
        req.setAttribute("detailsItem", item);
        req.getRequestDispatcher("details.jsp").forward(req, resp);
    }
}
