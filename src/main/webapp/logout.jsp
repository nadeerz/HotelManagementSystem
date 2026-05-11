<%--
  Created by IntelliJ IDEA.
  User: Deshan
  Date: 5/11/2026
  Time: 3:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>