
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
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
    </head>

    <body>
        <%@ include file="header.html" %>
        <%@page import="broths.ClsGestorTienda"%>

        <div class="album py-5 bg-light">
            <div class="container">                
                <div class="row">
                    <%
                        ClsGestorTienda gestor = new ClsGestorTienda();
                        gestor.conectaBD();
                        java.sql.ResultSet r;
                        
                        r = gestor.obtenRecetas(request.getParameter("type"));
                        broths.MiModelo mm = new broths.MiModelo(r);
                        try {
                            r.close();
                            gestor.desconecta();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        int rows;
                        rows = mm.getRowCount();
                        for (int i = 0; i < rows; i++) {
                    %>
                    <div class="col-md-4">
                        <div class="card mb-4 box-shadow">
                            <div class="card-body">
                                <img class="card-img-top" style="width: 100%; height: 225px; display: block;"
                                     alt="Thumbnail [100%x225]"
                                     src="/BrothsBrothers/img/recipes/recipes/<%=mm.getValueAt(i,2)%>.jpg"
                                     data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail"
                                     data-holder-rendered="true">
                                <h1 class="card-title"><%= mm.getValueAt(i, 2)%></h1>
                                <p class="card-text"><%= mm.getValueAt(i, 3)%></p>
                            </div>
                        </div>
                    </div>
                    <% }%>
                    <% if (rows == 0) { %>
                    <h1>Lo sentimos, sin resultados &#127869;</h1>
                    <% } %>
                </div>
            </div>
        </div>

        <%@ include file="footer.html" %>
    </body>

</html>

