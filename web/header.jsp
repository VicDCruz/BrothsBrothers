
<%@page import="java.net.URLEncoder"%>
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
<nav class="site-header sticky-top py-1 nav-mex">
    <div class="container d-flex flex-column flex-md-row justify-content-between">
        

        <a class="py-2 d-none d-md-inline-block my-auto" href="/BrothsBrothers" style="font-size: 27px;">Broths & Brothers</a>
        <a class="py-2 d-none d-md-inline-block text-center" href="catalog.jsp">
            <i class="fas fa-list"></i>
            <br>
            Catálogo
        </a>
        <a class="py-2 d-none d-md-inline-block text-center" href="recipe_types.jsp">
            <i class="fas fa-utensils"></i>
            <br>
            Recetas
        </a>

        <a class="py-2 d-none d-md-inline-block text-center" href="#" role="button" data-toggle="modal" data-target=".modal_carrito">
            <i class="fas fa-shopping-cart"></i>
            <br>
            Carrito (<span class="tot_carrito">0</span>)
        </a>


        <%
        if (session.getAttribute("id") == null && session.getAttribute("miGestor") == null) {
        %>
        <a class="py-2 d-none d-md-inline-block text-center" href="login.jsp">
            <i class="fas fa-user"></i>
            <br>
            Iniciar sesión
        </a>
        <%
        } else {
        %>
        <div class="dropdown">
          <a class="py-2 d-none d-md-inline-block dropdown-toggle text-center" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-user"></i>
            <br>
            Mi perfil
          </a>

          <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
            <a class="dropdown-item" style="color: black;" href="perfil.jsp">Mi cuenta</a>
            <a class="dropdown-item" style="color: black;" href="logout.jsp">Cerrar sesión</a>
          </div>
        </div>
        <%}%>
        
    </div>
</nav>



