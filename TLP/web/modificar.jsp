<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String userid, password, driver, url, uniqueid;
userid = session.getAttribute("userid").toString();
password = session.getAttribute("password").toString();
driver = session.getAttribute("driver").toString();
url = session.getAttribute("url").toString();
uniqueid = session.getAttribute("uniqueid").toString();

Class.forName(driver);

Connection conexion;
conexion = (Connection) DriverManager.getConnection(url,userid,password);
session.setAttribute("conexion",conexion);

String consulta = "";
PreparedStatement ps;
ResultSet rs;

%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>SGREN - Sistema General de Reporte de Notas</title>

  <style>
    .bgimg_body {
      background-image: url(assets/media/background_df.png); /* The image used */
      background-color: #cccccc; /* Used if the image is unavailable */
      background-repeat: no-repeat; /* Do not repeat the image */
      background-size: cover; /* Resize the background image to cover the entire container */
      background-blend-mode: luminosity;
    }
  </style>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

  <!-- Favicon -- START -->

  <link rel="apple-touch-icon" sizes="57x57" href="assets/favicon/apple-icon-57x57.png">
  <link rel="apple-touch-icon" sizes="60x60" href="assets/favicon/apple-icon-60x60.png">
  <link rel="apple-touch-icon" sizes="72x72" href="assets/favicon/apple-icon-72x72.png">
  <link rel="apple-touch-icon" sizes="76x76" href="assets/favicon/apple-icon-76x76.png">
  <link rel="apple-touch-icon" sizes="114x114" href="assets/favicon/apple-icon-114x114.png">
  <link rel="apple-touch-icon" sizes="120x120" href="assets/favicon/apple-icon-120x120.png">
  <link rel="apple-touch-icon" sizes="144x144" href="assets/favicon/apple-icon-144x144.png">
  <link rel="apple-touch-icon" sizes="152x152" href="assets/favicon/apple-icon-152x152.png">
  <link rel="apple-touch-icon" sizes="180x180" href="assets/favicon/apple-icon-180x180.png">
  <link rel="icon" type="image/png" sizes="192x192"  href="assets/favicon/android-icon-192x192.png">
  <link rel="icon" type="image/png" sizes="32x32" href="assets/favicon/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="96x96" href="assets/favicon/favicon-96x96.png">
  <link rel="icon" type="image/png" sizes="16x16" href="assets/favicon/favicon-16x16.png">
  <link rel="manifest" href="assets/favicon/manifest.json">
  <meta name="msapplication-TileColor" content="#ffffff">
  <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
  <meta name="theme-color" content="#fffSfff">

  <!-- Favicon -- END -->
</head>
<body class="bgimg_body">
  <!-- <div class="row"></div> -->
  <!-- BODY -- START -->
  </br>
  <center>
    <!-- <div class="divider"></div> -->
    </br>
    <%
    String ref_fecha = "";
    String ref_primerarevision = "";
    String ref_segundaversion = "";
    String ref_parcial = "";
    String ref_final = "";
    String ref_promocional = "";
    String ref_notas = "";
    String ref_detalle = "";
    String ref_observacion = "";

    String ref_nota_id = "";
    String ref_curso_id = "";
    String ref_alumno_id = "";


    if(request.getParameter("nuevo").equals("0")){
        ref_fecha= request.getParameter("ref_fecha");
        ref_primerarevision= request.getParameter("ref_primerarevision");
        ref_segundaversion= request.getParameter("ref_segundaversion");
        ref_parcial= request.getParameter("ref_parcial");
        ref_final= request.getParameter("ref_final");
        ref_promocional= request.getParameter("ref_promocional");
        ref_notas= request.getParameter("ref_notas");
        ref_detalle= request.getParameter("ref_detalle");
        ref_observacion= request.getParameter("ref_observacion");

        ref_nota_id= request.getParameter("ref_nota_id");
        ref_curso_id= request.getParameter("ref_curso_id");
        ref_alumno_id= request.getParameter("ref_alumno_id");
    }
    %>

