<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabla Taller</title>
<link rel="stylesheet" type="text/css" href="estilo.css"/>
</head>
<body>
	<p>FORMULARIO</p>
	<form action="taller.jsp" methop="post">
	<div id="login">
		<table>
			<tr>
				<td class="cabecera" colspan="2">LOGIN TABLA TALLER</td>
			</tr>
			<tr>
				<td class="enunciado" colspan="2">Rellene los campos con sus datos</td>
			</tr>
			<tr>
				<td>Nombre</td>
				<td><input type="text" name="nombre" maxlength="20" value="<%=session.getAttribute("nombre")%>"></td>
			</tr>
			<tr>
				<td>Contraseña</td>
				<td><input type="password" name="contra" maxlength="20"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Enviar" name="enviarSubmit"></td>
				<td><input type="reset" name="borrar"></td>	
			</tr>
		</table>
	</div>
</form>

</body>
</html>