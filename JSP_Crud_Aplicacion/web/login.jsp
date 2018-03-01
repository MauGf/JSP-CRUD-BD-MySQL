<%-- 
    Document   : login
    Created on : 28-02-2018, 17:12:13
    Author     : Mau
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="conexion.Operaciones"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresando al sistema</title>        
        
         
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
        <link href="assets/css/login.css" rel="stylesheet">

        <!-- Main Style CSS -->
        <link href="assets/css/style.css" rel="stylesheet">
        <!-- Creative CSS -->
        <link href="assets/css/creative.css" rel="stylesheet">               
    </head>
    <body>
          
        <!--header start-->
        <header id="header" class="tt-nav transparent-header nav-border-bottom">

            <div class="header-sticky light-header">

                <div class="container">                  
                    <div id="materialize-menu" class="menuzord">

                        <!--logo start-->
                        <a href="index.jsp" class="logo-brand">
                            <img class="logo-dark" src="assets/images/logomaug-blue.png" alt=""/>
                            <img class="logo-light" src="assets/images/logomaug.png" alt=""/>
                        </a>
                        <!--logo end-->

                        <!-- menu start-->
                        <ul class="menuzord-menu pull-right light">
                             <li><a href=index.jsp>Home</a></li>                                                     
                            <li><a href=index2.jsp>Notas</a></li>                                                     
                        </ul>
                        <!-- menu end-->
                    </div>
                </div>
            </div>

        </header>
        <!--header end-->
        <%
            Connection con       = null;
            PreparedStatement ps = null;
            ResultSet rs         = null;

            String driverName = "com.mysql.jdbc.Driver";
            String url        = "jdbc:mysql://localhost:3306/universidad";
            String user       = "root";
            String password   = "practicaphp";
            String sql        = "select usertype from usuarios";
            
            try {
                Class.forName(driverName);
                con = DriverManager.getConnection(url, user, password);
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
        %>
        <section class="section-padding banner-wrapper login-alt purple-1 banner-6 fullscreen-banner">
            <div class="container">
                <div class="login-wrapper">
                    <div class="card-wrapper"></div>
                    <div class="card-wrapper">
                        <h1 class="title">Ingreso al Sistema</h1>
                        <form   action="login.jsp" method="post">                            
                            <div class="input-container">
                                <select name="user"  class="browser-default">
                                    <option name="rol" value="" disabled selected>Ingresar como</option>
                                    <%    while (rs.next()) {
                                            String usertype = rs.getString("usertype");
                                    %>
                                    <option value="<%=usertype%>"><%=usertype%></option>
                                    <%
                                            }
                                        } catch (SQLException sqe) {

                                            out.println("home" + sqe);
                                        }
                                    %>
                                </select> 
                                <div class="bar"></div>
                            </div> 
                            <div class="input-container">
                                <input type="text" id="username" name="usuario"  required="required" />                                      
                                <label for="username">Username</label>
                                <div class="bar"></div>
                            </div>
                            <div class="input-container">
                                <input type="password" id="password" name="pwd" required="required"/>
                                <label for="password">Password</label>
                                <div class="bar"></div>
                            </div>
                            <div class="button-container">
                                <button class="btn waves-effect waves-light center" type="submit" name="Aceptar">
                                    Ingresar
                                    <i class="material-icons">check_circle</i>
                                </button>
                                <br>
                            </div>
                        </form>
                        <%
                            Operaciones op = new Operaciones();
                            if (request.getParameter("Aceptar") != null) {

                                String nombre = request.getParameter("usuario");
                                String contra = request.getParameter("pwd");
                                String rol    = request.getParameter("usertype");
                                HttpSession lacceso  = request.getSession();
                                HttpSession lacceso2 = request.getSession();
                                
                                switch (op.logear(nombre, contra)) {
                                    case 1:

                                        lacceso.setAttribute("acceso", nombre);
                                        lacceso.setAttribute("nivel", 1);                                       
                                        response.sendRedirect("index2.jsp");
                                        break;
                                    case 2:
                                        lacceso2.setAttribute("asistente", nombre);
                                        lacceso2.setAttribute("nivel", 2);
                                        response.sendRedirect("index2.jsp");
                                        break;
                                    case 3:
                                        lacceso2.setAttribute("registro", nombre);
                                        lacceso2.setAttribute("nivel", 3);
                                        response.sendRedirect("index2.jsp");
                                        break;
                                    case 4:
                                        lacceso2.setAttribute("nuevo_ingreso", nombre);
                                        lacceso2.setAttribute("nivel", 4);
                                        response.sendRedirect("index2.jsp");
                                        break;
                                    default:
                                        out.println("<br><h5 class='center' style='color:#d22a3a;'>El usuario no existe o la contraseña es incorrecta!!!</h5>");
                                        break;
                                }
                            }
                            if (request.getParameter("cerrar") != null) {
                                session.invalidate();
                            }
                        %>
                        <%       /*===  crear cookie  ===*/   
                            /*
                                Date fechaActual = new Date();
                                String fechaUltimoAcceso = fechaActual.toString();
                                Cookie cookieFecha = new Cookie("ultimoAcceso", fechaUltimoAcceso);
                                cookieFecha.setPath("/");
                                cookieFecha.setMaxAge(60 * 60 * 24);
                            */
                        %>
                    </div>                   
                </div>
            </div>
        </section>

        <!-- Preloader -->
        <div id="preloader">
            <div class="preloader-position"> 
                <img src="assets/img/logo-colored.png" alt="Acceso" >
                <div class="progress">
                    <div class="indeterminate"></div>
                </div>
            </div>
        </div>
        <!-- End Preloader -->

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
