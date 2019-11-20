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
        <%@ include file="header.jsp" %>
        <%@page import="broths.ClsGestorTienda"%>

        <div class="album py-5 bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 offset-md-4">
                        <form class="form-inline my-2 my-lg-0" action="catalog.jsp">
                            <input class="form-control mr-sm-2" type="search" placeholder="Buscar productos"
                                   aria-label="Buscar productos" name="words">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                        </form>
                    </div>
                </div>
                <br>
                
                <div class="row">
                    <%
                        ClsGestorTienda gestor = new ClsGestorTienda();
                        gestor.conectaBD();
                        java.sql.ResultSet r;
                        String words = request.getParameter("words");
                        
                            String concat = "";
                        if (words != null && !words.isEmpty())
                            r = gestor.obtenCatalogo(words);
                        else
                            r = gestor.obtenCatalogo();
                        broths.MiModelo mm = new broths.MiModelo(r);
                        try {
                            r.close();
                            gestor.desconecta();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        int rows, cols;
                        rows = mm.getRowCount();
                        cols = mm.getColumnCount();

                        for (int i = 0; i < rows; i++) {
                            int stock = Integer.parseInt((String) mm.getValueAt(i, 4));
                            int id = Integer.parseInt((String) mm.getValueAt(i, 0));
                            float price = Float.parseFloat((String) mm.getValueAt(i, 2));
                    %>
                    <div class="col-md-4">
                        <div class="card mb-4 box-shadow">
                            <a href="product.jsp?id=<%=mm.getValueAt(i, 0)%>">
                                <img class="card-img-top" style="width: 100%; height: 225px; display: block;"
                                     alt="Thumbnail [100%x225]"
                                     src="/BrothsBrothers/img/catalog/<%=mm.getValueAt(i, 3)%>.jpg"
                                     data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail"
                                     data-holder-rendered="true">
                            </a>
                            <%if (stock <= 0) {%>
                            <div class="card-img-overlay">
                                <h2 class="card-title" style="color:red;">AGOTADO</h2>
                            </div>
                            <%}%>
                            <div class="card-body">
                                <h1><%= mm.getValueAt(i, 3)%></h1>
                                <p class="card-text"><%= mm.getValueAt(i, 1)%></p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <form action="product.jsp">
                                            <input type="hidden" name="id" value="<%=id%>">
                                            <button 
                                                class="btn btn-sm btn-outline-secondary
                                                <%=stock <= 0 ? "disabled" : ""%>" 
                                                type="submit"
                                                <%=stock <= 0 ? "disabled=disabled" : ""%>>
                                                Ver
                                            </button>
                                        </form>
                                        <form action="add_to_cart.jsp" method="post">
                                            <input type="hidden" name="id" value="<%=id%>">
                                            <input type="hidden" name="quantity" value="1">
                                            <input type="hidden" name="price" value="<%=price%>">
                                            <button 
                                                class="btn btn-sm btn-outline-secondary
                                                <%=stock <= 0 ? "disabled" : ""%>" 
                                                type="submit"
                                                <%=stock <= 0 ? "disabled=disabled" : ""%>>
                                                Comprar
                                            </button>
                                        </form>
                                    </div>
                                    <small class="text-muted">$ <%=price%></small>
                                </div>
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