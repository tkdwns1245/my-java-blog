<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="side-container">
	<!-- <div class="profile-img-container">
		<img class="rounded-circle profile-img mx-auto align-middle" src="/resources/img/blog-profile.jpg">
	</div> -->
	<div class="menu-container">
		<div class="menu-img-wrapper">
			<div class="menu-profile-img-container">
				<img class="profile-img" src="/resources/img/ssj_character.png">
			</div>
		</div>
		<div class="menu-wrapper">
			<ul class="menu-list">
				<li class="menu-item"><a class="menu-a" href="/home">Home</a></li>
				<li class="menu-item"><a class="menu-a" href="/resume">Resume</a></li>
				<li class="menu-item"><a class="menu-a" href="/project/projectList">Project</a></li>
				<li class="menu-item"><a class="menu-a" href="/study/studyList">Study</a></li>
				<!-- <li class="menu-item"><a href="/archives">ARCHIVES</a></li> -->
				<li class="menu-item"><a class="menu-a" href="/life/lifeList">Life</a></li>
				<!-- <li class="menu-item"><a href="/about">ABOUT</a></li> -->
				<c:if test="${user_lvl eq  0}">
				<li class="menu-item"><a class="menu-a" href="/manage/category/study">Manage</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<!-- <div class="img-container">		
		<div class="menu-bottom-img-wrapper">
			<div class="menu-bottom-img-gradient"></div>
			<img class="menu-bottom-img mx-auto align-middle" src="/resources/img/menu-bottom-img.jpg">
		</div>
	</div> -->
</div>