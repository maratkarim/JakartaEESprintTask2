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

@WebServlet({"/addItem"})
public class AddItemServlet extends HttpServlet {
    public AddItemServlet() {
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        Double price = Double.valueOf(req.getParameter("price"));
        Items item = new Items();
        item.setName(name);
        item.setDescription(description);
        item.setPrice(price);
        DBManager.addItem(item);
        resp.sendRedirect("/home");
    }
}
