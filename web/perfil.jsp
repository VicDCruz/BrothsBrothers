<%-- 
    Document   : perfil
    Created on : 19/11/2019, 12:05:30 PM
    Author     : PetiteAmandine
--%>

<%@page import="kiwools.ClsGestorTienda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <title>Kiwools</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Custom styles for this template -->
        <link href="dashboard.css" rel="stylesheet">
        
    </head>

    <body>
        <%@ include file="header.html" %>

        <div class="container-fluid">
            <div class="row">
                <nav class="col-md-2 d-none d-md-block bg-light sidebar">
                    <div class="sidebar-sticky">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">
                                    <span data-feather="home"></span>
                                    Mi perfil <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <span data-feather="file"></span>
                                    Pedidos en curso
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <span data-feather="shopping-cart"></span>
                                    Pedidos anteriores
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <main role="main" class="col-md-9 px-4">
                    <%
                        ClsGestorTienda gestor = ((ClsGestorTienda) session.getAttribute("miGestor"));
                        if (gestor == null) {
                            request.getRequestDispatcher("index.jsp").forward(request, response);
                        }
                    %>
                    <div class="border-bottom">
                        <h2>Datos personales</h2>
                    </div>
                    <div class="table-responsive">
                        <%
                            java.sql.ResultSet info = gestor.obtenDatosUsuario(Integer.parseInt(session.getAttribute("id").toString()));
                            info.next();
                        %>
                        <table class="table table-sm table-borderless table-hover">
                            <tbody>
                                <tr>
                                    <td>Nombre</td>
                                    <td><%out.print(info.getString("username"));%></td>
                                </tr>
                                <tr>
                                    <td>Alias</td>
                                    <td><%out.print(info.getString("alias"));%></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><%out.print(info.getString("email"));%></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="border-bottom">
                        <h2>Direcciones de envío</h2>
                    </div>
                        <%
                            java.sql.ResultSet dirs = gestor.obtenDireccionesUsuario(Integer.parseInt(session.getAttribute("id").toString()));
                            while (dirs.next()) {
                                out.println("<div class='table-responsive'>");
                                out.println("<h4>Dirección " + dirs.getString("id") + "</h4>");
                                out.println("<table class='table table-sm table-borderless table-hover'>");
                                out.println("<tbody>");
                                out.println("<tr><td>Dirección</td>");
                                out.println("<td>" + dirs.getString("address") + "</td></tr>");
                                out.println("<tr><td>Ciudad</td>");
                                out.println("<td>" + dirs.getString("city") + "</td></tr>");
                                out.println("<tr><td>Código postal</td>");
                                out.println("<td>" + dirs.getString("zipCode") + "</td></tr>");
                                out.println("<tr><td>País</td>");
                                out.println("<td>" + dirs.getString("country") + "</td></tr>");
                                out.println("</tbody>");
                                out.println("</table");
                                out.println("</div>");
                            }
                        %>
                    <div class="border-bottom">
                        <h2>Métodos de pago</h2>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-sm table-borderless table-hover">
                            <tbody>
                                <tr>
                                    <td>Nombre</td>
                                    <td>Lorem</td>
                                </tr>
                                <tr>
                                    <td>Alias</td>
                                    <td>Lorem</td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td>Lorem</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </main>
            </div>
        </div>
       
        <%@ include file="footer.html" %>
    </body>

</html>
