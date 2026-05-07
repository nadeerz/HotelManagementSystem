
package controller;

import util.DBConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(username,email,password) VALUES(?,?,?)"
            );
            ps.setString(1, req.getParameter("username"));
            ps.setString(2, req.getParameter("email"));
            ps.setString(3, req.getParameter("password"));
            ps.executeUpdate();
            res.sendRedirect("login.jsp");
        } catch (Exception e) { e.printStackTrace(); }
    }
}
