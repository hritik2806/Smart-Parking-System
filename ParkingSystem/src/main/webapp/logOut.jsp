<%-- 
    Document   : logOut
    Created on : 2 Oct, 2021, 6:49:06 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parking System</title>
    </head>
    <body>
        <%
            session.invalidate();
           response.sendRedirect("firstPage.html");
        %>
    </body>
</html>
