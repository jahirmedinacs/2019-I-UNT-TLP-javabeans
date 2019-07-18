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
  <li><a class="black-text" href="#!">Cambiar de Usuario</a></li>
  <li><a class="black-text" href="#!">Recargar</a></li>
  <li class="divider"></li>
  <li><a class="black-text" href="#!">Salir</a></li>
</ul>



  <nav>
    <div class="nav-wrapper teal darken-4">
      <a href="#!" class="brand-logo center dropdown-trigger" data-target="navbaroptions">
        <i class="Large material-icons">done_all</i>SGREN
      </a>
    </div>
  </nav>
        

  <!-- HEADER START -->
  </br>
  <center>
  <div class="container card-panel center-align hoverable">
    <!-- DIVISION-->
    <div class="divider"></div>
    <div class="row"></div>
    <!-- DIVISION-->

    <div class="row valign-wrapper">
      <div class="col s6">
        <div class="row valign-wrapper">
          <div class="col s8">
            <a class="waves-effect waves-light btn-large" href="index.html">
              <div class="center-align">
                <h6>Registrar<i class="medium material-icons">edit school</i></h6>
              </div>
            </a>
          </div>
          <div class="col s8 offset+s1">
            <a class="waves-effect waves-light btn-large" href="index.html">
              <div class="center-align">
                <h6>Reporte<i class="medium material-icons">picture_as_pdf file_download</i></h6>
              </div>
            </a>
          </div>
        </div>
      </div>
      <div class="col s2 offset-s2">
        <img class="materialboxed circle responsive-img" data-caption="Foto de Perfil" width="100" src="assets/temp/user/profile.jpg">
      </div>
      <div class="col s4">
         <div class="row">
            <div class="col s12">
            <b>Jahir Gilberth Medina Lopez</b>
            </div>
         </div>
          <div class="row">
            <div class="col s12">
            <b>Alumno</b>
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
        <li class="waves-effect"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
        <li class="active"><a href="#!">Curso 1</a></li>
        <li class="waves-effect"><a href="#!">Curso 2</a></li>
        <li class="waves-effect"><a href="#!">Curso 3</a></li>
        <li class="waves-effect"><a href="#!">Curso 4</a></li>
        <li class="waves-effect"><a href="#!">Curso 5</a></li>
        <li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
      </ul>
    </div>

  </div>
  </center>
  <!-- HEADER END -->

  </br>
  <div class="container center-align hoverable">
    <div class="row"></div>
    <div class="row">
      <div class="col s4">
        <b>Curso</b> : FOOBAR
      </div>
    </div>
    <div class="row">
      <div class="col s12">
        <table class="highlight">
          <thead>
            <tr>
                <th>Name</th>
                <th>Item Name</th>
                <th>Item Price</th>
            </tr>
          </thead>

          <tbody>
            <tr>
              <td>Alvin</td>
              <td>Eclair</td>
              <td>$0.87</td>
            </tr>
            <tr>
              <td>Alan</td>
              <td>Jellybean</td>
              <td>$3.76</td>
            </tr>
            <tr>
              <td>Jonathan</td>
              <td>Lollipop</td>
              <td>$7.00</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
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