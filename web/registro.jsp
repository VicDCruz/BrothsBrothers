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

        <form action="checkRegistro.jsp">
            <div class="container">
                <div class="form-row">
                    <div class="col-md-4 mx-auto">
                        <br><br> 
                        <label for="email">Correo Electronico</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Correo Electronico" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-4 mx-auto">
                        <br>
                        <label for="password">Contraseña</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña"required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-4 mx-auto">
                        <br>
                        <label for="name">Nombre</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-4 mx-auto">
                        <br>
                        <label for="alias">Alias</label>
                        <input type="text" class="form-control" id="alias" name="alias" placeholder="" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-4 mx-auto">
                        <br><br>
                        <button type="submit" class="btn btn-primary">Registrar</button>
                    </div>
                </div>
            </div>

        </form>
        <%@ include file="footer.html" %>
    </body>

</html>