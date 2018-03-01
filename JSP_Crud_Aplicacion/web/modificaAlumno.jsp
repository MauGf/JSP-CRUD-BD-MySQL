<%-- 
    Document   : modificaAlumno
    Created on : 28-02-2018, 20:38:50
    Author     : Mau
--%>


<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifica alumno</title>  
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
        <% request.setCharacterEncoding("UTF-8");%>

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

                                if (creasesion.getAttribute("acceso") != null && creasesion.getAttribute("nivel") != null) {

                                    Administrador = creasesion.getAttribute("acceso").toString();
                                    nivel = creasesion.getAttribute("nivel").toString();
                                    out.print("<a href='login.jsp?cerrar=true'> Salir:" + Administrador + " </a><br>");
                                    out.print("Rol: Administrador <br>");

                                } else if (creasesion.getAttribute("asistente") != null && creasesion.getAttribute("nivel") != null) {

                                    Asistente = creasesion.getAttribute("asistente").toString();
                                    nivel2 = creasesion.getAttribute("nivel").toString();
                                    out.print("<a href='login.jsp?cerrar=true'> Salir: " + Asistente + " </a><br>");
                                    out.print("Rol: Asistente <br>");

                                } else if (creasesion.getAttribute("registro") != null && creasesion.getAttribute("nivel") != null) {

                                    out.print("<script>type=\"text/javascript\">alert(\"Lo siento, debes registrarte como administrador\");location.replace('index2.jsp');</script>");

                                } else if (creasesion.getAttribute("nuevo_ingreso") != null && creasesion.getAttribute("nivel") != null) {

                                    out.print("<script>type=\"text/javascript\">alert(\"Lo siento, debes registrarte como administrador\");location.replace('index2.jsp');</script>");

                                } else {

                                    out.print("<script>location.replace('index.jsp');</script>");
                                }
                            %>
                        </h2>
                        <ol class="breadcrumb">
                            <li>Consulta de notas</li>
                            <li class="active">Universidad</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>
        <section class="section-padding ">
            <div class="container">
                <div class="col-md-8 col-md-offset-2">                                                                     
                    <h2 class="section-title text-uppercase center">Atualizar Alumno</h2>
                    <form method="post" action="grabarAlumno.jsp">
                        <div class="input-field blue-text">
                            <i class="material-icons prefix">label_outline</i>
                            <input type="number" name="clavealumno" id="clavealumno" value="<%=request.getParameter("clavealumno")%>" readonly>
                            <label for="clavealumno">Código del Alumno</label>
                        </div>
                        <div class="input-field">
                            <i class="material-icons prefix">account_box</i>
                            <input type="text" name="nombrealumno" id="nombrealumno" value="<%=request.getParameter("nombrealumno")%>" required>
                            <label for="nombrealumno">Nombre</label>
                            <div class="input-field">
                                <i class="material-icons prefix">label</i>
                                <input type="text" name="notas" id="notas" value="<%=request.getParameter("notas")%>" required>
                                <label for="notas">Promedio de Notas</label>
                            </div>
                            <p class="center">
                                <button class="btn waves-effect waves-light center" type="submit" name="aceptar">
                                    Aceptar
                                    <i class="mdi-action-check-circle"></i>
                                </button>
                                <a href="index2.jsp" class="btn waves-effect waves-light center red">
                                    Cancelar
                                    <i class="fa fa-times"></i>
                                </a>
                            </p>
                            <br>                            
                        </div>
                    </form>
                </div>
            </div> 
        </section>

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
</body>
</html>
