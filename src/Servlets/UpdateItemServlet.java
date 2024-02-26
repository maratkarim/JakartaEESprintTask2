package Servlets;

import Classes.DBManager;
import Classes.Items;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/updateItem"})
public class UpdateItemServlet extends HttpServlet {
    public UpdateItemServlet() {
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String description = req.getParameter("desc");
        String price = req.getParameter("price");
        System.out.println();
        Items item = DBManager.getItemById(Long.parseLong(id));
        item.setName(name);
        item.setDescription(description);
        item.setPrice(Double.parseDouble(price));
        DBManager.updateItem(item);
        resp.sendRedirect("/details?id=" + id);
    }
}
