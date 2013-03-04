<%@ page language="java" import="java.sql.*" %>
<link rel="stylesheet" type="text/css" href="estilo.css"/>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    
    <!-- USANDO JAVA-BEAN PARA EL TRABAJO -->
	<jsp:useBean id="mybean" class="MyBean.MyBean" scope="session" >
	<jsp:setProperty name="mybean" property="name" value="Pablo Díaz López" />
	</jsp:useBean>

	<p class='bean'> <jsp:getProperty name="mybean" property="name" /></p>

<%
     String usuario="root";
     String clave="44746186P";
     String url="jdbc:mysql://localhost:3306/taller";

     Connection driver=null;
     Statement consulta = null;
     ResultSet rs = null;
     
     Class.forName("com.mysql.jdbc.Driver").newInstance();
     driver =DriverManager.getConnection(url,usuario,clave);
     consulta = driver.createStatement();
     rs = consulta.executeQuery("select * from taller");

     // Le ponemos el título
	 out.println("<html><a class='sesion' href='index.jsp'>Cambiar usuario</a><br/>");
	 out.println("<a class='sesion' href='cerrar.jsp'>Cerrar sesión</a><br/>");
	 out.println("<p>Trabajo UT3 Despliegue. Tabla Taller</p><html>");
	 out.println("<table border=10 cellPadding=5 align=center><tr>");

%>
	 <tr>
	 	<td colspan='5'>Hola <b><%= session.getAttribute( "nombre" )%></b>, estos son los registros
	 		de la tabla Taller. </td>
	 	<td colspan='3'>Sesión de: <b><%= session.getAttribute( "nombre" )%>.</b></td>
	 	<td class='consultas'><a href='añadir.jsp'>Añadir</a></td>
	 	
	 </tr>
<% 
     // Tabla donde van a ir los datos
	 

     // Escribimos los nombres de los campos de la base de datos
     out.println("<th class='camposPrin'>Id taller</th>"
     			+" <th class='campos'>Descripción</th>"
                + "<th class='campos'>Ordenador</th>"
                + "<th class='campos'>Piso</th>"
                + "<th class='campos'>Aforo</th>"
                + "<th class='campos'>Id profesor</th>"
                + "<th class='campos'>Id curso</th>"
                + "<th class='campos' bgcolor='white'>Modificar</th>"
                + "<th class='campos'>Eliminar</th>  </tr>");

				// Escribimos todo el contenido d ela base de datos
				while(rs.next()) 
				{
					out.println("<tr>");
					out.println("<td class='id'>"+rs.getString(1)+"</td>");
					out.println("<td class='resultados'>"+rs.getString(2)+"</td>");
					out.println("<td class='resultados'>"+rs.getString(3)+"</td>");
					out.println("<td class='resultados'>"+rs.getString(4)+"</td>");
					out.println("<td class='resultados'>"+rs.getString(5)+"</td>");
					out.println("<td class='resultados'>"+rs.getString(6)+"</td>");
					out.println("<td class='resultados'>"+rs.getString(7)+"</td>");
					out.println("<td class='consultas'>"+"<a href=modificar.jsp?cod="+ rs.getString(1) + ">" + "Modificar" + "</a>" +"</td>");
					out.println("<td class='consultas'>"+"<a href=eliminar.jsp?cod=" + rs.getString(1) + ">" + "Eliminar" + " </a>" +"</td>");
					out.println("</tr>"); };
					out.println("<tr>");
					out.println("</tr>");
	 out.println("</table></center></div></html>");
%>       
    </body>
</html>
