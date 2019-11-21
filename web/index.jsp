<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
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

    <title>Inicio | Broths & Brothers</title>
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

    <div class="row position-relative overflow-hidden p-3 p-md-5 m-md-3 bg-light">
        <div class="col-md-6">
            <h1 class="display-4 font-weight-normal" style="color: #ec3747;">Sazonadores <br> Broths & Brothers</h1>
            <p class="lead font-weight-normal">Llevamos hasta tu mesa el sabor de la más alta cocina mexicana de forma rápida y sencilla, permitiendote disfrutar los momentos importantes de la vida.</p>
            <a class="btn btn-outline-secondary" href="catalog.jsp">Conoce nuestros productos</a>

        </div>
        <div class="col-md-6 text-center">
            <img src="img/inicio/comida.jpg" alt="" class="img-responsive">
        </div>
    </div>

        <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
            <div class="bg-dark mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                <div class="my-3 py-3">
                    <h2 class="display-5">¿Quienes somos?</h2>
                    <p class="lead">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Iste sint </p>
                </div>
                <div class="bg-light box-shadow mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;">
                    <img src="img/inicio/somos.jpg" alt="" class="img-responsive" style="width: 90%;margin-top: 15px;height: 90%;">
                </div>
            </div>
            <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                <div class="my-3 p-3">
                    <h2 class="display-5">Nuestro producto</h2>
                    <p class="lead">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Perferendis cumque dese</p>
                </div>
                <div class="bg-dark box-shadow mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;">
                    <img src="img/inicio/producto.jpg" alt="" class="img-responsive" style="width: 90%;margin-top: 15px;height: 100%;">
                </div>
            </div>
        </div>

        <%@ include file="footer.html" %>


        

    </body>

</html>