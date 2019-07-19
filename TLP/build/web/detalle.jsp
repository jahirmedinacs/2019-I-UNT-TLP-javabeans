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
  <meta name="theme-color" content="#ffffff">

  <!-- Favicon -- END -->

</head>
<body>
  <!-- BODY -- START -->

<ul id="navbaroptions" class="dropdown-content">
  <li><a class="black-text" href="#" onclick="window.close();">Cerrar Vista en Detalle</a></li>
  <li class="divider"></li>
  <li><a class="black-text" href="index.html">Cerrar Sesion</a></li>
</ul>

  <nav>
    <div class="nav-wrapper teal darken-4">
      <a href="#!" class="brand-logo center dropdown-trigger hoverable" data-target="navbaroptions">
        <i class="Large material-icons">done_all</i>SGREN
      </a>
    </div>
  </nav>
  <!-- JSP SECTION -->

  <%
  //Consultas
  String nombrecompleto = "";
  String codigoprofesor = "";

  consulta = "SELECT * FROM usuario WHERE userid='"+userid+"'";

  ps = conexion.prepareStatement(consulta); 
  rs = ps.executeQuery();

  while(rs.next()){

    codigoprofesor = rs.getString("codigo");

    nombrecompleto = rs.getString("nombre") + " ";
    nombrecompleto = nombrecompleto + rs.getString("primerapellido") + " ";
    nombrecompleto = nombrecompleto + rs.getString("segundoapellido") + " ";
    nombrecompleto = nombrecompleto + rs.getString("segundonombre");
  }
  %>    

  <!-- HEADER START -->
  </br>
  <center>
  <div class="container card-panel center-align">
    <!-- DIVISION-->
    <div class="divider"></div>
    <div class="row"></div>
    <!-- DIVISION-->

    <div class="row valign-wrapper">
    <div class="col s6">
        <div class="row valign-wrapper">
          <div class="col s2"></div>
          <div class="col s8">
            <a class="waves-effect waves-light btn-large" target="_blank" href="modificar.jsp?nuevo=1">
              <div class="center-align">
                <h6>Registrar<i class="medium material-icons">edit school</i></h6>
              </div>
            </a>
          </div>
        </div>
      </div>
      <div class="col s2 offset-s2">
        <img class="materialboxed responsive-img" data-caption="Foto de Perfil" width="100" src="assets/temp/user/profesor.png">
      </div>
      <div class="col s4">
         <div class="row">
            <div class="col s12">
            <b><%=nombrecompleto%></b>
            </div>
         </div>
          <div class="row">
            <div class="col s12">
            <b><%=codigoprofesor%></b>
            </div>
          </div>
      </div>
    </div>
    
    <!-- DIVISION-->
    <div class="divider"></div>
    <div class="row"></div>
    <!-- DIVISION-->
    <div class="card-action">
      <ul class="pagination">
    <!-- JSP START -->
    <%
      String active_curse_id = "";
      active_curse_id = request.getParameter("curso_select");
      
    consulta = "select * from curso inner join profesorea on curso.id ";
    consulta += "= profesorea.curso_id where profesorea.usuario_id="+uniqueid;
    consulta += " and profesorea.curso_id="+active_curse_id;

      ps = conexion.prepareStatement(consulta); 
      rs = ps.executeQuery();

      String report_id, report_nombre, report_n_horas, report_creditos, report_curso_id, report_usuario_id, report_fecha, report_vence, report_activo;
      report_id = "";
      report_nombre = "";
      report_n_horas = "";
      report_creditos = "";
      report_curso_id = "";
      report_usuario_id = "";
      report_fecha = "";
      report_vence = "";
      report_activo = "";

      String rs_id, rs_nombre;
      while(rs.next()){

        rs_id = rs.getString("id");
        rs_nombre = rs.getString("nombre");
        
        if (rs_id.equals(active_curse_id)){
          report_id = rs.getString("id");
          report_nombre = rs.getString("nombre");
          report_n_horas = rs.getString("n_horas");
          report_creditos = rs.getString("creditos");
          report_curso_id = rs.getString("curso_id");
          report_usuario_id = rs.getString("usuario_id");
          report_fecha = rs.getString("fecha");
          report_vence = rs.getString("vence");
          report_activo = rs.getString("activo");

        %>
          <li class="active hoverable"><a href="#" class="light-green darken-2"><%=rs_nombre%></a></li>
        <%
        }
        else{
        %>
          <li class="waves-effect hoverable"><a href="#"><%=rs_nombre%></a></li>
        <%
        }

      }
     %>
    <!-- SJP END -->
      </ul>
    </div>

  </div>
  </center>
    <!-- HEADER END -->
    <%
    if (request.getParameter("curso_select") == null) {
    %>
    <div class="divider"></div>
    <%
  } else {
    
    String alumno_uniqueid;
    alumno_uniqueid = request.getParameter("alumno_cod");

    consulta = "select registro.nota_id, registro.fecha, nota.notas, nota.primerarevision, ";
    consulta += "nota.segundaversion, nota.parcial, nota.final, nota.promocional, ";
    consulta += "registro.observacion as 'detalle', reporte.observacion from registroGeneral";
    consulta += " inner join (nota inner join (reporte inner join registro on reporte.nota_id";
    consulta += " = registro.nota_id ) on reporte.nota_id = nota.id) on registroGeneral.nota_id";
    consulta += " = nota.id where registroGeneral.usuario_id=" + alumno_uniqueid;
    consulta += " and registroGeneral.curso_id=" + active_curse_id;
    
    ps = conexion.prepareStatement(consulta); 
    rs = ps.executeQuery();
  %>

  </br>
  <div class="container center-align">
    <div class="row"></div>
    <div class="row">
      <div class="col s1"></div>
      <div class="col s3"><b>Curso</b> : <%=report_nombre%></div>
      <div class="col s1"></div>
      <div class="col s3"><b>Creditos</b> : <%=report_creditos%></div>
      <div class="col s1"></div>
      <div class="col s3"><b>Horas Semanales</b> : <%=report_n_horas%></div>
    </div>
    <div class="row"></div>
    <div class="row">
      <div class="col s2"></div>
      <div class="col s8">
        <h5>
          <b>Alumno</b> : <%=request.getParameter("alumno_nombre")%>
        </h5>
      </div>
      <div class="col s2"></div>
    </div>
    <div class="row">
      <div class="col s12">
        <table class="highlight">
          <thead>
            <tr>
                <th class="left-align">Modificar</th>
                <th class="center-align">Fecha</th>
                <th class="center-align">1er Revision</th>
                <th class="center-align">2da Revision</th>
                <th class="center-align">Examen Parcial</th>
                <th class="center-align">Examen Final</th>
                <th class="center-align">Nota Promocional</th>
                <th class="center-align">Nota</th>
                <th class="center-align">Detalle</th>
                <th class="center-align">Observacion</th>
            </tr>
          </thead>

          <tbody>
          <%

          String clean_table_primerarevision = "";
          String clean_table_segundaversion = "";
          String clean_table_parcial = "";
          String clean_table_final = "";
          String clean_table_promocional = "";

          String table_fecha, table_notas, table_primerarevision, table_segundaversion, table_parcial, table_final, table_promocional, table_detalle, table_observacion;

          table_fecha = "";
          table_notas = "";
          table_primerarevision = "";
          table_segundaversion = "";
          table_parcial = "";
          table_final = "";
          table_promocional = "";
          table_detalle = "";
          table_observacion = "";
          
          String table_nota_id = "";

          while(rs.next()){
            table_fecha = rs.getString("fecha").toString();
            table_notas = rs.getString("notas");
            clean_table_primerarevision = rs.getString("primerarevision");
            table_primerarevision = rs.getString("primerarevision");
            if (table_primerarevision.equals("1")){
              table_primerarevision = "<i class=\"small material-icons circle light-green darken-1\">check_circle</i>";
            } else {table_primerarevision = "<i class=\"small material-icons circle grey accent-2\">remove_circle</i>";}
            clean_table_segundaversion = rs.getString("segundaversion");
            table_segundaversion = rs.getString("segundaversion");
            if (table_segundaversion.equals("1")){
              table_segundaversion = "<i class=\"small material-icons circle light-green darken-1\">check_circle</i>";
            } else {table_segundaversion = "<i class=\"small material-icons circle grey accent-2\">remove_circle</i>";}
            clean_table_parcial = rs.getString("parcial");
            table_parcial = rs.getString("parcial");
            if (table_parcial.equals("1")){
              table_parcial = "<i class=\"small material-icons circle light-green darken-1\">check_circle</i>";
            } else {table_parcial = "<i class=\"small material-icons circle grey accent-2\">remove_circle</i>";}
            clean_table_final = rs.getString("final");
            table_final = rs.getString("final");
            if (table_final.equals("1")){
              table_final = "<i class=\"small material-icons circle light-green darken-1\">check_circle</i>";
            } else {table_final = "<i class=\"small material-icons circle grey accent-2\">remove_circle</i>";}
            clean_table_promocional = rs.getString("promocional");
            table_promocional = rs.getString("promocional");
            if (table_promocional.equals("1")){
              table_promocional = "<i class=\"small material-icons circle light-green darken-1\">check_circle</i>";
            } else {table_promocional = "<i class=\"small material-icons circle grey accent-2\">remove_circle</i>";}
            table_detalle = rs.getString("detalle");
            table_observacion = rs.getString("observacion");

            table_nota_id = rs.getString("nota_id");

            %>
            <tr>
              <td class="left-align">
                <a target="_blank"href="modificar.jsp?nuevo=0&ref_nota_id=<%=table_nota_id%>&ref_curso_id=<%=active_curse_id%>&ref_alumno_id=<%=alumno_uniqueid%>&ref_fecha=<%=table_fecha%>&ref_primerarevision=<%=clean_table_primerarevision%>&ref_segundaversion=<%=clean_table_segundaversion%>&ref_parcial=<%=clean_table_parcial%>&ref_final=<%=clean_table_final%>&ref_promocional=<%=clean_table_promocional%>&ref_notas=<%=table_notas%>&ref_detalle=<%=table_detalle%>&ref_observacion=<%=table_observacion%>"
                  class="btn-small card-panel green hoverable"><i class="tiny material-icons">mode_edit</i>Modificar</a>
              </td>
              <td class="left-align"><%=table_fecha%></td>
              <td class="center-align"><%=table_primerarevision%></td>
              <td class="center-align"><%=table_segundaversion%></td>
              <td class="center-align"><%=table_parcial%></td>
              <td class="center-align"><%=table_final%></td>
              <td class="center-align"><%=table_promocional%></td>
              <td>
                <center>
                  <h5><b><%=table_notas%></b></h5>
                </center>
              </td>
              <td class="right-align"><%=table_detalle%></td>
              <td class="right-align"><%=table_observacion%></td>
            </tr>
            <%
          }
          %>
          </tbody>
        </table>
      </div>
    </div>
  </div>

<%
  }
%>

  <!-- Page Content goes here -->

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