<!-- MODAL CARRITO -->
<div class="modal modal_carrito " tabindex="-1" role="dialog" aria-hidden="true">
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

                                <script type="text/javascript"> var total_carrito = 0; </script>

                            <% 


                                String url = request.getRequestURI();
                                url = url.replaceAll("/BrothsBrothers/","");
                                url = url.replaceAll(".jsp","");
                                
                                
                                ShoppingCart cart = ((broths.ShoppingCart) session.getAttribute("carrito"));
                                int total = 0;
                                if (cart != null) {
                                    total = cart.getCount();

                                    out.print( "<script type='text/javascript'> total_carrito = "+total+"; </script>" );

                                    ArrayList<Product> productos = cart.getProducts();

                                    if(productos.size() > 0){

                                        for ( int i=0; i < productos.size(); i++ ) {
                                            Product p = productos.get(i);

                                            out.print( "<tr>" );
                                            out.print( "    <th scope='row'>" + p.getName() + "</th>" );
                                            out.print( "    <td class='text-center'>" + p.getWanted() + "</td>" );
                                            out.print( "    <td class='text-center'>" + p.getPrice() + "</td>" );
                                            out.print( "    <td class='text-center'><a href='delete_item_cart.jsp?id="+p.getId()+"&url="+URLEncoder.encode(url, "UTF-8")+"'>Eliminar</a></td>" );
                                            out.print( "</tr>" );

                                        }

                                    }else{

                                        out.print( "<tr><th colspan='4'>No hay productos en su carrito.</th></tr>" );

                                    }

                                

                            %>
                                  
                                    <tr style="background: whitesmoke;">
                                        <th colspan="2">Total</th>
                                        <td class="text-center">
                                            <b><%= cart.getTotal() %></b>
                                        </td>
                                    </tr>

                            <%

                                }else{
                                    out.print( "<tr><th class='text-center' colspan='4'>No hay productos en su carrito.</th></tr>" );
                                }

                            %>

                                </tbody>
                            </table>

                        </div>

                        <div class="col-md-12 text-right">
                            <button class="btn btn-primary btn_pagar" disabled="true">Pagar</button>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="modal modal_tipos_pago " tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title">Métodos de pago</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                       
                        <div class="col-md-4 text-center">
                            <button class="btn btn-tipo-pago">
                                <img class="img-responsive" style="width: 150px;" src="img/logos/oxxo.svg" alt="">
                                <br>
                                Pago en Oxxo
                            </button>
                        </div>

                        <div class="col-md-4 text-center">
                            <button class="btn btn-tipo-pago btn_pago_tarjeta">
                                <img class="img-responsive" style="width: 150px;" src="img/logos/visa_master.png" alt="">
                                <br>
                                Pago con tarjeta
                            </button>
                        </div>

                        <div class="col-md-4 text-center">
                            <button class="btn btn-tipo-pago">
                                <img class="img-responsive" style="width: 150px;" src="img/logos/paypal.jpg" alt="">
                                <br>
                                Pago con PayPal
                            </button>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="modal modal_pago_tarjeta " tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title">Datos de la tarjeta</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                       
                    <form class="form_pago" action="compra.jsp" method="POST" id="card-form">
                        <fieldset>
                          <legend class="sr-only">Formulario de pago con tarjeta</legend>

                            <div class="alert alert-danger alert_pago text-justify" role="alert" tabindex="0" style="display: none;"> 
                              <h3 class="alert-heading">Errores en el formulario</h3> 
                              <ul class="listado_errores_tarjeta"></ul> 
                            </div> 

                            <div class="row">

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="nombre_tarjetahabiente">Nombre del tarjetahabiente</label>
                                        <input type="text" class="form-control" id="nombre_tarjetahabiente" data-conekta="card[name]">
                                    </div>
                                </div>

                            </div>

                            <div class="row">

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="numero_tarjeta">Número de tarjeta de crédito</label>
                                        <input type="text" class="form-control" id="numero_tarjeta" data-conekta="card[number]">
                                    </div>
                                </div>
                                
                            </div>

                            <div class="row">

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="cvc">CVC</label>
                                        <input type="password" class="form-control" size="3" id="cvc" data-conekta="card[cvc]">
                                      </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="fecha_mes">Fecha de expiración MM</label>
                                        <input type="text" class="form-control" size="2" id="fecha_mes" data-conekta="card[exp_month]">
                                      </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="fecha_anio">Fecha de expiración AAAA</label>
                                        <input type="text" class="form-control" size="4" id="fecha_anio" data-conekta="card[exp_year]">
                                      </div>
                                </div>
                                
                            </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" style="float: right;" class="btn btn-primary">Pagar</button>
            </div>

                        </fieldset>
                    </form>

                </div>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript">
    
    var show = '${show}';
    var compra_realizada = '${compra_realizada}';

    if (show != '') {
        $('.modal_carrito').modal('show');
    }

    if (compra_realizada != '') {

        Swal.fire({
            title: '<strong>Pago exitoso</strong>',
            icon: 'success',
            html:
            'Tu pago fue procesado correctamente, ' +
            'en breve recibirás un correo con tu ticket electrónico.' +
            '<br><br>También puedes realizar un seguimiento de tu paquete desde la sección "mi cuenta" en el apatado "Pedidos en curso"',
            showCloseButton: true,
            showCancelButton: false,
            focusConfirm: true,
            confirmButtonText:
            'Aceptar',
            confirmButtonAriaLabel: 'Aceptar'
        })

    }

    if (total_carrito > 0) {
        $( ".btn_pagar" ).prop( "disabled", false );
    }

    $('.tot_carrito').html(total_carrito);


    $(document).on("click", ".btn_pagar", function() { 
        $('.modal_carrito').modal('hide');
        $('.modal_tipos_pago').modal('show');
    });

    $(document).on("click", ".btn_pago_tarjeta", function() { 
        $('.modal_tipos_pago').modal('hide');
        $('.modal_pago_tarjeta').modal('show');
    });

    $("#card-form").submit(function(event) {

        $('.alert_pago').hide();
        $('.listado_errores_tarjeta').html('');

        var $form = $(this);
        // Previene hacer submit más de una vez
        $form.find("button").prop("disabled", true);

        var numero_tarjeta = $('#numero_tarjeta').val();
        var nombre_tarjetahabiente = $('#nombre_tarjetahabiente').val();
        var cvc = $('#cvc').val();
        var fecha_mes = $('#fecha_mes').val();
        var fecha_anio = $('#fecha_anio').val();

        if (nombre_tarjetahabiente.trim() == '') {
            $('.listado_errores_tarjeta').append('<li><a class="error_formulario" href="#" data-target="nombre_tarjetahabiente">El campo "Nombre del tarjetahabiente" no puede quedar vacío, es necesario ingresar un nombre válido.</a></li>');
        }

        if (numero_tarjeta.trim() == '') {
            $('.listado_errores_tarjeta').append('<li><a class="error_formulario" href="#" data-target="numero_tarjeta">El campo "Número de tarjeta de crédito" no puede quedar vacío, es necesario ingresar un número de tarjeta válido.</a></li>');
        }
        if (cvc.trim() == '') {
            $('.listado_errores_tarjeta').append('<li><a class="error_formulario" href="#" data-target="cvc">El campo "CVC" no puede quedar vacío.</a></li>');
        }
        if (fecha_mes.trim() == '') {
            $('.listado_errores_tarjeta').append('<li><a class="error_formulario" href="#" data-target="fecha_mes">El campo "Fecha de expiración (Mes)" no puede quedar vacío, es necesario ingresar un mes válido.</a></li>');
        }
        if (fecha_anio.trim() == '') {
            $('.listado_errores_tarjeta').append('<li><a class="error_formulario" href="#" data-target="fecha_anio">El campo "Fecha de expiración (Año)" no puede quedar vacío, es necesario ingresar un año válido.</a></li>');
        }

        if( $('.listado_errores_tarjeta').html() ) {
            $('.alert_pago').show();
            $form.find("button").prop("disabled", false);
            return false;
        }

    });

    
    $(document).on("click", ".error_formulario", function() { 
        var id = $(this).attr('data-target');
        $('#'+id).focus();
    });

</script>

