<%@ page session="true" import="java.util.*"%>
<%
String nombre = "";
String clave = "";

if (request.getParameter("nombre") != null)
{
	nombre = request.getParameter("nombre");
}
if (request.getParameter("clave") != null)
{
	clave = request.getParameter("clave");
}

if (nombre.equals("Pablo") && clave.equals("123456") 
	|| nombre.equals("David") && clave.equals("123456") 
	|| nombre.equals("Tiburcio") && clave.equals("123456")) 
{
	out.println("checkbox: " +
	request.getParameter("recordarUsuario") + "<br>");
	//session.getAttribute("nombre");
%>
	 <%String str = request.getParameter("nombre");
	 session.setAttribute("nombre", request.getParameter("nombre"));%>
	 Te has autentificado como <%= session.getAttribute( "nombre" ) %>
<% 
   

	if ((request.getParameter("recordarUsuario") != null) && (request.getParameter("recordarUsuario").equals("on")))
	{
		out.println("entra");
		Cookie cookieUsuario = new Cookie("cokieUsu",nombre);
		cookieUsuario.setPath("/");
		cookieUsuario.setMaxAge(60*60*24);
		response.addCookie(cookieUsuario);
	}

	Date fechaActual = new Date();
	String fechaUltimoAcceso = fechaActual.toString();
	Cookie cookieFecha = new
	Cookie("ultimoAcceso",fechaUltimoAcceso);
	cookieFecha.setPath("/");
	cookieFecha.setMaxAge(60*60*24);
	response.addCookie(cookieFecha);
%>
	<jsp:forward page="taller.jsp" />
<%
} 
else 
{
%>
	<jsp:forward page="index.jsp">
	<jsp:param name="error" value="<script>alert('Error al conectarse')</script>"/>
	</jsp:forward>
<%
}
%>
