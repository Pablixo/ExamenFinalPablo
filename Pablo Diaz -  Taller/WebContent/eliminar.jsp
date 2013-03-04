<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar registro de la tabla taller. <%= session.getAttribute( "nombre" ) %></title>
    </head>
    <body>
        <%
        	String usuario = "root";
        	String clave="44746186P";
        	String url="jdbc:mysql://localhost:3306/taller";
        	Connection driver=null;
        	Statement consulta = null;

        	Class.forName("com.mysql.jdbc.Driver").newInstance();
        	driver =DriverManager.getConnection(url,usuario,clave);
        	consulta= driver.createStatement();

      		String codigo= request.getParameter("cod"); // Cogemos el id del registro a eliminar
            consulta = driver.createStatement();
            String consulta2= "delete from taller where id='"+codigo+"'";
           
            int eliminar = consulta.executeUpdate(consulta2);
            if(eliminar == 1)
            {
            	out.println("<script>alert('Se ha eliminado el registro')</script>");
                out.println("<meta http-equiv='refresh' content='0;url=taller.jsp'");
            }
         %>              
    </body>
</html>

