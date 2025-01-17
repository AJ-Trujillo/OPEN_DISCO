<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Iniciar Sesión</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css"
	rel="stylesheet">

<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet">
</head>
<body>
	<div class="login-container">

		<img
			src="${pageContext.request.contextPath}/assets/imagen/472679819_1173065211407366_3147088802780353649_n.jpg"
			alt="Logo">
		<h1>BIENVENIDOS</h1>
		<form action="LoginController" method="post">

			<div class="input-group">
				<span class="input-group-text"> <svg
						xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						viewBox="0 0 24 24">
                    <path fill="currentColor"
							d="M12 13q1.45 0 2.475-1.025T15.5 9.5t-1.025-2.475T12 6T9.525 7.025T8.5 9.5t1.025 2.475T12 13m0 9q-3.65-.925-5.825-4T4 11.1V5l8-3l8 3v6.1q0 3.825-2.175 6.9T12 22m0-2.1q1.475-.475 2.613-1.487t1.987-2.288q-1.075-.55-2.238-.837T12 15t-2.363.288t-2.237.837q.85 1.275 1.988 2.288T12 19.9" />
                </svg>
				</span> <input type="email" id="correo" name="correo" class="form-control"
					placeholder="Correo Electrónico*" required>
			</div>

			<div class="input-group">
				<span class="input-group-text"> <svg
						xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						viewBox="0 0 24 24">
                    <path fill="currentColor"
							d="M10.5 15h3l-.575-3.225q.5-.25.788-.725T14 10q0-.825-.587-1.412T12 8t-1.412.588T10 10q0 .575.288 1.05t.787.725zm1.5 7q-3.475-.875-5.738-3.988T4 11.1V5l8-3l8 3v6.1q0 3.8-2.262 6.913T12 22" />
                </svg>
				</span> <input type="password" id="contrasena" name="contrasena"
					class="form-control" placeholder="Contraseña*" required> <span
					class="input-group-text toggle-password"> <i
					class="bi bi-eye-slash"></i>
				</span>
			</div>

			<div class="d-grid">
				<button type="submit" class="btn btn-primary">Iniciar
					Sesión</button>
			</div>

			<div class="forgot-password">
				<a href="#">¿Te olvidaste tu contraseña?</a>
			</div>
		</form>
	</div>
	<%
	String mensaje = (String) session.getAttribute("mensaje");
	String tipoMensaje = (String) session.getAttribute("tipoMensaje");
	if (mensaje != null && tipoMensaje != null) {
		session.removeAttribute("mensaje");
		session.removeAttribute("tipoMensaje");
	%>
	<script>
    Swal.fire({
        icon: '<%=tipoMensaje%>',
        title: '<%=mensaje%>
		'
		});
	</script>
	<%
	}
	%>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/javascript.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/javascript.js"></script>

</body>
</html>
