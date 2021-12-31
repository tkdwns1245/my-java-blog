<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<div class="col-md-12 mb-5">
	<div class="detail-card">
		<div class="row">
			<div class=" col-3 col-xl-3 card-img-holder">
				<img src="/resources/life/${life.titleImg}" class="card-img" alt="image">
			</div>
			<div class="col-xl-9">
				<div class="card-body">
					<div class="card-title">
						<h4>${life.title}</h4>
					</div>
					<div class="card-introduce">
						${life.introduce}
					</div>
					<div>
						<i class="fas fa-wrench"></i>  category : ${life.category}
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="detail-card">
		<div class="row">
			<div class="col-12">
				<div class="detail-contents-title">
					<h1>Contents</h2>
				</div>
				<div class="detail-contents">
					${life.contents}
				</div>
			</div>
			<s:authorize access="isAuthenticated()">
			<div class="col-12" style="margin-top:100px;">
				<a class="btn btn-danger" style="float:right; margin-left:10px;" id="cancel-btn" href="/life/LifeList" >list</a>
				<a class="btn btn-danger" style="float:right; margin-left:10px;" id="cancel-btn" onClick="deleteFunction(${life.num})">delete</a>
				<a class="btn btn-primary" style="float:right;" href="/life/editLife?num=${life.num}">edit</a>
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
				url: '/life/deleteLife',
				data: {"num" : num},
				success: function (result){
					console.log(result);
					if(result.result == "SUCCESS"){
						alert("success delete article!");
						window.location.href = "/life/lifeList";
					}
				},
				error: function(e){
					console.log(e);
				}
			})
		}
	}
</script>