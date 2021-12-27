<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="col-md-12 mb-5">
	<div class="project-detail-card">
		<div class="row">
			<div class=" col-3 col-xl-3 card-img-holder" style="margin:2rem">
				<img src="/resources/skills/${skill.skillIcon}" class="card-img" alt="image">
			</div>
			<div class="col-xl-5">
				<div class="card-body">
					<div class="card-title" style="margin-bottom:30px; text-align:center;">
						<h1><span>${skill.skillName}</span></h1>
					</div>
					<div style="margin-bottom:30px;">
						${skill.summary}
					</div>
					<div>
						<div style="float:left">
							<h3>project link : </h3>
						</div>
						<div style="display:inline-block; margin-left:10px;">
							<c:forEach var="project" items="${skill.projectList}" varStatus="status">
							<div><a href="/project/projectDetail?num=${project.num}">${project.projectName}</a></div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12" style="margin-top:100px;">
				<div class="project-detail-contents-title">
					<h1>Contents</h2>
				</div>
				<div class="proejct-contents">
					${skill.contents}
				</div>
			</div>
			<c:if test="${user_lvl eq  0}">
			<div class="col-12" style="margin-top:100px;">
				<a class="btn btn-danger" style="float:right; margin-left:10px;" id="cancel-btn" href="/home" >home</a>
				<a class="btn btn-danger" style="float:right; margin-left:10px;" id="cancel-btn" onClick="deleteFunction(${skill.num})">delete</a>
				<a class="btn btn-primary" style="float:right;" href="/skills/editSkills?num=${skill.num}">edit</a>
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
				url: '/skills/deleteSkills',
				data: {"num" : num},
				success: function (result){
					console.log(result);
					if(result.result == "SUCCESS"){
						alert("success delete skill!");
						window.location.href = "/home";
					}
				},
				error: function(e){
					console.log(e);
				}
			})
		}
	}
</script>