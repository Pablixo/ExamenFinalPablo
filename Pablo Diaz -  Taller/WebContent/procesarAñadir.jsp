<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">     
    </head>
    <body>
          <%     			
          		String usuario = "root"; 
     			String clave = "44746186P";
     			String url = "jdbc:mysql://localhost:3306/taller";

    			Connection driver = null; // esto lo llenamos mas adelante
    			Statement consulta = null;
    			ResultSet rs = null;
    			
     			Class.forName("com.mysql.jdbc.Driver").newInstance();
        		driver = DriverManager.getConnection(url,usuario,clave);
        		consulta = driver.createStatement();

        		String codigo = request.getParameter("taller");
              	String descripcion= request.getParameter("descripcion");
              	String ordenador = request.getParameter("ordenadores");
              	String piso = request.getParameter("piso");
              	String aforo = request.getParameter("aforo");
              	String profesor= request.getParameter("profesor");
              	String curso = request.getParameter("curso");

              	consulta = driver.createStatement();
              	String sql = ("INSERT INTO taller VALUES ('" + codigo + "','" + descripcion + "','" + ordenador + "','"+ piso +"','"+ aforo +"','"+ profesor +"','"+ curso+"') ");
              	int add = consulta.executeUpdate(sql);
              	
                if (add == 1) 
                {
                	out.println("<script>alert('Registro añadido')</script>");
                    out.println("<meta http-equiv='refresh' content='0;url=taller.jsp'");
                } 
                else 
                {
                   out.println("error");
      			}

              	//rs.close();
              	driver.close();
			%>    
			<%= session.getAttribute( "nombre" ) %>
    </body>
</html>
