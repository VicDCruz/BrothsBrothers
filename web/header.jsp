<%@page import="broths.ShoppingCart"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="site-header sticky-top py-1 bg-light">
    <div class="container d-flex flex-column flex-md-row justify-content-between">
        <%
            ShoppingCart cart = ((broths.ShoppingCart) session.getAttribute("carrito")); 
            int total = 0;
            if (cart != null)
                total = cart.getCount();
        %>
        
        <a class="py-2 d-none d-md-inline-block" href="/BrothsBrothers">Broths & Brothers</a>
        <a class="py-2 d-none d-md-inline-block" href="catalog.jsp">Catálogo</a>
        <a class="py-2 d-none d-md-inline-block" href="recipes.jsp">Recetas</a>
        <a class="py-2 d-none d-md-inline-block" href="cart.jsp">Carrito (<%=total%>)</a>
        <a class="py-2 d-none d-md-inline-block" href="login.html">Iniciar sesión</a>
    </div>
</nav>