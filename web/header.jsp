<%@page import="broths.Product"%>
<%@page import="java.util.ArrayList"%>
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
        

        <a class="py-2 d-none d-md-inline-block my-auto" href="/BrothsBrothers">Broths & Brothers</a>
        <a class="py-2 d-none d-md-inline-block my-auto" href="catalog.jsp">Catálogo</a>
        <a class="py-2 d-none d-md-inline-block my-auto" href="recipes.jsp">Recetas</a>

        <%
        if (session.getAttribute("id") == null) {
        %>
        <a class="py-2 d-none d-md-inline-block text-center" href="login.jsp">
            <i class="fas fa-user"></i>
            <br>
            Iniciar sesión
        </a>
        <%
        } else {
        %>
        <a class="py-2 d-none d-md-inline-block" href="perfil.jsp">Mi perfil</a>
        <a class="py-2 d-none d-md-inline-block" href="logout.jsp">Cerrar sesión</a>
        <%}%>
        <a class="py-2 d-none d-md-inline-block text-center" role="button" data-toggle="modal" data-target=".modal_carrito">
            <i class="fas fa-shopping-cart"></i>
            <br>
            Carrito
        </a>
    </div>
</nav>


<!-- MODAL CARRITO -->
<div class="modal fade modal_carrito " tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title">Mi carrito</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">

                            <table class="table">
                                <thead class="thead-dark">
                                    <tr>
                                        <th width="30%" scope="col">Producto</th>
                                        <th class="text-center" width="30%" scope="col">Cantidad</th>
                                        <th class="text-center" width="30%" scope="col">Precio</th>
                                        <th class="text-center" width="10%" scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>

                            <%
                                ShoppingCart cart = ((broths.ShoppingCart) session.getAttribute("carrito"));
                                int total = 0;
                                if (cart != null) {
                                    total = cart.getCount();
                                    ArrayList<Product> productos = cart.getProducts();

                                    for ( int i=0; i < productos.size(); i++ ) {
                                        Product p = productos.get(i);

                                        out.print( "<tr>" );
                                        out.print( "    <th scope='row'>" + p.getName() + "</th>" );
                                        out.print( "    <td class='text-center'>" + p.getWanted() + "</td>" );
                                        out.print( "    <td class='text-center'>" + p.getPrice() + "</td>" );
                                        out.print( "    <td class='text-center'><a href='delete_item_cart.jsp?id="+p.getId()+"'>Eliminar</a></td>" );
                                        out.print( "</tr>" );

                                    }

                                

                            %>
                                  
                                    <tr style="background: whitesmoke;">
                                        <th colspan="2">Total</th>
                                        <td class="text-center">
                                            <b><%= cart.getTotal() %></b>
                                        </td>
                                    </tr>

                            <%

                                }

                            %>

                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript">
    
    var show = '${show}';

    if (show != '') {
        $('.modal_carrito').modal('show');
    }

</script>