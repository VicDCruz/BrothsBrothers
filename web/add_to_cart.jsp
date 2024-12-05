<%@page import="broths.ShoppingCart"%>
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
        <%
            ShoppingCart cart = ((broths.ShoppingCart) session.getAttribute("carrito")); 
            if (cart == null)
                cart = new ShoppingCart();
            int id = Integer.parseInt((String) request.getParameter("id"));
            int quantity = Integer.parseInt((String) request.getParameter("quantity"));
            float price = Float.parseFloat((String) request.getParameter("price"));
            String name = (String) request.getParameter("name");
            cart.add(id, name, quantity, price);
            session.setAttribute("carrito", cart);
            request.getRequestDispatcher("catalog.jsp").forward(request, response);
        %>
    </body>

</html>