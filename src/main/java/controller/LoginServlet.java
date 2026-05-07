
package controller;

import util.DBConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Backend validation
        if (email == null || email.trim().isEmpty()) {
            res.getWriter().println("Email is required");
            return;
        }

        if (password == null || password.trim().isEmpty()) {
            res.getWriter().println("Password is required");
            return;
        }

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM users WHERE email=? AND password=?"
            );

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                //  LOGIN SUCCESS
                HttpSession session = req.getSession();
                session.setAttribute("userId", rs.getInt("id"));

                res.sendRedirect("dashboard.jsp");

            } else {
                // LOGIN FAIL
                res.getWriter().println("Invalid email or password");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
