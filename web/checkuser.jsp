<%-- 
    Document   : checkuser
    Created on : 19/11/2019, 02:57:36 PM
    Author     : PetiteAmandine
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
          
          ClsGestorTienda gestor = new ClsGestorTienda();
          
          int id = gestor.loginUsuario(request.getParameter("email"), request.getParameter("password"));
          if (id >= 0) {
              session.setAttribute("miGestor", gestor);
              session.setAttribute("id", id);
              session.removeAttribute("error");
              request.getRequestDispatcher("perfil.jsp").forward(request, response);
          } else {
              session.setAttribute("error", true);
              request.getRequestDispatcher("login.jsp").forward(request, response);
          }              
        %>
    </body>
</html>
