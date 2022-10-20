<%@ page import="Beans.Incidencia" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Labtel
  Date: 19/10/2022
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Incidencia> listaIncidencias = (ArrayList<Incidencia>) request.getAttribute("listaIncidencias");
%>
<html>
<head>
    <title>Lista de Incidencias</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <h1>Lista de Incidencias</h1>
        <table class="table">
            <tr>
                <th>IdIncidencia</th>
                <th>fecha</th>
                <th>nombreIncidencia</th>
                <th>zonaPUCP</th>
                <th>latitud</th>
                <th>longitud</th>
                <th>validaIncidencia</th>
                <th>descripcion</th>
                <th>contador_reabierto</th>

            </tr>

            <% for(Incidencia incidencia : listaIncidencias) {%>
            <tr>
                <td> <%= incidencia.getIdIncidencia()%>  </td>
                <td><%= incidencia.getFecha()%> </td>
                <td><%= incidencia.getNombreIncidencia()%> </td>
                <td><%= incidencia.getZonaPUCP()%> </td>
                <td><%= incidencia.getLatitud()%> </td>
                <td><%= incidencia.getLongitud()%> </td>
                <td><%= incidencia.getValidaIncidencia()%> </td>
                <td><%= incidencia.getDescripcion()%> </td>
                <td><%= incidencia.getContador_reabierto()%> </td>
            </tr>
            <% }%>
        </table>
    </div>


</body>
</html>
