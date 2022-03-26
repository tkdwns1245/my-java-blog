<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<div class="header-wrapper">
	<div class="container">
		<div class="header-content">
			<span class="header-motto">Thinking and Do!</span>
			<div class="header-introduce">
				<div class="header-profile-img-wrapper">
					<img class="header-profile-img" src="/resources/img/profile_img02.jpg">
				</div>
				<div class="introduce-write-wrapper">
					<p>Hi, I'm Sang Jun Son</p>
					<p>I'm Web Developer and I'm dreamming to be a good frontend engineer</p>
					<p>This is my development blog</p>
					<p>Please check my post and portfolio</p>
					<p>Thank you!</p>
				</div>
				<div class="header-btn-container">
					<a class="btn btn-primary" href="/resume"><i class="fas fa-user-tie fa-xs"></i> View Resume</a>
					<a class="btn btn-primary" href="/project/projectList"><i class="fas fa-users fa-xs"></i> View Project</a>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
var url = window.location.href;
console.log(url);
if(url.indexOf("home") != -1){
	$(".home-btn-area").show()
}else{
	$(".home-btn-area").hide()
}
</script>