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
        <%@ include file="header.html" %>

        <form action="checkRegistro.jsp">
            <div class="container">
                <div class="form-row">
                    <div class="col-md-4 mx-auto">
                         <input type="hidden" id="custId" name="custId" value="4">
                        <br><br> <label for="mail">Correo Electronico</label>
                        <input type="email" class="form-control" id="mail" placeholder="Correo Electronico" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-4 mx-auto">
                        <br><label for="pass">Contraseña</label>
                        <input type="password" class="form-control" id="pass" placeholder="Contraseña"required>
                    </div>
                </div>
                 <div class="form-row">
                <div class="col-md-4 mx-auto">
                    <br><label for="nomb">Nombre</label>
                    <input type="text" class="form-control" id="nomb" placeholder="" required>
                </div>
                 </div>
                <div class="form-row">
                <div class="col-md-4 mx-auto">
                    <br><label for="ali">Alias</label>
                    <input type="text" class="form-control" id="ali" placeholder="" required>
                </div>
                    </div>
                <div class="form-row">
                <div class="col-md-4 mx-auto">
                    <br><br> <button type="submit" class="btn btn-primary">Registrar</button>
                </div>
                    </div>
            </div>

        </form>
        <%@ include file="footer.html" %>
    </body>

</html>