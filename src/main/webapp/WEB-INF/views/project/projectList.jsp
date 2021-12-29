<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="body-contents-wrapper">
	<div class="title-wrapper">
		<h1>Project</h2>
	</div>
	<div class="project-wrapper row" id="project-list">
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
				<li class="page-item"><a class="page-link" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">이전</a></li>
			</c:if>
			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>
			</c:forEach>
			<c:if test="${pagination.next}">
				<li class="page-item"><a class="page-link" onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')" >다음</a></li>
			</c:if>
		</ul>
	</div>
	<c:if test="${user_lvl eq  0}">
	<div style="margin-top:50px;">
		<a class="btn btn-primary" style="float:right;" href="/project/writeProject">write</a>
	</div>
	</c:if>
</div>
<script type="text/x-jquery-tmpl" id="project-item">
<div class="project-item col-md-6 mb-5">
	<div class="project-card">
		<div class="row">
		<div class=" col-12 col-xl-5 card-img-holder">
			<img src="/resources/project/\${projectImg}" class="card-img" alt="image">
		</div>
		<div class="col-xl-7">
			<div class="card-body">
				<div class="card-title">
					<span>\${projectName}</span>
				</div>
				<div class="card-summary">
					\${introduce}
				</div>
				<div class="post-date">
					\${createDate}
				</div>
			</div>
		</div>
		</div>
		<div class="link-mask">
			<div class="link-mask-text">
				<i class="fas fa-users"></i>  members : \${members}
			</div>
			<div class="link-mask-text">
				<i class="far fa-clock"></i>  period : \${fromDate} ~ \${toDate} \${period}days
			</div>
			<div class="link-mask-text">
				<i class="fas fa-wrench"></i>  skills : \${skills}
			</div>
			<div class="link-mask-text" style="text-align:center;">
				<a class="btn btn-primary" href="/project/projectDetail?num=\${num}">View Posts</a>
			</div>
		</div>
	</div>
</div>
</script>
<script>
function dateFormat(timestamp) {
	var date = new Date(timestamp)
    let month = date.getMonth() + 1;
    let day = date.getDate();
    let hour = date.getHours();
    let minute = date.getMinutes();
    let second = date.getSeconds();

    month = month >= 10 ? month : '0' + month;
    day = day >= 10 ? day : '0' + day;
    hour = hour >= 10 ? hour : '0' + hour;
    minute = minute >= 10 ? minute : '0' + minute;
    second = second >= 10 ? second : '0' + second;

    return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute;
}

/*
1. load study list by category and page and range
2. append studyList at studyList tag
3. append pagination Items at paginationBox tag
*/
var setProjectList = function(page,range){
	var paginationItem = "";
	$.ajax({
		type: "POST",
		url: '/project/projectList',
		data: {
			"page" : page,
			"range" : range,
			},
		success: function (result){
			if(result.responseCode == "success"){
				var pagination;
				$("#studyList").empty();
				for(var i =0; i <result.data.length; i++){
					var createDate = dateFormat(result.data[i].createDate);
					result.data[i].createDate = createDate;
					$("#studyList").append($("#project-item").tmpl(result.data[i]));
				}
				
				/*
				set pagination
				*/
				$(".pagination").empty();
				pagination = result.pagination;
				if(pagination.prev) {
					paginationItem += "<li class='page-item'><a class='page-link' href='#' onClick=\"fn_prev('"+pagination.page+"', '"+pagination.range+"', '"+pagination.rangeSize+"')\">이전</a></li>";
				}
				for(var i=pagination.startPage; i <= pagination.endPage; i++) {
					if(pagination.page == i){
						paginationItem += "<li class='page-item active'><a class='page-link' onClick=\"fn_pagination('"+i+"', '"+pagination.range+"', '"+pagination.rangeSize+"')\">"+ i +"</a></li>";
					}else{
						paginationItem += "<li class='page-item'><a class='page-link' onClick=\"fn_pagination('"+i+"', '"+pagination.range+"', '"+pagination.rangeSize+"')\">"+ i +"</a></li>";
					}
				}
				if(pagination.next) {
					paginationItem += "<li class='page-item'><a class='page-link' onClick=\"fn_next('"+pagination.page+"', '"+pagination.range+"', '"+pagination.rangeSize+"')\">다음</a></li>";
				}
				$(".pagination").append(paginationItem);
			}
		},
		error: function(e){
			console.log(e);
		}
	})
}
function fn_next(page, range, rangeSize) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	setProjectList(page,range);
}
function fn_pagination(page, range, rangeSize) {
	setProjectList(page,range);
}
$(document).on("mouseover",".project-item",function () {
       $(this).find('.link-mask').css("visibility","visible");
       $(this).find('.link-mask-text').css("display","block");
   });
$(document).on("mouseout",".project-item",function () {
	$(this).find('.link-mask').css("visibility","hidden");
	$(this).find('.link-mask-text').css("display","none");
   });
</script>
