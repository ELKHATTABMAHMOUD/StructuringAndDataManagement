<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<html>
<head>
	<title>Espace d'administration</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mycss.css"/>
</head>
<body>
	<h2>
		Liste des utilisateurs: 
	</h2>
	<table border="1">
		<tr>
			<td>Nom</td>
			<td>Pr�nom</td>
			<td>Email</td>
			<td>Laboratoire</td>
			<td>Role</td>
			<td>Permissions</td>
			<td>Modifier/Supprimer</td>
		</tr>
	   <c:forEach items="${users}" var="user">
		<tr>
			<td>${user.lastName }</td>
			<td>${user.firstName }</td>
			<td>${user.email }</td>
			<td> 
				<c:choose>
				    <c:when test="${empty user.laboratory.name}">
				        Lab non renseign�
				    </c:when>    
				    <c:otherwise>
				       ${user.laboratory.name}  
				    </c:otherwise>
				</c:choose>
			</td>
			<td> 
				<c:choose>
				    <c:when test="${empty user.role.libelle}">
				        Role non renseign�
				    </c:when>    
				    <c:otherwise>
				       ${user.role.libelle}  
				    </c:otherwise>
				</c:choose>
			</td>
			<td>RWUD</td>
			<td><a href="updateUser">Modifier</a>--<a href="deleteUser">Supprimer</a></td>
		</tr>
	   </c:forEach>
	</table>
</body>
</html>
