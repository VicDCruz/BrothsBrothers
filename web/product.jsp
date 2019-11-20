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
                    <%                        ClsGestorTienda gestor = new ClsGestorTienda();
                        gestor.conectaBD("vicdan1@live.com.mx", "victor");
                        broths.MiModelo mm = gestor.obtenProducto(request.getParameter("id"));
                        try {
                            gestor.desconecta();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        int rows = mm.getRowCount();
                        System.out.println(rows);
                        if (rows == 1) {
                            int stock = Integer.parseInt((String) mm.getValueAt(0, 4));
                            int id = Integer.parseInt((String) mm.getValueAt(0, 0));
                            float price = Float.parseFloat((String) mm.getValueAt(0, 2));
                    %>
                    <div class="col-md-4">
                        <img class="card-img-top" style="width: 100%; height: 225px; display: block;"
                             alt="Thumbnail [100%x225]"
                             src="/BrothsBrothers/img/catalog/<%=mm.getValueAt(0, 3)%>.jpg"
                             data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail"
                             data-holder-rendered="true">
                    </div>
                    <div class="col-md-6 offset-md-1">
                        <h3><%=mm.getValueAt(0, 3)%></h3>
                        <p><%=mm.getValueAt(0, 1)%></p>
                        <h1>$ <%=mm.getValueAt(0, 2)%></h1>
                        <h5>Stock disponible: <%=stock%></h5>
                        <br>
                        <form action="add_to_cart.jsp" method="post">
                            <input type="hidden" name="id" value="<%=id%>">
                            <input type="hidden" name="quantity" value="1">
                            <input type="hidden" name="price" value="<%=price%>">
                            <button 
                                class="btn btn-primary btn-lg
                                <%=stock <= 0 ? "disabled" : ""%>" 
                                type="submit"
                                <%=stock <= 0 ? "disabled=disabled" : ""%>>
                                Agregar al carrito
                            </button>
                        </form>
                    </div>
                    <%} else {%>
                    <h1> ¡Estamos cocinando este producto para ti! &#127869;</h1>
                    <%}%>
                </div>
            </div>
        </div>

        <%@ include file="footer.html" %>
    </body>

</html>