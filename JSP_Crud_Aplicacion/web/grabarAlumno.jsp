<%-- 
    Document   : grabarAlumno
    Created on : 28-02-2018, 21:08:12
    Author     : Mau
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grabar Alumno</title>
    </head>
    <body>
        
        
        
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
                                    out.print("<a href='login.jsp?cerrar=true'> Salir: " + Administrador + " </a><br>");
                                    out.print("Rol: Administrador <br>");

                                } else if (creasesion.getAttribute("asistente") != null && creasesion.getAttribute("nivel") != null) {
                                    Asistente = creasesion.getAttribute("asistente").toString();
                                    nivel2 = creasesion.getAttribute("nivel").toString();
                                    out.print("<a href='login.jsp?cerrar=true'> Salir: " + Asistente + " </a><br>");
                                    out.print("Rol: Asistente <br>");

                                } else {
                                    out.print("<script>location.replace('login.jsp');</script>");
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
    <%  
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/universidad","root", "practicaphp");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");

      s.execute("UPDATE alumnos SET nombre='" + request.getParameter("nombrealumno") + "', Notas='" + request.getParameter("notas") + "' WHERE clave_alumno=" + request.getParameter("clavealumno"));

      conexion.close();
    %>
    <script>document.location = "index2.jsp";</script>
  </body>
</html>
