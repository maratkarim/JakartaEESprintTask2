//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package Classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;

    public DBManager() {
    }

    public static ArrayList<Items> getItems() {
        ArrayList<Items> itemsList = new ArrayList();

        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM items");
            ResultSet resultSet = stmt.executeQuery();

            while(resultSet.next()) {
                Long id = resultSet.getLong("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                Double price = resultSet.getDouble("price");
                Items item = new Items();
                item.setId(id);
                item.setName(name);
                item.setDescription(description);
                item.setPrice(price);
                itemsList.add(item);
            }
        } catch (Exception var8) {
            var8.printStackTrace();
        }

        return itemsList;
    }

    public static void addItem(Items item) {
        try {
            PreparedStatement stmt = connection.prepareStatement("INSERT INTO items (name, description, price)VALUES (?, ?, ?)");
            stmt.setString(1, item.getName());
            stmt.setString(2, item.getDescription());
            stmt.setDouble(3, item.getPrice());
            int rows = stmt.executeUpdate();
            stmt.close();
        } catch (Exception var3) {
            var3.printStackTrace();
        }

    }

    public static Items getItemById(Long id) {
        Items item = null;

        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM items WHERE id=? ");
            stmt.setLong(1, id);
            ResultSet resultSet = stmt.executeQuery();
            if (resultSet.next()) {
                String idishka = resultSet.getString("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                Double price = resultSet.getDouble("price");
                item = new Items();
                item.setId(Long.parseLong(idishka));
                item.setName(name);
                item.setDescription(description);
                item.setPrice(price);
            }

            stmt.close();
        } catch (Exception var8) {
            var8.printStackTrace();
        }

        return item;
    }

    public static void deleteItem(Long id) {
        try {
            PreparedStatement stmt = connection.prepareStatement("DELETE from items WHERE id = ? ");
            stmt.setLong(1, id);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception var2) {
            var2.printStackTrace();
        }

    }

    public static void updateItem(Items item) {
        try {
            PreparedStatement stmt = connection.prepareStatement("UPDATE items SET name=?, description=?, price=? WHERE id=? ");
            stmt.setString(1, item.getName());
            stmt.setString(2, item.getDescription());
            stmt.setDouble(3, item.getPrice());
            stmt.setLong(4, item.getId());
            int rows = stmt.executeUpdate();
            stmt.close();
        } catch (Exception var3) {
            var3.printStackTrace();
        }

    }

    static {
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "3220");
        } catch (Exception var1) {
            throw new RuntimeException(var1);
        }
    }
}
