<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.util.*" session="true" %>
<link rel="stylesheet" type="text/css" href="estilo.css"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
       <script>
  			function modificar()
  			{
  				var descripcion = /^([0-9]|[0-9]|á|é|í|ó|ú|ñ|ü|\s|\.|-)+$/;	/* Letras */
  				var numeros = /^([a-z]|[A-Z]|á|é|í|ó|ú|ñ|ü|\s|\.|-)+$/;   	/* Numeros */
				
  			   /* Comprobamos si la id de taller es correcta */
  	  		   if(!descripcion.test(document.modificado.taller.value)) 
  	  		   {
    			 	alert('Id de taller no válido');
    				document.modificado.taller.focus();
    			    document.modificado.taller.value = "";
    			    return false;
    		   }
  			   if(!numeros.test(document.modificado.descripcion.value)) 
  			   {
  			         alert('Descrición no válida');
  					 document.modificado.descripcion.focus();
  			         document.modificado.descripcion.value = "";
  			         return false;
  			   }
  	  		   if(!descripcion.test(document.modificado.ordenadores.value)) 
  	  		   {
    			 	alert('Número de ordenadores no válido');
    				document.modificado.ordenadores.focus();
    			    document.modificado.ordenadores.value = "";
    			    return false;
    		   }
  	  		   if(!descripcion.test(document.modificado.piso.value)) 
  	  		   {
    			 	alert('Piso no válido');
    				document.modificado.piso.focus();
    			    document.modificado.piso.value = "";
    			    return false;
    		   }
  	  		   
  	  		   if(!descripcion.test(document.modificado.aforo.value)) 
  	  		   {
    			 	alert('Aforo no válido');
    				document.modificado.aforo.focus();
    			    document.modificado.aforo.value = "";
    			    return false;
    		   }
  	  		   
  	  		   if(!descripcion.test(document.modificado.profesor.value)) 
  	  		   {
    			 	alert('Id de profesor no válido');
    				document.modificado.profesor.focus();
    			    document.modificado.profesor.value = "";
    			    return false;
    		   }
  	  		   
  	  		   if(!descripcion.test(document.modificado.curso.value)) 
  	  		   {
    			 	alert('Id de curso no válido');
    				document.modificado.curso.focus();
    			    document.modificado.curso.value = "";
    			    return false;
    		   }
				document.modificado.submit();
			}
       </script>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body> 
        <!-- USANDO JAVA-BEAN PARA EL TRABAJO -->
		<jsp:useBean id="mybean" class="MyBean.MyBean" scope="session" >
		<jsp:setProperty name="mybean" property="name" value="Pablo Díaz López" />
		</jsp:useBean>

		<p class='bean'> <jsp:getProperty name="mybean" property="name" /></p>
     	<% 
 			String codigo = request.getParameter("cod");//capturamos el valor
			String usuario = "root";
			String clave = "44746186P";
			String url = "jdbc:mysql://localhost:3306/taller";
			
			Connection conexion=null;	
			Statement consulta = null;
			ResultSet rs = null;

			Class.forName("com.mysql.jdbc.Driver").newInstance();
        	conexion = DriverManager.getConnection(url,usuario,clave);
        	consulta = conexion.createStatement();
        	rs = consulta.executeQuery("select * from taller where id='"+codigo+"'");
        	
        	
        	//hacemos esa consulta con filtro a la base de datos
        	while(rs.next())//soltamos los registros y combinamos el html con jsp objetos
            {
            %>
            	<form name="modificado" method="post" action="procesarModificado.jsp">
                 	<input type="hidden" name="cod" value=<% out.println(rs.getString(1));%>/>
  					<table border='10' cellPadding='5' align='center'>
   					<tr>
      					<td class='id' colspan="2"><div align="center">Te has autentificado como <%= session.getAttribute( "nombre" ) %></div></td>
    				</tr>
    					<tr>
      						<td class='resultados' colspan="2"><div align="center">Modificacion de Datos </div></td>
    					</tr>
    					<tr>
      					<td class='camposPrin'>Id taller</td>
            				<td><input type="text" name="taller" maxlength="2" value=<% out.println(rs.getString(1));%>/></td>
    					</tr>
    					<tr>
      						<td class='campos'>Descripcion</td>
            				<td><input type="text" name="descripcion" maxlength="20" value=<% out.println(rs.getString(2));%>/></td>
    					</tr>
    					<tr>
     	 					<td class='campos'>Ordenadores</td>
      						<td><input type="text" name="ordenadores" maxlength="2" value=<% out.println(rs.getString(3));%> /></td>
    					</tr>
    					<tr>
     	 					<td class='campos'>Piso</td>
      						<td><input type="text" name="piso" maxlength="2" value=<% out.println(rs.getString(4));%> /></td>
    					</tr>
    					<tr>
     	 					<td class='campos'>Aforo</td>
      						<td><input type="text" name="aforo" maxlength="2" value=<% out.println(rs.getString(5));%> /></td>
    					</tr>
    					<tr>
     	 					<td class='campos'>Id profesor</td>
      						<td><input type="text" name="profesor" maxlength="2" value=<% out.println(rs.getString(6));%> /></td>
    					</tr>
    					  <tr>
     	 					<td class='campos'>Id curso</td>
      						<td><input type="text" name="curso" maxlength="2" value=<% out.println(rs.getString(7));%> /></td>
    					</tr>
        				<tr>
           	 				<td><input type="button" name="enviar"  value="Modificar" onclick="modificar()"/>
          					<td><input type="reset" name="button2" id="button2" value="Limpiar" /></td>
        				</tr>
      					</table>
					</form>
               <%
				}
				rs.close();//cerramos la conexion y listo ya tenemos los registros a modificar
%>  
    </body>
</html>
