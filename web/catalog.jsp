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
        <%@page import="kiwools.ClsGestorTienda"%>

        <div class="album py-5 bg-light">
            <div class="container">

                <div class="row">
                    <%
                        ClsGestorTienda gestor = new ClsGestorTienda();
                        gestor.conectaBD("vicdan1@live.com.mx", "victor");
                        java.sql.ResultSet r;
                        r = gestor.obtenCatalogo();
                        kiwools.MiModelo mm = new kiwools.MiModelo(r);
                        try {
                            r.close();
                            gestor.desconecta();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        int rows, cols;
                        rows = mm.getRowCount();
                        cols = mm.getColumnCount();
                        //mm.getValueAt(ren, col);
                        
                        int j = 0;

                        for (int i = 0; i < rows; i++) {
                            int stock = Integer.parseInt((String) mm.getValueAt(i, 4));
                    %>
                    <div class="col-md-4">
                        <div class="card mb-4 box-shadow">
                            <a href="product.jsp?id=<%=mm.getValueAt(i, 0)%>">
                                <img class="card-img-top" style="width: 100%; height: 225px; display: block;"
                                     alt="Thumbnail [100%x225]"
                                     src="/Kiwools/img/catalog/<%=mm.getValueAt(i, 3)%>.jpg"
                                     data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail"
                                     data-holder-rendered="true"">
                            </a>
                            <%if (stock <= 0) {%>
                            <div class="card-img-overlay">
                                <h2 class="card-title" style="color:red;">AGOTADO</h2>
                            </div>
                            <%}%>
                            <div class="card-body">
                                <h1><%= mm.getValueAt(i, 3)%> <%=j%></h1>
                                <p class="card-text"><%= mm.getValueAt(i, 1)%></p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <a 
                                            class="btn btn-sm btn-outline-secondary" 
                                            role="button" 
                                            href="catalog.jsp?id=<%=mm.getValueAt(i, 0)%>">
                                            Ver
                                        </a>
                                        <button 
                                            class="btn btn-sm btn-outline-secondary
                                            <%=stock <= 0 ? "disabled" : ""%>" 
                                            type="button">
                                            Comprar
                                        </button>
                                    </div>
                                    <small class="text-muted">$ <%= mm.getValueAt(i, 2)%></small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% }%>
                </div>
            </div>
        </div>

        <%@ include file="footer.html" %>
    </body>

</html>