<%@ page session="true" import="java.util.*"%>
<link rel="stylesheet" type="text/css" href="estilo.css"/>
<%
String nombre = "";
String fechaUltimoAcceso = "";

/* Recuperamos el valor de la cookie existente */
Cookie[] todosLosCookies = request.getCookies();

if(todosLosCookies!=null){
for (int i=0; i<todosLosCookies.length; i++) 
{
	Cookie unCookie = todosLosCookies[i];
	if (unCookie.getName().equals("cokieUsu")) 
	{
		nombre= unCookie.getValue();
	}
}

/* Visualizamos la última conexión. Buscamos en los cookies que que ya existentes */
   
for (int i=0; i<todosLosCookies.length; i++) 
{
	Cookie unCookie = todosLosCookies[i];
	if (unCookie.getName().equals("ultimoAcceso")) 
	{
		fechaUltimoAcceso = unCookie.getValue();
	}
}
}
/* Comprobamos que el cookie no existe y lo almacenamos */
if (fechaUltimoAcceso.equals(""))
{
	Date fechaActual = new Date();
	fechaUltimoAcceso = fechaActual.toString();
	Cookie cookieFecha = new Cookie("ultimoAcceso",fechaUltimoAcceso);
	cookieFecha.setPath("/");
	cookieFecha.setMaxAge(60*60*24);
	response.addCookie(cookieFecha);
}
%>
<html>
<head><title>Proceso de login</title>
</head>
<body>

<p>Acceso anterior:<br><%=fechaUltimoAcceso%>
</p>
<%
if (request.getParameter("error") != null) 
{
	out.println(request.getParameter("error"));
}
%>
<form action="procesarLogin.jsp" method="post">
	<div id='login'>
	<table>
		<tr>
			<td class="cabecera" colspan="2">LOGIN TABLA TALLER</td>
		</tr>
		<tr>
			<td class="enunciado" colspan="2">Rellene los campos con sus datos</td>
		</tr>
		<tr>
			<td>Usuario</td>
			<td><input type="text" name="nombre" size="20"value="<%=nombre%>"></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="password" name="clave" size="20"></td>
		</tr>
		<tr>
			<td colspan='2'>Recordar usuario
			<input type="checkbox" name="recordarUsuario" value="on"></td>
		</tr>
		<tr>
		<tr>
			<td colspan='2'><input style="margin-left:140px" type="submit" value="Conectarse"></td>
		</tr>
	</table>

	</div>
	</form>
</body>
</html>