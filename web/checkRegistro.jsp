<%-- 
    Document   : checkRegistro
    Created on : 19/11/2019, 08:53:42 PM
    Author     : cecij
--%>

<%@page import="broths.ClsGestorTienda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
</head>
<body>
    <%@ include file="header.jsp" %>
    <form>
        <div class="container">
            <div class="form-row">
                <div class="col-md-4 mx-auto">
                    <%
                        ClsGestorTienda gestor = new ClsGestorTienda();
                        gestor.conectaBD();

                        if (gestor.conectado()) {
                            String[] arr_nomCampos = new String[5];
                            String[] arr_valCampos = new String[5];

                            arr_valCampos[0] = (gestor.cuentaUsuarios() + 1) + "";
                            arr_valCampos[1] = request.getParameter("email");
                            arr_valCampos[2] = request.getParameter("name");
                            arr_valCampos[3] = request.getParameter("alias");
                            arr_valCampos[4] = request.getParameter("password");

                            arr_nomCampos[0] = "id";
                            arr_nomCampos[1] = "email";
                            arr_nomCampos[2] = "username";
                            arr_nomCampos[3] = "alias";
                            arr_nomCampos[4] = "password";

                            if (gestor.altaUsuario(arr_nomCampos, arr_valCampos)) {
                    %>
                    <br><h4>Usuario registrado con Exito</h4>
                    <p>
                        <%
                            broths.MiModelo mm = gestor.obtenModeloUsuario(arr_valCampos[0]);
                            for (int col = 0; col < mm.getColumnCount() - 1; col++) {
                        %>
                        <br><%=mm.getColumnName(col)%>: <%=(String) mm.getValueAt(0, col)%>;
                        <%
                            }
                        %>
                    </p>
                    <%
                    } else {
                    %>
                    <br>
                    <h4 class="alert-heading">No se registro al usuario</h4>
                    <p>
                        <%
                            for (int col = 0; col < arr_valCampos.length-1; col++) {
                        %>
                        <br>
                        <%=arr_nomCampos[col]%>: <%= arr_valCampos[col]%>
                        <%
                            }
                        %>
                    </p>
                    <%
                            }
                            gestor.desconecta();
                        }
                    %>
                </div>
            </div>
        </div>

    </form>

    <%@ include file="footer.html" %>

</body>
</html>