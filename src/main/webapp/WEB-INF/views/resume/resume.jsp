<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="body-contents-wrapper">
	<div class="title-wrapper">
		<h2 style="display:inline; margin-left:10px;">Resume</h2>
	</div>
	<div class="content-wrapper" style="float: none; margin:100 auto;">
		<div class="resume-wrapper">
			<div class="resume-profile-wrapper row mb-5" >
				<div class="col-5 border-right">
					<div class="resume-profile-img-container" style="float:left;margin-right:30px;">
						<img class="resume-profile-img" src="/resources/img/resume_profile_img.jpg">
					</div>
					<div>
						<div class="mb-4">
							<h3>Sang Jun Son</h3>
						</div>
						<div class="mb-2">
							<i class="fas fa-phone"></i>  010-6316-5700
						</div>
						<div class="mb-2">
							<i class="far fa-envelope"></i>  tkdwns1245@gmail.com
						</div>
						<div class="mb-2">
							<i class="fab fa-facebook"></i>  jjobbo1212@naver.com
						</div>
					</div>
				</div>
				<div class="col-5 border-right">
					<div style="margin-left:30px;">
						<div class="mb-4">
							<h3>Certificate</h3>
						</div>
						<ul style="margin:0px; padding:0px;">
							<li class="mb-2">
								Engineer Information Processing
							</li>
						</ul>
					</div>
				</div>
				<div class="col-2">
					<div style="margin-left:30px;">
						<div class="mb-4">
							<h3>Interest</h3>
						</div>
						<ul style="margin:0px; padding:0px;">
							<li class="mb-2">
								Play guitar and singing
							</li>
							<li class="mb-2">
								See movie
							</li>
							<li class="mb-2">
								Reading book
							</li>
						</ul>
					</div>
				</div>
			</div>
			<hr>
			<div class="resume-education-wrapper row mb-5" >
				<div class="col-12 mb-4">
					<h3>Education</h3>
				</div>
				<div class="col-4">
					<div>
						<div class="mb-4 education-name">
							<h5>DongRae HighSchool</h5>
						</div>
						<div class="mb-2 education-content">
							Natural sciences and Engineering
						</div>
						<div class="mb-2 education-period">
							2007~2010
						</div>
					</div>
				</div>
				<div class="col-4">
					<div>
						<div class="mb-4 education-name">
							<h5>Pukyong National University</h5>
						</div>
						<div class="mb-2 education-content">
							<ul style="margin:0px; padding:0px;">
								<li>
									Major1 : Computer Engineering
								</li>
								<li>
									Major2 : Fusion Display Engineering
								</li>
							</ul>
						</div>
						<div class="mb-2 education-period">
							2011 ~ 2018
						</div>
					</div>
				</div>
				<div class="col-4">
					<div>
						<div class="mb-4 education-name">
							<h5>KG ITBANK</h5>
						</div>
						<div class="mb-2 education-content">
							responsive web programming course
						</div>
						<div class="mb-2 education-period">
							2019
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div class="resume-work-wrapper row mb-5" >
				<div class="col-12 mb-4">
					<h3>Work Experiences</h3>
				</div>
				<div class="col-4">
					<div>
						<div class="mb-4 education-name">
							<h5>Toogram Systems</h5>
						</div>
						<div class="mb-2 education-content">
							<ul style="margin:0px; padding:0px;">
								<li>
									Python/django web project
								</li>
								<li>
									Maintanance big data echo system(zeppelin,spark,hadoop,kafka,mesos)
								</li>
								<li>
									Java/spring web project
								</li>
							</ul>
						</div>
						<div class="mb-2 education-period">
							2020 ~ 2021
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div class="resume-skills-wrapper row mb-5" >
				<div class="col-12 mb-4">
					<h3>Skills</h3>
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
			<div id="paginationBox" class="col-12" style="text-align:center;">
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
