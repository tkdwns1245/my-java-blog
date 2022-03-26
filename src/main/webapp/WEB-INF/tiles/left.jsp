<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<div class="menu-wrapper">
	<!-- <div class="profile-img-container">
		<img class="rounded-circle profile-img mx-auto align-middle" src="/resources/img/blog-profile.jpg">
	</div> -->
	<nav class="navbar navbar-expand-lg navbar-dark" >
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navigation" class="collapse navbar-collapse flex-column">
			<div class="menu-img-wrapper">
				<div class="menu-profile-img-container">
					<a href="/home"><img class="profile-img" src="/resources/img/ssj_character.png"></a>
				</div>
				<div class="menu-profile-label-container">
					<span class="menu-profile-label">SSJ's Place</span>
				</div>
			</div>
			<div class="menu-container">
				<ul class="navbar-nav flex-column">
					<li class="menu-item"><a class="menu-a" href="/home"><i class="fas fa-home fa-xs"></i>  <span class="menu-txt" style="margin-left: 2.5px;">Home</span></a></li>
					<li class="menu-item"><a class="menu-a" href="/resume"><i class="fas fa-user-tie fa-xs"></i>  <span class="menu-txt" style="margin-left: 7px;">Resume</span></a></li>
					<li class="menu-item"><a class="menu-a" href="/project/projectList"><i class="fas fa-users fa-xs"></i>  <span class="menu-txt">Project</span></a></li>
					<li class="menu-item"><a class="menu-a" href="/study/studyList"><i class="fas fa-book-open fa-xs"></i>  <span class="menu-txt" style="margin-left:3px;">Study</span></a></li>
					<!-- <li class="menu-item"><a href="/archives">ARCHIVES</a></li> -->
					<li class="menu-item"><a class="menu-a" href="/life/lifeList"><i class="fas fa-glass-cheers fa-xs"></i>  <span class="menu-txt">Life</span></a></li>
					<!-- <li class="menu-item"><a href="/about">ABOUT</a></li> -->
					<s:authorize access="isAuthenticated()">
					<li class="menu-item"><a class="menu-a" href="/manage/category/study">Manage</a></li>
					</s:authorize>
				</ul>
			</div>
		</div>
	</nav>
	<!-- <div class="img-container">		
		<div class="menu-bottom-img-wrapper">
			<div class="menu-bottom-img-gradient"></div>
			<img class="menu-bottom-img mx-auto align-middle" src="/resources/img/menu-bottom-img.jpg">
		</div>
	</div> -->
</div>
<script>
$(document).on("mouseover",".menu-profile-img-container",function () {
    $('.menu-profile-label-container').css("visibility","visible");
    $('.menu-profile-label-container').css("opacity",1);
});
$(document).on("mouseout",".menu-profile-img-container",function () {
	$('.menu-profile-label-container').css("opacity",0);
	$('.menu-profile-label-container').css("transition","opacity 0.5s ease-in-out");
});
</script>