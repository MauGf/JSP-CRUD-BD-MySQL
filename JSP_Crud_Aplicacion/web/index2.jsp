<%-- 
    Document   : index2
    Created on : 28-02-2018, 19:21:43
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
        <title>Principal</title>  
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
               
                

        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/universidad", "root", "practicaphp");
            Statement s = conexion.createStatement();
            request.setCharacterEncoding("UTF-8");
            ResultSet listado = s.executeQuery("SELECT * FROM alumnos");
        %>

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
                                    nivel         = creasesion.getAttribute("nivel").toString();
                                       out.print("<a href='login.jsp?cerrar=true'> Salir: " + Administrador + " </a><br>");
                                    out.print("Rol: Administrador <br>");

                                } else if (creasesion.getAttribute("asistente") != null && creasesion.getAttribute("nivel") != null) {
                                    Asistente = creasesion.getAttribute("asistente").toString();
                                    nivel2    = creasesion.getAttribute("nivel").toString();
                                    out.print("<a href='login.jsp?cerrar=true'> Salir: " + Asistente + " </a><br>");
                                    out.print("Rol: Asistente <br>");

                                } else if (creasesion.getAttribute("registro") != null && creasesion.getAttribute("nivel") != null) {
                                    Registro = creasesion.getAttribute("registro").toString();
                                    nivel3   = creasesion.getAttribute("nivel").toString();
                                    out.print("<a href='login.jsp?cerrar=true'> Salir: " + Registro + " </a><br>");
                                    out.print("Rol: Registro Academico <br>");

                                } else if (creasesion.getAttribute("nuevo_ingreso") != null && creasesion.getAttribute("nivel") != null) {
                                    newIngreso = creasesion.getAttribute("nuevo_ingreso").toString();
                                    nivel4     = creasesion.getAttribute("nivel").toString();
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
        <section class="section-padding ">
            <div class="container">
                <div class="row mt-50">
                    <div class="col-md-8 col-md-offset-2">
                        <h3 class="section-title text-uppercase center">Universidad</h3>
                        <div class="mt-30"></div>

                        <!--======================Buscar Alumno============================ --> 
                        <div class="row">
                            <form class="bordered centered" method="post" action="buscaAlumno.jsp">
                                <tr>
                                    <td>
                                        <div class="input-field ">
                                            <input type="text" name="nombrealumno" id="nombrealumno">
                                            <label for="nombrealumno">Nombre de Alumno</label>
                                        </div>
                                    </td>
                                    <td>
                                        <button class="btn waves-effect waves-light center" type="submit" name="aceptar">
                                            <i class="fa fa-search"></i> Buscar
                                        </button>
                                        <br><br>
                                    </td>
                                </tr>
                            </form>
                        </div> 
                        <!-- /=============================================================== --> 
                        <table class="table table-striped">

                            <!--======================Añadir Alumno============================ --> 
                            <form method="post" action="altaAlumno.jsp">
                                <tr><td><input type="text" name="clavealumno" size="5"  required="required" ></td>
                                    <td><input type="text" name="nombrealumno" size="35"  required="required" ></td>
                                    <td><input type="text" name="notas" size="5"  required="required" ></td>                                
                                    <td>
                                        <button type="submit" value="Añadir" class="btn btn-primary"title="Añadir Alumno">
                                            <span class="glyphicon glyphicon-plus"></span> Añadir
                                        </button> <br> <br><br>
                                    </td><td></td> </tr>           
                            </form>                        
                            <!-- /=============================================================== --> 
                            <thead><th>Codigo de Alumno</th><th>Nombre</th><th>Promedio Final</th><th></th><th></th></thead>
                                <%
                                    while (listado.next()) {
                                %>
                            <tr>
                                <td><%=listado.getString("clave_alumno")%></td>
                                <td><%=listado.getString("nombre")%></td>
                                <td><%=listado.getString("Notas")%></td>
                            <form method="post" action="modificaAlumno.jsp">
                                <input type="hidden" name="clavealumno" value="<%=listado.getString("clave_alumno")%>">
                                <input type="hidden" name="nombrealumno" value="<%=listado.getString("nombre")%>">
                                <input type="hidden" name="notas" value="<%=listado.getString("Notas")%>">
                                <td>
                                    <button class="btn waves-effect waves-light center blue" type="submit" name="editar" title="Edita o Modifica Alumno">
                                        Editar
                                    </button>
                                </td>
                            </form> 
                            <form method="post" action="borraAlumno.jsp">
                                <input type="hidden" name="clavealumno" value="<%=listado.getString("clave_alumno")%>">                                                           
                                <td>
                                    <button class="btn waves-effect waves-light center red" type="submit" name="borrar" title="Borrar Alumno">
                                        Borrar
                                    </button>                            
                                </td>
                            </form>
                            </tr>
                            <%
                                }//cierra While
                            %>                                                                                                                                                      
                        </table>                        
                    </div>                                                           
                </div>
            </div><!-- /.container -->
        </section>
        <%
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
