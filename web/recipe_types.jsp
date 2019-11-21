<%-- 
    Document   : recipes
    Created on : 20/11/2019, 09:32:03 AM
    Author     : cecij
--%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="broths.ClsGestorTienda"%>
<html>

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <!-- Font awesome CSS -->
        <link rel="stylesheet" href="common/fontawesome.css" crossorigin="anonymous">
        <link rel="stylesheet" href="common/all.css" crossorigin="anonymous">



        <!-- Main CSS -->
        <link rel="stylesheet" href="common/main.css" crossorigin="anonymous">

        <title>Recetas | Broths & Brothers</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <!-- JS Fontawesome -->
        <script src="common/all.js"></script>

        <!-- JS Sweetalert -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.3.16/dist/sweetalert2.all.min.js"></script>
    </head>

    <body>
        <%@ include file="header.jsp" %>

        <div class="album py-5 bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-4">
                        <div class="card" style="width: 18rem;">
                            <img class="card-img-top" style="width: 100%; height: 225px; display: block;"
                                 alt="Thumbnail [100%x225]"
                                 src="/BrothsBrothers/img/recipes/pollo.jpg"
                                 data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail"
                                 data-holder-rendered="true">
                            <div class="card-body">
                                <h5 class="card-title">Pollo</h5>
                                <p class="card-text">En está sección encontrarás todas las recetas para pollo.</p>
                                <button type="button" class="btn btn-outline-success" id="p">Ver recetas</button>
                                <script type="text/javascript">
                                    document.getElementById("p").onclick = function () {
                                        location.href = "recipes.jsp?type=pollo";
                                    };
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card" style="width: 18rem;">
                            <img class="card-img-top" style="width: 100%; height: 225px; display: block;"
                                 alt="Thumbnail [100%x225]"
                                 src="/BrothsBrothers/img/recipes/res.jpg"
                                 data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail"
                                 data-holder-rendered="true">
                            <div class="card-body">
                                <h5 class="card-title">Res</h5>
                                <p class="card-text">En está sección encontrarás todas las recetas para res.</p>
                                <button type="button" class="btn btn-outline-success" id="r">Ver recetas</button>
                                <script type="text/javascript">
                                    document.getElementById("r").onclick = function () {
                                        location.href = "recipes.jsp?type=res";
                                    };
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card" style="width: 18rem;">
                            <img class="card-img-top" style="width: 100%; height: 225px; display: block;"
                                 alt="Thumbnail [100%x225]"
                                 src="/BrothsBrothers/img/recipes/pescado.jpg"
                                 data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail"
                                 data-holder-rendered="true">
                            <div class="card-body">
                                <h5 class="card-title">Pescado</h5>
                                <p class="card-text">En está sección encontrarás todas las recetas para pescado.</p>
                                <button type="button" class="btn btn-outline-success" id="pe">Ver más</button>
                                <script type="text/javascript">
                                    document.getElementById("pe").onclick = function () {
                                        location.href = "recipes.jsp?type=pescado";
                                    };
                                </script>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>


    </body>

</html>
