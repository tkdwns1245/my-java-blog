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
			<tiles:insertAttribute name="body" />
			<tiles:insertAttribute name="footer"/>
		</div>
	</div>
</div>
</body>
</html>
<tiles:insertAttribute name="script" />