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

        <title>Broths & Brothers</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>

    <body>
        <%@ include file="header.html" %>

        <div class="album py-5 bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-4">
                        <div class="card" style="width: 18rem;">
                            <img class="card-img-top" style="width: 100%; height: 225px; display: block;"
                                 alt="Thumbnail [100%x225]"
                                 src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22508%22%20height%3D%22225%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20508%20225%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_16e8204065c%20text%20%7B%20fill%3A%23eceeef%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A25pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_16e8204065c%22%3E%3Crect%20width%3D%22508%22%20height%3D%22225%22%20fill%3D%22%2355595c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22169.75%22%20y%3D%22123.66899871826172%22%3EThumbnail%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
                                 data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail"
                                 data-holder-rendered="true">
                            <div class="card-body">
                                <h5 class="card-title">Pollo</h5>
                                <p class="card-text">En está sección encontrarás todas las recetas con para pollo.</p>
                                <button type="button" class="btn btn-outline-success" id="p">Ver recetas</button>
                                <script type="text/javascript">
                                document.getElementById("p").onclick = function () {
                                    location.href = "recipesP.jsp";
                                };
                            </script>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card" style="width: 18rem;">
                            <img class="card-img-top" style="width: 100%; height: 225px; display: block;"
                                 alt="Thumbnail [100%x225]"
                                 src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22508%22%20height%3D%22225%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20508%20225%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_16e8204065c%20text%20%7B%20fill%3A%23eceeef%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A25pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_16e8204065c%22%3E%3Crect%20width%3D%22508%22%20height%3D%22225%22%20fill%3D%22%2355595c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22169.75%22%20y%3D%22123.66899871826172%22%3EThumbnail%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
                                 data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail"
                                 data-holder-rendered="true">
                            <div class="card-body">
                                <h5 class="card-title">Res</h5>
                                <p class="card-text">En está sección encontrarás todas las recetas con para res.</p>
                                <button type="button" class="btn btn-outline-success" id="r">Ver recetas</button>
                                <script type="text/javascript">
                                document.getElementById("r").onclick = function () {
                                    location.href = "recipesR.jsp";
                                };
                            </script>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card" style="width: 18rem;">
                            <img class="card-img-top" style="width: 100%; height: 225px; display: block;"
                                 alt="Thumbnail [100%x225]"
                                 src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22508%22%20height%3D%22225%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20508%20225%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_16e8204065c%20text%20%7B%20fill%3A%23eceeef%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A25pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_16e8204065c%22%3E%3Crect%20width%3D%22508%22%20height%3D%22225%22%20fill%3D%22%2355595c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22169.75%22%20y%3D%22123.66899871826172%22%3EThumbnail%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
                                 data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail"
                                 data-holder-rendered="true">
                            <div class="card-body">
                                <h5 class="card-title">Pescado</h5>
                                <p class="card-text">En está sección encontrarás todas las recetas con para pescado.</p>
                                <button type="button" class="btn btn-outline-success" id="pe">Ver más</button>
                                <script type="text/javascript">
                                document.getElementById("pe").onclick = function () {
                                    location.href = "recipesPe.jsp";
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
