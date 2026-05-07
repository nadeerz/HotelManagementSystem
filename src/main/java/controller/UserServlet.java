package controller;

import util.DBConnection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/user")
public class UserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        String action = req.getParameter("action");

        try {
            Connection con = DBConnection.getConnection();

            if ("delete".equals(action)) {

                String id = req.getParameter("id");
                System.out.println("Delete ID: " + id); // debug

                PreparedStatement ps = con.prepareStatement(
                        "DELETE FROM users WHERE id=?"
                );

                ps.setInt(1, Integer.parseInt(id));

                int result = ps.executeUpdate();
                System.out.println("Deleted rows: " + result);

                res.sendRedirect("users.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        try {
            //  GET DATA FROM FORM
            String id = req.getParameter("id");
            String username = req.getParameter("username");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            System.out.println("Password: " + password);

            Connection con = DBConnection.getConnection();

            if (password == null || password.trim().isEmpty()) {
                //  Update WITHOUT password
                PreparedStatement ps = con.prepareStatement(
                        "UPDATE users SET username=?, email=? WHERE id=?"
                );
                ps.setString(1, username);
                ps.setString(2, email);
                ps.setInt(3, Integer.parseInt(id));
                ps.executeUpdate();

            } else {
                //  Update WITH password
                PreparedStatement ps = con.prepareStatement(
                        "UPDATE users SET username=?, email=?, password=? WHERE id=?"
                );
                ps.setString(1, username);
                ps.setString(2, email);
                ps.setString(3, password);
                ps.setInt(4, Integer.parseInt(id));
                ps.executeUpdate();
            }

            // REDIRECT BACK
            res.sendRedirect("users.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}