<form class="box" action="" method="post">
    <div class="container pan alling-wrapper z-depth-3 grey lighten-5">
        <div class="row"></div>
        <div class="divider"></div>
        <div class="row"></div>
        <div class="row">
            <div class="col s4">
                <label class="black-text center-align">Nota</label>
                <input class="black-text center-align" type="number" name="mod_nota" value="<%=ref_notas%>">
            </div>
        </div>
        <div class="row">
            <div class="col s1"></div>
            <div class="col s3">
                <label class="black-text">Fecha de Registro</label>
                <input class="black-text" type="date" name="mod_fecha" value="<%=ref_fecha%>">
            </div>
            <div class="col s1"></div>
            <div class="col s3">
                <label class="black-text">
                    <input class="black-text" type="checkbox" class="filled-in" checked="checked" value="<%=ref_primerarevision%>" name="mod_primerarevision"/>
                    <span>Primera Revision</span>
                </label>
            </div>
            <div class="col s1"></div>
            <div class="col s3">
                <label class="black-text">
                    <input class="black-text" type="checkbox" class="filled-in" checked="checked" value="<%=ref_segundaversion%>" name="mod_segundaversion"/>
                    <span>Segunda Revision</span>
                </label>
            </div>
        </div>
        <div class="row">
            <div class="col s1"></div>
            <div class="col s3">
                <label class="black-text">
                    <input class="black-text" type="checkbox" class="filled-in" checked="checked" value="<%=ref_parcial%>" name="mod_parcial"/>
                    <span>Examen Parcial</span>
                </label>
            </div>
            <div class="col s1"></div>
            <div class="col s3">
                <label class="black-text">
                    <input class="black-text" type="checkbox" class="filled-in" checked="checked" value="<%=ref_final%>" name="mod_final"/>
                    <span>Examen Final</span>
                </label>
            </div>
            <div class="col s1"></div>
            <div class="col s3">
                <label class="black-text">
                    <input class="black-text" type="checkbox" class="filled-in" checked="checked" value="<%=ref_promocional%>" name="mod_promocional"/>
                    <span>Nota Promocional</span>
                </label>
            </div>
        </div>
        <div class="row">
            <div class="col s2"></div>
            <div class="col s8">
                <input class="black-text" type="text" name="mod_detalle" value="<%=ref_detalle%>"/>
                <span class="black-text">Detalle</span>
            </div>
            <div class="col s2"></div>
        </div>
        <div class="row">
                <div class="col s2"></div>
                <div class="col s8">
                    <input class="black-text" type="text" name="mod_observacion" value="<%=ref_observacion%>"/>
                    <span class="black-text">Observacion</span>
                </div>
                <div class="col s2"></div>
            </div>
        <div class="row"></div>
        <div class="divider"></div>
        <div class="row"></div>
        <div class="row">
            <div class="col s2"></div>
            <div class="col s3">
                <a href="#" onclick="window.close();" class="btn red hoverable">Cancelar</a>
            </div>
            <div class="col s2"></div>
            <div class="col s3">
                <input type="submit" name="submit" href="#" class="btn green hoverable" value="Actualizar">
                </div>
            <div class="col s2"></div>
        </div>
        <div class="row"></div>
        <div class="divider"></div>
        <div class="row"></div>
    </div>
</form>
  <!-- <div class="divider"></div> -->
  </center>

<center>
<div class="container card-panel white black-text">
    <div class="row"></div>
    <div class="divider"></div>
    <div class="row">
        <div class="col s2"></div>
        <div class="col s8">
<%
String cond_form = "";
cond_form = request.getParameter("submit");

if (request.getParameter("submit") == null){
    %>
        <h5>No se ha realizado ninguna modificacion aun</h5>
    <%
} 
else {
    %><%=ref_notas%><%
}
%>  
        </div>
        <div class="col s2"></div>
    </div>
    <div class="row"></div>
    <div class="divider"></div>
</div>
</center>

  <!-- BODY -- END -->
  <!--  Scripts-->
  <script src="js/materialize.js"></script>
  <script>
    document.addEventListener('DOMContentLoaded', function() {
    M.AutoInit();
  });
  </script>
  </body>
</html>