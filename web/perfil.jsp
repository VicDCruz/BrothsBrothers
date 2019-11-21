<%-- 
    Document   : perfil
    Created on : 19/11/2019, 12:05:30 PM
    Author     : PetiteAmandine
--%>

<%@page import="broths.ClsGestorTienda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <title>Broths & Brothers</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Custom styles for this template -->
        <link href="dashboard.css" rel="stylesheet">

    </head>

    <body>
        <%
            if (session.getAttribute("id") == null || session.getAttribute("miGestor") == null) {
                session.setAttribute("unlogAcc", true);
                response.sendRedirect("login.jsp");
                return;
            }
            ClsGestorTienda gestor = ((ClsGestorTienda) session.getAttribute("miGestor"));
            int id = Integer.parseInt(session.getAttribute("id").toString());
        %>
        <%@ include file="header.jsp" %>

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
                    <br>
                    <div class="border-bottom">
                        <h2>Datos personales</h2>
                    </div>
                    <div class="table-responsive">
                        <%
                            java.sql.ResultSet info = gestor.obtenDatosUsuario(id);
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
                        <button type="button" class="btn btn-sm btn-secondary float-right">Editar</button>
                    </div>
                                
                    <div class="border-bottom">
                        <h2>Direcciones de envío</h2>
                    </div>
                    <%
                        java.sql.ResultSet dirs = gestor.obtenDireccionesUsuario(id);
                        int i = 1;
                        while (dirs.next()) {
                    %>
                    <div class="table-responsive">
                        <h4>Dirección <%=i%></h4>
                        <table class="table table-sm table-borderless table-hover">
                            <tbody>
                                <tr><td>Dirección</td>
                                    <td><%=dirs.getString("address")%></td></tr>
                                <tr><td>Ciudad</td>
                                    <td><%=dirs.getString("city")%></td></tr>
                                <tr><td>Código postal</td>
                                    <td><%=dirs.getString("zipCode")%></td></tr>
                                <tr><td>País</td>
                                    <td><%=dirs.getString("country")%></td></tr>
                            </tbody>
                        </table>
                        <div class="btn-toolbar mb-2 mb-md-0 float-right">
                            <div class="btn-group-vertical mr-2">
                                <button type="button" class="btn btn-sm btn-secondary">Editar</button>
                                <button type="button" class="btn btn-sm btn-danger">Eliminar</button>
                            </div>
                        </div>
                    </div>
                    <br>
                    <%
                            i++;
                        }
                        if (i == 1) {
                        // Indicar que no hay direcciones guardadas.
                    %>
                    <h5>¡Aún no tienes direcciones guardadas!</h5>
                    <%
                        }
                    %>
                    <br>
                    <div class="btn-toolbar mb-2 mb-md-0 float-right">
                        <div class="btn-group-vertical mr-2">
                            <button type="button" class="btn btn-sm btn-info">Agregar</button>
                        </div>
                    </div>
                    <br><br>
                    
                    <div class="border-bottom">
                        <h2>Métodos de pago</h2>
                    </div>
                    <%
                        java.sql.ResultSet pagos = gestor.obtenMetodosPagoUsuario(id);
                        i = 1;
                        while (pagos.next()) {
                    %>
                    <div class="table-responsive">
                        <h4>Método <%=i%></h4>
                        <table class="table table-sm table-borderless table-hover">
                            <tbody>
                                <tr><td>Tipo</td>
                                    <td><%=pagos.getString("type")%></td></tr>
                                <tr><td>Descripción</td>
                                    <td><%=pagos.getString("description")%></td></tr>
                            </tbody>
                        </table>
                        <div class="btn-toolbar mb-2 mb-md-0 float-right">
                            <div class="btn-group-vertical mr-2">
                                <button type="button" class="btn btn-sm btn-secondary">Editar</button>
                                <button type="button" class="btn btn-sm btn-danger">Eliminar</button>
                            </div>
                        </div>
                    </div>
                    <br>
                    <%
                            i++;
                        }
                        if (i == 1) {
                        // Indicar que no hay métodos de pago guardados.
                    %>
                    <h5>¡Aún no tienes métodos de pago guardados!</h5>
                    <%
                        }
                    %>
                    <br>
                    <div class="btn-toolbar mb-2 mb-md-0 float-right">
                        <div class="btn-group-vertical mr-2">
                            <button type="button" class="btn btn-sm btn-info">Agregar</button>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <%@ include file="footer.html" %>
    </body>

</html>
