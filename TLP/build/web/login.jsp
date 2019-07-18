<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
  <!-- BODY -- START -->
  </br>
  </br>
  <center>
  <div class="container card-panel blue-grey darken-4 white-text z-depth-1">
    <div class="row"></div>
    <div class="divider"></div>
  <%     
    Connection conexion;

    String userid = request.getParameter("userid");
    String password = request.getParameter("password");  
    String driver = "org.mariadb.jdbc.Driver";
    String url = "jdbc:mysql://localhost/registroNotas";
    
    Integer tipo = -1;
    String redirectpage = "index.html";
    String nombrecompleto = "";

    Class.forName(driver);
    try {
      conexion = (Connection) DriverManager.getConnection(url,userid,password);
      session.setAttribute("conexion", conexion);
      
      session.setAttribute("userid", userid);
      session.setAttribute("password", password);
      session.setAttribute("driver", driver);
      session.setAttribute("url", url);

      String consulta = "SELECT * FROM usuario WHERE userid='"+userid+"'";
      PreparedStatement ps;
      ResultSet rs;
      ps = conexion.prepareStatement(consulta); 
      rs = ps.executeQuery();
      
      while(rs.next()){
        tipo = Integer.parseInt(rs.getString("tipo"));
      
        nombrecompleto = rs.getString("nombre");
        nombrecompleto += " ";
        nombrecompleto += rs.getString("primerapellido");

        session.setAttribute("uniqueid", rs.getString("id"));
      }
    } catch(Exception e){
      redirectpage = "index.html";
      %>
      <div class="row">
        <div class="col s2"></div>
        <div class="col s8">
          <h1>ERROR 500</h1>
          <div class="divider grey lighten-3"></div>
          <h4>Acceso no Permitido</h4>
          <script>
          var timer = setTimeout(function() {
            window.location='index.html'
            }, 5000);
          </script>
        </div>
        <div class="col s2"></div>
      </div>
    <%}
    
    switch(tipo) {
      case 1:
        redirectpage = "alumno.jsp";
        %>
          <div class="row">
            <div class="col s2"></div>
            <div class="col s8">
              <h1>Bienvenido <i>Alumno</i></h1>
              <div class="divider grey lighten-3"></div>
              <h4><%=nombrecompleto%></h4>
              <script>
              var timer = setTimeout(function() {
                window.location='<%=redirectpage%>'
                }, 5000);
              </script>
            </div>
            <div class="col s2"></div>
          </div>
        <%
        break;
      case 2:
        redirectpage = "profesor.jsp";
        %>
        <div class="row">
            <div class="col s2"></div>
            <div class="col s8">
              <h1>Bienvenido <i>Profesor</i></h1>
              <div class="divider grey lighten-3"></div>
              <h4><%=nombrecompleto%></h4>
              <script>
              var timer = setTimeout(function() {
                window.location='<%=redirectpage%>'
                }, 5000);
              </script>
            </div>
            <div class="col s2"></div>
          </div>
        <%
        break;
      case 3:
        redirectpage = "administrador.jsp";
        %>
        <div class="row">
            <div class="col s2"></div>
            <div class="col s8">
              <h1>Bienvenido <i>Administrador</i></h1>
              <div class="divider grey lighten-3"></div>
              <h4><%=nombrecompleto%></h4>
              <script>
              var timer = setTimeout(function() {
                window.location='<%=redirectpage%>'
                }, 5000);
              </script>
            </div>
            <div class="col s2"></div>
          </div>        
        <%
        break;
      default:
        %>
        <!-- pass -->
        <%
    }
    
    %>
    <!-- ##### REDIRECCIONAMIENTO -->
    <div class="divider"></div>
    <div class="row">
      <div class="col s2"></div>
      <a alt="Click para Redirigir ahora" href="#" onclick="window.location='<%=redirectpage%>';" class="grey-text lighten-5" >
      <div class="col s8 blue-grey darken-3 hoverable z-depth-2">
        Redireccionando en 5 segundos
      </div>
      </a>
      <div class="col s2"></div>
    </div>
    <div class="row">
        <div class="preloader-wrapper big active">
          <div class="spinner-layer spinner-blue">
            <div class="circle-clipper left">
              <div class="circle"></div>
            </div><div class="gap-patch">
              <div class="circle"></div>
            </div><div class="circle-clipper right">
              <div class="circle"></div>
            </div>
          </div>

          <div class="spinner-layer spinner-red">
            <div class="circle-clipper left">
              <div class="circle"></div>
            </div><div class="gap-patch">
              <div class="circle"></div>
            </div><div class="circle-clipper right">
              <div class="circle"></div>
            </div>
          </div>

          <div class="spinner-layer spinner-yellow">
            <div class="circle-clipper left">
              <div class="circle"></div>
            </div><div class="gap-patch">
              <div class="circle"></div>
            </div><div class="circle-clipper right">
              <div class="circle"></div>
            </div>
          </div>

          <div class="spinner-layer spinner-green">
            <div class="circle-clipper left">
              <div class="circle"></div>
            </div><div class="gap-patch">
              <div class="circle"></div>
            </div><div class="circle-clipper right">
              <div class="circle"></div>
            </div>
          </div>
        </div>
    </div>
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