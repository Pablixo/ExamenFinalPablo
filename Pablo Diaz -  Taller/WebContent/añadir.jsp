<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<link rel="stylesheet" type="text/css" href="estilo.css"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
       <script>
  			function añadir()
  			{
  				var numeros = /^([0-9]|[0-9]|á|é|í|ó|ú|ñ|ü|\s|\.|-)+$/;			/* Letras */
  				var descripcion = /^([a-z]|[A-Z]|á|é|í|ó|ú|ñ|ü|\s|\.|-)+$/;   	/* Numeros */
				
  			   /* Comprobamos si la id de taller es correcta */
  	  		   if(!numeros.test(document.añadido.taller.value)) 
  	  		   {
    			 	alert('Id de taller no válido');
    				document.añadido.taller.focus();
    			    document.añadido.taller.value = "";
    			    return false;
    		   }
  			   if(!descripcion.test(document.añadido.descripcion.value)) 
  			   {
  			         alert('Descrición no válida');
  					 document.añadido.descripcion.focus();
  			         document.añadido.descripcion.value = "";
  			         return false;
  			   }
  	  		   if(!numeros.test(document.añadido.ordenadores.value)) 
  	  		   {
    			 	alert('Número de ordenadores no válido');
    				document.añadido.ordenadores.focus();
    			    document.añadido.ordenadores.value = "";
    			    return false;
    		   }
  	  		   if(!numeros.test(document.añadido.piso.value)) 
  	  		   {
    			 	alert('Piso no válido');
    				document.añadido.piso.focus();
    			    document.añadido.piso.value = "";
    			    return false;
    		   }
  	  		   
  	  		   if(!numeros.test(document.añadido.aforo.value)) 
  	  		   {
    			 	alert('Aforo no válido');
    				document.añadido.aforo.focus();
    			    document.añadido.aforo.value = "";
    			    return false;
    		   }
  	  		   
  	  		   if(!numeros.test(document.añadido.profesor.value)) 
  	  		   {
    			 	alert('Id de profesor no válido');
    				document.añadido.profesor.focus();
    			    document.añadido.profesor.value = "";
    			    return false;
    		   }
  	  		   
  	  		   if(!numeros.test(document.añadido.curso.value)) 
  	  		   {
    			 	alert('Id de curso no válido');
    				document.añadido.curso.focus();
    			    document.añadido.curso.value = "";
    			    return false;
    		   }
				document.añadido.submit();
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
        	rs = consulta.executeQuery("select * from taller");
        
        	//hacemos esa consulta con filtro a la base de datos

            
	 		//session.setAttribute("nombre", request.getParameter("nombre"));
	 %>
            	<form name="añadido" method="post" action="procesarAñadir.jsp">
                 	<input type="hidden" name="cod"/>
  					<table border='10' cellPadding='5' align='center'>
   					<tr>
      					<td class='id' colspan="2"><div align="center">Te has autentificado como <%= session.getAttribute( "nombre" ) %></div></td>
    				</tr>
    					<tr>
      						<td class='resultados' colspan="2"><div align="center">Añadir registro </div></td>
    					</tr>
    					<tr>
      					<td class='camposPrin'>Id taller</td>
            				<td><input type="text" name="taller" id="taller" maxlength="2"/></td>
    					</tr>
    					<tr>
      						<td class='campos'>Descripcion</td>
            				<td><input type="text" name="descripcion" maxlength="20"/></td>
    					</tr>
    					<tr>
     	 					<td class='campos'>Ordenadores</td>
      						<td><input type="text" name="ordenadores" maxlength="2"/></td>
    					</tr>
    					<tr>
     	 					<td class='campos'>Piso</td>
      						<td><input type="text" name="piso" maxlength="2"/></td>
    					</tr>
    					<tr>
     	 					<td class='campos'>Aforo</td>
      						<td><input type="text" name="aforo" maxlength="2"/></td>
    					</tr>
    					<tr>
     	 					<td class='campos'>Id profesor</td>
      						<td><input type="text" name="profesor" maxlength="2"/></td>
    					</tr>
    					  <tr>
     	 					<td class='campos'>Id curso</td>
      						<td><input type="text" name="curso" maxlength="2"/></td>
    					</tr>
        				<tr>
           	 				<td><input type="button" name="enviar"  value="Añadir" onclick="añadir()"/>
          					<td><input type="reset" name="button2" id="button2" value="Limpiar" /></td>
        				</tr>
      					</table>
					</form>
               <%
				rs.close();//cerramos la conexion y listo ya tenemos los registros a modificar
%>  
    </body>
</html>