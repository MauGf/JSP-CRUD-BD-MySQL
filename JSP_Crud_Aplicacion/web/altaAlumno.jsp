<%-- 
    Document   : altaAlumno
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
        <title>Añadir Alumno</title>
    </head>
    <body> 
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/universidad", "root", "practicaphp");
            Statement s = conexion.createStatement();

            request.setCharacterEncoding("UTF-8");

            // Comprueba si el clave del alumno ya existe
            String consulta = "SELECT COUNT(*) FROM alumnos WHERE clave_alumno='"
                    + request.getParameter("clavealumno")
                    + "'";
            ResultSet coincidencias = s.executeQuery(consulta);
            coincidencias.next();

            if (coincidencias.getInt(1) != 0) {
                out.print("<script type=\"text/javascript\">alert(\"Lo siento, el código " + request.getParameter("clavealumno") + " ya existe\");</script>");
                out.print("<script>document.location = \"index2.jsp\"</script>");
            } else {
            // Inserta los datos en la base de datos
                String insercion = "INSERT INTO alumnos VALUES ('"
                        + request.getParameter("clavealumno")
                        + "', '" + request.getParameter("nombrealumno")
                        + "', '" + request.getParameter("notas") + "')";
                out.print(insercion);
                s.execute(insercion);
                conexion.close();
            }
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

                                if (creasesion.getAttribute("acceso") != null && creasesion.getAttribute("nivel") != null) {
                                    Administrador = creasesion.getAttribute("acceso").toString();
                                    nivel = creasesion.getAttribute("nivel").toString();
                                    out.print(": " + Administrador + " </a><br>");
                                    out.print("Rol: Asistente <br>");

                                } else if (creasesion.getAttribute("asistente") != null && creasesion.getAttribute("nivel") != null) {
                                    Asistente = creasesion.getAttribute("asistente").toString();
                                    nivel2 = creasesion.getAttribute("nivel").toString();
                                    out.print(": " + Asistente + " </a><br>");
                                    out.print("Rol: Asistente <br>");
                                } else {
                                    out.print("<script>location.replace('index2.jsp');</script>");
                                }
                            %>
                            <script>document.location = "index2.jsp";</script>   
                        </h2>
                        <ol class="breadcrumb">
                            <li>Consulta de notas</li>
                            <li class="active">Universidad</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>        
    </body>
</html>
