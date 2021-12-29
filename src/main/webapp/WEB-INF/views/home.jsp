<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="body-contents-wrapper">
	<div class="content-wrapper" >
		<div class="skills-area">
			<div class="title-area">
				<div>
					<i class="fas fa-wrench fa-lg"></i><h2 style="display:inline; margin-left:10px;">Skills</h2>
				</div>
			</div>
			<div class="skills-card-area" id="skillsList">
				<div class="card-wrapper row" style="float: none; margin:100 auto;" id="upper_card_wrapper">
				<c:forEach var="skill" items="${skillsList}" varStatus="status" begin="0" end="3">
				<div class="skills-card-item col-md-3 mb-5 col-3">
					<div class="skills-card" style="text-align:center">
						<div class="row">
							<div class=" col-12 col-xl-12 skills-card-img-holder" >
							<img class="skill-icon" src="/resources/skills/${skill.skillIcon}">
							</div>
							<div class="col-xl-12">
								<div class="skills-card-body">
									<div class="skills-card-title">
										<h4>${skill.skillName}</h4>
									</div>
									<div class="skills-card-summary" style="white-space:normal">
	${skill.summary}
									</div>
								</div>
							</div>
						</div>
						<div class="link-mask row" style="margin-left:0px; margin-right:0px;">
							<div class="link-mask-text" style="float: none; margin:auto auto;">
								<a class="btn btn-primary" href="/skills/skillsDetail?num=${skill.num}">View Detail</a>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				</div>
				<div class="card-wrapper row" style="float: none; margin:100 auto;" id="lowwer_card_wrapper">
				<c:forEach var="skill" items="${skillsList}" varStatus="status" begin="4" end="7">
				<div class="skills-card-item col-md-3 mb-5 col-3">
					<div class="skills-card" style="text-align:center">
						<div class="row">
							<div class=" col-12 col-xl-12 skills-card-img-holder" >
							<img class="skill-icon" src="/resources/skills/${skill.skillIcon}">
							</div>
							<div class="col-xl-12">
								<div class="skills-card-body">
									<div class="skills-card-title">
										<h4>${skill.skillName}</h4>
									</div>
									<div class="skills-card-summary" style="white-space:normal">
	${skill.summary}
									</div>
								</div>
							</div>
						</div>
						<div class="link-mask row" style="margin-left:0px; margin-right:0px;">
							<div class="link-mask-text" style="float: none; margin:auto auto;">
								<a class="btn btn-primary" href="/skills/skillsDetail?num=${skill.num}">View Detail</a>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				</div>
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
			<div>
				<a class="btn btn-primary" style="float:right;" href="/skills/writeSkills">write</a>
			</div>
			</c:if>
		</div>
		<hr>
		<div class="recent-post-area">
			<div class="title-area">
				<div>
					<i class="fas fa-pen fa-lg"></i><h2 style="display:inline; margin-left:10px;">Recent Post</h2>
				</div>
			</div>
			<div class="recent-post-area row" style="float: none; margin:100 auto;" id="lifeList">
				<div class="card-wrapper row" style="float: left; margin:100 auto;">
				<c:forEach var="recentPost" items="${recentPostList}" begin="0" end="3" varStatus="status">
				<div class="life-card-item col-md-3 mb-5 col-3">
					<div class="life-card">
						<div class="row">
							<div class=" col-12 col-xl-12 card-img-holder">
								<img src="/resources/${recentPost.type}/${recentPost.postImg}" class="card-img" alt="image" >
							</div>
							<div class="col-xl-12">
								<div class="card-body">
									<div class="card-title">
										<span>${recentPost.postName}</span>
									</div>
									<div class="card-summary">
										${recentPost.introduce}
									</div>
									<div class="post-date">
										${fn:split(recentPost.createDate,':')[0]}:${fn:split(recentPost.createDate,':')[1]}
									</div>
								</div>
							</div>
						</div>
						<div class="link-mask row" style="margin-left:0px; margin-right:0px;">
							<div class="link-mask-text" style="float: none; margin:auto auto;">
								<a class="btn btn-primary" href="/${recentPost.type}/${recentPost.type}Detail?num=${recentPost.num}">View Posts</a>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/x-jquery-tmpl" id="skill-item">
<div class="skills-card-item col-md-3 mb-5 col-3">
	<div class="skills-card" style="text-align:center">
		<div class="row">
			<div class=" col-12 col-xl-12 skills-card-img-holder" >
			<img class="skill-icon" src="/resources/skills/\${skillIcon}">
			</div>
			<div class="col-xl-12">
				<div class="skills-card-body">
					<div class="skills-card-title">
						<h4>\${skillName}</h4>
					</div>
					<div class="skills-card-summary" style="white-space:normal">
\${summary}
					</div>
				</div>
			</div>
		</div>
		<div class="link-mask row" style="margin-left:0px; margin-right:0px;">
			<div class="link-mask-text" style="float: none; margin:auto auto;">
				<a class="btn btn-primary" href="/skills/skillsDetail?num=\${num}">View Detail</a>
			</div>
		</div>
	</div>
</div>
</script>
<script>
$(document).on("mouseover",".skills-card-item",function () {
    $(this).find('.link-mask').css("visibility","visible");
    $(this).find('.link-mask-text').css("display","block");
})

$(document).on("mouseout",".skills-card-item",function () {
	$(this).find('.link-mask').css("visibility","hidden");
	$(this).find('.link-mask-text').css("display","none");
})

$(document).on("mouseover",".life-card-item",function () {
    $(this).find('.link-mask').css("visibility","visible");
    $(this).find('.link-mask-text').css("display","block");
})

$(document).on("mouseout",".life-card-item",function () {
	$(this).find('.link-mask').css("visibility","hidden");
	$(this).find('.link-mask-text').css("display","none");
})

var setSkillsList = function(page,range){
	var paginationItem = "";
	$.ajax({
		type: "POST",
		url: '/home/skillsList',
		data: {
			"page" : page,
			"range" : range,
			},
		success: function (result){
			if(result.responseCode == "success"){
				console.log(result.data);
				var pagination;
				$("#upper_card_wrapper").empty();
				$("#lowwer_card_wrapper").empty();
				for(var i =0; i <result.data.length; i++){
					if(i < 4){
						$("#upper_card_wrapper").append($("#skill-item").tmpl(result.data[i]));
					}else{
						$("#lowwer_card_wrapper").append($("#skill-item").tmpl(result.data[i]));
					}
				}
				/*
				set pagination
				*/
				$(".pagination").empty();
				pagination = result.pagination;
				if(pagination.prev) {
					paginationItem += "<li class='page-item'><a class='page-link' onClick=\"fn_prev('"+pagination.page+"', '"+pagination.range+"', '"+pagination.rangeSize+"')\">이전</a></li>";
				}
				for(var i=pagination.startPage; i <= pagination.endPage; i++) {
					if(i == pagination.page){
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
	setSkillsList(page,range);
}
function fn_pagination(page, range, rangeSize) {
	setSkillsList(page,range);
}
</script>