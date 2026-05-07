
package controller;

import util.DBConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        String action = req.getParameter("action");

        try {
            Connection con = DBConnection.getConnection();

            if ("delete".equals(action)) {

                String id = req.getParameter("id");
                System.out.println("Delete ID: " + id); // debug

                PreparedStatement ps = con.prepareStatement(
                        "DELETE FROM feedback WHERE id=?"
                );

                ps.setInt(1, Integer.parseInt(id));

                int result = ps.executeUpdate();
                System.out.println("Deleted rows: " + result);

                res.sendRedirect("feedback.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        try {
            System.out.println("SUBMIT CLICKED");

            int userId = (int) req.getSession().getAttribute("userId");
            String message = req.getParameter("message");

            if (message == null || message.trim().isEmpty()) {
                System.out.println("Message empty!");
                return;
            }

            message = message.trim();
            System.out.println("Message: " + message);

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO feedback(user_id, message) VALUES (?,?)"
            );

            ps.setInt(1, userId);
            ps.setString(2, message);

            int result = ps.executeUpdate();
            System.out.println("Inserted rows: " + result);

            res.sendRedirect("feedback.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}