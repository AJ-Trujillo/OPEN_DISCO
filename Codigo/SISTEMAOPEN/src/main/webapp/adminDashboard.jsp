<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Dashboard Administrador</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap Icons -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
	<!-- Sidebar -->
	<jsp:include page="Menus/sidebar.jsp" />
	<!-- Topbar -->
	<jsp:include page="Menus/topbar.jsp" />

	<!-- Main Content -->
	<div class="content" id="content">
		<div class="container mt-4">
			<h1 class="display-6">Bienvenido al Dashboard</h1>
			<p class="text-muted">Seleccione una opción del menú para
				comenzar.</p>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Custom JS -->
	<script src="assets/js/dashboard.js"></script>
</body>
</html>
