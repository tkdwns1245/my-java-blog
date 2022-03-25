<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<c:set var="user_lvl" value="${user_lvl}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SSJ's Place</title>
<tiles:insertAttribute name="css" />
<tiles:insertAttribute name="js" />
</head>
<body>
<tiles:insertAttribute name="left" />
<div class="content">
	<div class="main-wrapper">
		<div class="main">
			<tiles:insertAttribute name="header" />
			<div class="body-contents-wrapper">
				<div class="title-wrapper">
					<h1>Manage</h2>
				</div>
				<div class="content-wrapper row">
					<nav class="navbar navbar-expand-lg navbar-light bg-light" style="width:1440px;">
						<div class="collapse navbar-collapse" id="navbarNav">
							<ul class="navbar-nav" id="category-list">
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							          Category
							        </a>
							        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							          <a class="dropdown-item" href="/manage/category/study">Study</a>
							          <a class="dropdown-item" href="/manage/category/life">Life</a>
							        </div>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="/manage/record/visit">Record</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="/manage/resume/record">Resume</a>
								</li>
							</ul>
						</div>
					</nav>
				</div>
				<div class="manage-wrapper row" style="float: none; margin:100 auto;" id="studyList">
				<tiles:insertAttribute name="contents"/>
				</div>
			</div>
			<tiles:insertAttribute name="footer"/>
		</div>
	</div>
</div>
</body>
</html>
<tiles:insertAttribute name="script" />