<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="body-contents-wrapper">
	<div class="title-wrapper">
		<h1>Project</h2>
	</div>
	<div class="project-wrapper row">
		<c:forEach var="project" items="${projectList}" varStatus="status">
		<div class="project-item col-md-6 mb-5">
			<div class="project-card">
				<div class="row">
				<div class=" col-12 col-xl-5 card-img-holder">
					<img src="/resources/project/${project.projectImg}" class="card-img" alt="image">
				</div>
				<div class="col-xl-7">
					<div class="card-body">
						<div class="card-title">
							<span>${project.projectName}</span>
						</div>
						<div class="card-summary">
							${project.introduce}
						</div>
						<div class="post-date">
							${fn:split(project.createDate,':')[0]}:${fn:split(project.createDate,':')[1]}
						</div>
					</div>
				</div>
				</div>
				<div class="link-mask">
					<div class="link-mask-text">
						<i class="fas fa-users"></i>  members : ${project.members}
					</div>
					<div class="link-mask-text">
						<i class="far fa-clock"></i>  period : ${project.fromDate} ~ ${project.toDate} ${project.period}days
					</div>
					<div class="link-mask-text">
						<i class="fas fa-wrench"></i>  skills : ${project.skills}
					</div>
					<div class="link-mask-text" style="text-align:center;">
						<a class="btn btn-primary" href="/project/projectDetail?num=${project.num}">View Posts</a>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
	<div id="paginationBox" style="text-align:center;">
		<ul class="pagination">
			<c:if test="${pagination.prev}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">이전</a></li>
			</c:if>
			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>
			</c:forEach>
			<c:if test="${pagination.next}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')" >다음</a></li>
			</c:if>
		</ul>
	</div>
	<c:if test="${user_lvl eq  0}">
	<div style="margin-top:50px;">
		<a class="btn btn-primary" style="float:right;" href="/project/writeProject">write</a>
	</div>
	</c:if>
	<script>
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/project/projectList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
	function fn_pagination(page, range, rangeSize) {
		
		var url = "${pageContext.request.contextPath}/project/projectList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		
		location.href = url;	
	
	}
	$(".project-item").mouseover(function () {
        $(this).find('.link-mask').css("visibility","visible");
        $(this).find('.link-mask-text').css("display","block");
    });
	$(".project-item").mouseout(function () {
		$(this).find('.link-mask').css("visibility","hidden");
		$(this).find('.link-mask-text').css("display","none");
    });
	</script>
</div>