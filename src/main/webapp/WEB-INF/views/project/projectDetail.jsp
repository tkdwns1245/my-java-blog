<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="col-md-12 mb-5">
	<div class="project-detail-card">
		<div class="row">
			<div class=" col-3 col-xl-3 card-img-holder" style="margin:2rem">
				<img src="/resources/project/${project.projectImg}" class="card-img" alt="image">
			</div>
			<div class="col-xl-5">
				<div class="card-body">
					<div class="card-title">
						<span>${project.projectName}</span>
					</div>
					<div>
						${project.introduce}
					</div>
					<div>
						<i class="fas fa-users"></i>  members : ${project.members}
					</div>
					<div>
						<i class="far fa-clock"></i>  period : ${project.fromDate} ~ ${project.toDate} ${project.period}days
					</div>
					<div>
						<i class="fas fa-wrench"></i>  skills : ${project.skills}
					</div>
					<div>
						<i class="fas fa-wrench"></i>  file : <a href="/project/fileDownload?fileName=${project.projectFile}">${fn:split(project.projectFile,'_')[0]}.${fn:split(project.projectFile,'.')[1]}</a>
					</div>
				</div>
			</div>
			<div class="col-12">
				<div class="project-detail-contents-title">
					<h1>Contents</h2>
				</div>
				<div class="proejct-contents">
					${project.contents}
				</div>
			</div>
			<c:if test="${user_lvl eq  0}">
			<div class="col-12" style="margin-top:100px;">
				<a class="btn btn-danger" style="float:right; margin-left:10px;" id="cancel-btn" href="/project/projectList" >list</a>
				<a class="btn btn-danger" style="float:right; margin-left:10px;" id="cancel-btn" onClick="deleteFunction(${project.num})">delete</a>
				<a class="btn btn-primary" style="float:right;" href="/project/editProject?num=${project.num}">edit</a>
			</div>
			</c:if>
		</div>
	</div>
</div>
<script>
	var deleteFunction = function(num){
		var result = confirm('Are you sure you want to delete?');
		if(result){
			$.ajax({
				type: "POST",
				url: '/project/deleteProject',
				data: {"num" : num},
				success: function (result){
					console.log(result);
					if(result.result == "SUCCESS"){
						alert("success delete project!");
						window.location.href = "/project/projectList";
					}
				},
				error: function(e){
					console.log(e);
				}
			})
		}
	}
</script>