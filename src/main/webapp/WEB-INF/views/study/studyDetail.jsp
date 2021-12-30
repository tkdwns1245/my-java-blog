<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<div class="col-md-12 mb-5">
	<div class="detail-card">
		<div class="row">
			<div class=" col-3 col-xl-3 card-img-holder" style="margin:2rem">
				<img src="/resources/study/${study.titleImg}" class="card-img" alt="image">
			</div>
			<div class="col-xl-5">
				<div class="card-body">
					<div class="card-title">
						<span>${study.title}</span>
					</div>
					<div>
						${study.introduce}
					</div>
					<div>
						<i class="fas fa-wrench"></i>  category : ${study.category}
					</div>
				</div>
			</div>
			<div class="col-12">
				<div class="detail-contents-title">
					<h1>Contents</h2>
				</div>
				<div class="detail-contents">
					${study.contents}
				</div>
			</div>
			<s:authorize access="isAuthenticated()">
			<div class="col-12" style="margin-top:100px;">
				<a class="btn btn-danger" style="float:right; margin-left:10px;" id="cancel-btn" href="/study/studyList" >list</a>
				<a class="btn btn-danger" style="float:right; margin-left:10px;" id="cancel-btn" onClick="deleteFunction(${study.num})">delete</a>
				<a class="btn btn-primary" style="float:right;" href="/study/editStudy?num=${study.num}">edit</a>
			</div>
			</s:authorize>
		</div>
	</div>
</div>
<script>
	var deleteFunction = function(num){
		var result = confirm('Are you sure you want to delete?');
		if(result){
			$.ajax({
				type: "POST",
				url: '/study/deleteStudy',
				data: {"num" : num},
				success: function (result){
					console.log(result);
					if(result.result == "SUCCESS"){
						alert("success delete article!");
						window.location.href = "/study/studyList";
					}
				},
				error: function(e){
					console.log(e);
				}
			})
		}
	}
</script>