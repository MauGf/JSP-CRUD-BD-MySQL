<%-- 
    Document   : buscaAlumno
    Created on : 28-02-2018, 22:37:01
    Author     : Mau
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado de busqueda</title>  
        <link href='https://fonts.googleapis.com/css?family=Raleway:400,300,500,700,900' rel='stylesheet' type='text/css'>
        <!-- Material Icons CSS -->
        <link href="assets/fonts/iconfont/material-icons.css" rel="stylesheet">
        <!-- FontAwesome CSS -->
        <link href="assets/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- magnific-popup -->
        <link href="assets/css/magnific-popup.css" rel="stylesheet">
        <!-- flexslider -->
        <link href="assets/flexSlider/flexslider.css" rel="stylesheet">
        <!-- materialize -->
        <link href="assets/materialize/css/materialize.min.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <!-- shortcodes -->
        <link href="assets/css/shortcodes.css" rel="stylesheet">
        <link href="assets/css/page-tittle.css" rel="stylesheet">
        <link href="assets/css/header.css" rel="stylesheet">

        <!-- Main Style CSS -->
        <link href="assets/css/style.css" rel="stylesheet">
        <!-- Creative CSS -->
        <link href="assets/css/creative.css" rel="stylesheet">
    </head>
    <body id="top" class="has-header-search">
        
        
        
        <section class="page-title ptb-50">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h2>
                            <%
                                HttpSession creasesion = request.getSession();
                                String Administrador;
                                String nivel;
                                String Asistente;
                                String nivel2;
                                String Registro;
                                String nivel3;
                                String newIngreso;
                                String nivel4;
                                if (creasesion.getAttribute("acceso") != null && creasesion.getAttribute("nivel") != null) {
                                    Administrador = creasesion.getAttribute("acceso").toString();
                                    nivel = creasesion.getAttribute("nivel").toString();
                                       out.print("<a href='login.jsp?cerrar=true'> Salir: " + Administrador + " </a><br>");
                                    out.print("Rol: Administrador <br>");

                                } else if (creasesion.getAttribute("asistente") != null && creasesion.getAttribute("nivel") != null) {
                                    Asistente = creasesion.getAttribute("asistente").toString();
                                    nivel2 = creasesion.getAttribute("nivel").toString();
                                    out.print("<a href='login.jsp?cerrar=true'> Salir: " + Asistente + " </a><br>");
                                    out.print("Rol: Asistente <br>");

                                } else if (creasesion.getAttribute("registro") != null && creasesion.getAttribute("nivel") != null) {
                                    Registro = creasesion.getAttribute("registro").toString();
                                    nivel3 = creasesion.getAttribute("nivel").toString();
                                    out.print("<a href='login.jsp?cerrar=true'> Salir: " + Registro + " </a><br>");
                                    out.print("Rol: Registro Academico <br>");

                                } else if (creasesion.getAttribute("nuevo_ingreso") != null && creasesion.getAttribute("nivel") != null) {
                                    newIngreso = creasesion.getAttribute("nuevo_ingreso").toString();
                                    nivel4 = creasesion.getAttribute("nivel").toString();
                                    out.print("<a href='login.jsp?cerrar=true'> Salir: " + newIngreso + " </a><br>");
                                    out.print("Rol: Nuevo Ingreso <br>");

                                } else {
                                    out.print("<script>location.replace('login.jsp');</script>");
                                }
                            %>
                        </h2>
                       <ol class="breadcrumb">
                            <li><a href="index.jsp" style="color: blue">Home </a></li>
                            <li class="active">Universidad</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>
        <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/universidad","root", "practicaphp");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");

      ResultSet listado = s.executeQuery ("SELECT COUNT(*) FROM alumnos WHERE nombre LIKE '%" + request.getParameter("nombrealumno") + "%'");
      listado.next();
      int coincidencias = listado.getInt(1);

      // Si no se encuentra ningún alumno con el nombre especificado,
      // volvemos a la página principal.
      if (coincidencias == 0) {
        out.println("<script>document.location = \"index2.jsp\"</script>");
      }

      ResultSet listado2 = s.executeQuery ("SELECT * FROM alumnos WHERE nombre LIKE '%" + request.getParameter("nombrealumno") + "%'");

      // Si hay un único alumno con el nombre especificado, vamos directamente
      // a la página de detalle.
      if (coincidencias == 1) {
        listado2.next();
        out.println("<script>document.location = \"detalleAlumno.jsp?clavealumno=" + listado2.getInt("clave_alumno") + "\"</script>");
      }

      // Si hay varios alumnos cuyos nombres coinciden con el patrón buscado,
      // se muestran todos esos nombres para que el usuario elija.
        if (coincidencias > 1) {
        %>
        <section class="section-padding ">
            <div class="container">
                <div class="col-md-8 col-md-offset-2">
                    <h2 class="section-title text-uppercase center">Alumnos  Encontrados</h2>
                    <table class="table table-striped">
                        <thead><th>Nombre</th><th></th></thead>
                            <%
                                while (listado2.next()) {
                            %>
                        <tr>
                            <td><%=listado2.getString("nombre")%></td>
                        <form method="post" action="detalleAlumno.jsp">
                            <input type="hidden" name="clavealumno" value="<%=listado2.getString("clave_alumno")%>">
                            <td>
                                <button class="btn waves-effect waves-light center  light-blue darken-1" type="submit" name="editar">
                                    <i class="fa fa-plus-circle"></i> Detalle
                                </button>
                            </td>
                        </form>
                        </tr>
                        <%
                            } // while
                        %>
                    </table>
                </div>
            </div>
        </section>
        <%
            } // if
            conexion.close();
        %>




        <!-- jQuery -->
        <script src="assets/js/jquery-2.1.3.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/materialize/js/materialize.min.js"></script>
        <script src="assets/js/jquery.easing.min.js"></script>
        <script src="assets/js/smoothscroll.min.js"></script>
        <script src="assets/js/jquery.inview.min.js"></script>
        <script src="assets/js/menuzord.js"></script>
        <script src="assets/js/equalheight.js"></script>
        <script src="assets/js/imagesloaded.js"></script>
        <script src="assets/js/jquery.stellar.min.js"></script>
        <script src="assets/js/jquery.countTo.min.js"></script>
        <script src="assets/js/jquery.shuffle.min.js"></script>
        <script src="assets/js/masonry.pkgd.min.js"></script>
        <script src="assets/js/twitterFetcher.min.js"></script>
        <script src="assets/flexSlider/jquery.flexslider-min.js"></script>
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <script src="assets/js/scripts.js"></script>
    </body>
</html>
