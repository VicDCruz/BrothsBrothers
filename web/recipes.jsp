
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
        <%@page import="broths.ClsGestorTienda"%>

        <div class="album py-5 bg-light">
            <div class="container">                
                <div class="row">
                    <%                        ClsGestorTienda gestor = new ClsGestorTienda();
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
                                     src="/BrothsBrothers/img/recipes/recipes/<%=mm.getValueAt(i, 2)%>.jpg"
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
                    <% }%>
                </div>
            </div>
        </div>

        <div class="row bootstrap snippets">
            <div class="col-md-5 col-md-offset-2 col-sm-10">
                <div class="comment-wrapper">
                    <div class="panel panel-info">
                        <br><div class="panel-heading">
                            Deja tu comentario
                        </div>
                        <div class="panel-body">
                            <textarea class="form-control" placeholder="Escribe tu comentario..." rows="3"></textarea>
                            <br>
                            <button type="button" class="btn btn-info pull-right">Publicar</button>
                            <div class="clearfix"></div>
                            <hr>
                            <ul class="media-list">
                                <li class="media">
                                    <a href="#" class="pull-left">
                                        <img src="https://bootdey.com/img/Content/user_1.jpg" alt="" class="img-circle">
                                    </a>
                                    <div class="media-body">
                                        <span class="text-muted pull-right">
                                            <small class="text-muted">Hace 30 min</small>
                                        </span>
                                        <strong class="text-success">@MartinoMont</strong>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                            Lorem ipsum dolor sit amet, <a href="#">#consecteturadipiscing </a>.
                                        </p>
                                    </div>
                                </li>
                                <br><br><li class="media">
                                    <a href="#" class="pull-left">
                                        <img src="https://bootdey.com/img/Content/user_2.jpg" alt="" class="img-circle">
                                    </a>
                                    <div class="media-body">
                                        <span class="text-muted pull-right">
                                            <small class="text-muted">Hace 1 hora </small>
                                        </span>
                                        <strong class="text-success">@LaurenceCorreil</strong>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                            Lorem ipsum dolor <a href="#">#ipsumdolor </a>adipiscing elit.
                                        </p>
                                    </div>
                                </li>
                                <br><br><li class="media">
                                    <a href="#" class="pull-left">
                                        <img src="https://bootdey.com/img/Content/user_3.jpg" alt="" class="img-circle">
                                    </a>
                                    <div class="media-body">
                                        <span class="text-muted pull-right">
                                            <small class="text-muted">Hace 2 horas</small>
                                        </span>
                                        <strong class="text-success">@JohnNida</strong>
                                        <p>
                                            Lorem ipsum dolor <a href="#">#sitamet</a> sit amet, consectetur adipiscing elit.
                                        </p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <%@ include file="footer.html" %>
    </body>

</html>

