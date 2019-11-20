<%-- 
    Document   : logout
    Created on : 20/11/2019, 02:34:42 PM
    Author     : vicda
--%>

<%@page import="broths.ClsGestorTienda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
            response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
            response.setDateHeader("Expires", 0); // Proxies.
            
            session.removeAttribute("miGestor");
            session.removeAttribute("id");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        %>
    </body>
</html>
