<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<div class="top-bar-wrapper">
	<div class="header-word">
		<span class="header-motto">Thinking and Do!</span>
		<div class="header-introduce">
	Hi, I'm Sang Jun Son
	I'm Web Developer and I'm dreamming to be a good frontend Engineer
	This is my development blog
	Please check my post and portfolio
	Thank you!
		</div>
		<div class="home-btn-area">
			<a class="btn btn-primary" href="/resume">View Resume</a>
			<a class="btn btn-primary" href="/project/projectList">View Project</a>
		</div>
	</div>
	<div class="profile-img-container">
		<img class="profile-img" src="/resources/img/profile_img.jpg">
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