<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<html>
	<head>
		<title>Home</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap-toggle.min.css"/>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mycss.css"/>
	</head>
	<body>
		<div class="container"> 
			<div class="row navbar">
				<%@include file="../includes/navbar.jsp" %>  
			</div>
			<div class="row" style="background-color: #ecf2f8;">
				<div class="col-sm-2 col-md-2 col-lg-2 col-xl-2">
					<%@include file="../includes/sidemenubar.jsp" %>
				</div>
				<div class="col-sm-6 col-md-6 col-lg-6 col-xl-10 ">
					<div class="content">
						<h4>
							Bonjour! vous �tes Mr :${result } ${userSession.firstName } ${ userSession.lastName }	(id) ${userSession.id }
						</h4>
						<f:form modelAttribute="fileData" method="post" action="searchFiles" >
							<div class="box-body">
								<div class="form-group">
									<f:input path="searchValue" class="form-control" placeholder="Recherche" />
									<label for="corpus">Par : </label>									   		
									<f:select multiple="false" path="searchBy" class="form-control">
										<f:option value="Corpus" />
										<f:option value="Author" />
										<f:option value="Title" />
									</f:select>
								</div>							
								<div class="forsm-group">
									<button type="submit" class="btn btn-primary mb-2">Rechercher</button>
								</div>
							</div>
						</f:form>
						<c:choose>
							<c:when test="${not empty files}">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Nom</th>
											<th>Type</th>
											<th>Taille(Octet)</th>
											<th>URL</th>
											<th>Propri�taire</th>
											<th>Contributeur</th>
											<th>Corpus</th>
											<th>Modifier/Supprimer </th>
									   </tr>
									</thead>
									<tbody>
										<c:forEach items="${files}" var="file">
											<tr>
												<td>${file.name }</td>
												<td>${file.fileType }</td> 
												<td>${file.size }</td> 
												<td>${file.path }</td> 
												<td> 
													EL KHATTAB Mahmoud		<!-- created by -->
												</td>
												<td> 
													Description		<!-- created by -->
												</td>
												<td> 
													${file.corpus.name }
												</td>
												<td>
													<a href="updateFile">Modifier</a>--
													<a href="<c:url value='deleteFile/${file.idFile}' />" >Supprimer</a>
												</td>
											</tr>
										   </c:forEach>								
									</tbody>
								</table>
							</c:when>
							<c:otherwise>
								<h4> Aucun document n'a �t� trouv�. <h4>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="footer">
						<%@include file="../includes/footer.jsp" %>
					</div>
				</div>
			</div>
			</div>
	
		<!-- scripts -->
		<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/bootstrap-toggle.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/myjs/sidemenubar.js"></script>
		<!-- Menu Toggle Script -->
    <script>
    
    </script>
	</body>
	
</html>