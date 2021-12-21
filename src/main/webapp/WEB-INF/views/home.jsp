<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="body-contents-wrapper">
	<div class="content-wrapper" >
		<div class="skills-area">
			<div class="title-area">
			<i class="fas fa-wrench fa-lg"></i><h2 style="display:inline; margin-left:10px;">Skills</h2>
			</div>
			<div class="card-wrapper row" style="float: none; margin:100 auto;">
			<%for(int i =0; i <4; i++){ %>
			<div class="skills-card-item col-md-3 mb-5 col-3">
				<div class="skills-card" style="text-align:center">
					<div class="row">
						<div class=" col-12 col-xl-12 skills-card-img-holder" >
						<i class="fab fa-java fa-3x"></i>
						</div>
						<div class="col-xl-12">
							<div class="skills-card-body">
								<div class="skills-card-title">
									<h4>Java</h4>
								</div>
								<div class="skills-card-summary" style="white-space:normal">
자바스크립트의 기본 문법에 대해 숙지하고 있으며 jquery와
opensource 모듈을 활용 차트 그리기
및 각종 컴포넌트 구현 가능 
자바스크립트의 기본 문법에 대해 숙지하고 있으며 jquery와
opensource 모듈을 활용 차트 그리기
및 각종 컴포넌트 구현 가능 
								</div>
							</div>
						</div>
					</div>
					<div class="link-mask row" style="margin-left:0px; margin-right:0px;">
						<div class="link-mask-text" style="float: none; margin:auto auto;">
							<a class="btn btn-primary" href="/skills/skillsDetail?num=0">View Detail</a>
						</div>
					</div>
				</div>
			</div>
			<%} %>
			</div>
			<div class="card-wrapper row" style="float: none; margin:100 auto;">
			<%for(int i =0; i <3; i++){ %>
			<div class="skills-card-item col-md-3 mb-5 col-3">
				<div class="skills-card" style="text-align:center">
					<div class="row">
						<div class=" col-12 col-xl-12 skills-card-img-holder" >
						<i class="fab fa-java fa-3x"></i>
						</div>
						<div class="col-xl-12">
							<div class="skills-card-body">
								<div class="skills-card-title">
									<h4>Java</h4>
								</div>
								<div class="skills-card-summary" style="white-space:normal">
자바스크립트의 기본 문법에 대해 숙지하고 있으며 jquery와
opensource 모듈을 활용 차트 그리기
및 각종 컴포넌트 구현 가능 
자바스크립트의 기본 문법에 대해 숙지하고 있으며 jquery와
opensource 모듈을 활용 차트 그리기
및 각종 컴포넌트 구현 가능 
								</div>
							</div>
						</div>
					</div>
					<div class="link-mask row" style="margin-left:0px; margin-right:0px;">
						<div class="link-mask-text" style="float: none; margin:auto auto;">
							<a class="btn btn-primary" href="/skills/skillsDetail?num=0">View Detail</a>
						</div>
					</div>
				</div>
			</div>
			<%} %>
			</div>
			<c:if test="${user_lvl eq  0}">
			<div style="margin-top:50px;">
				<a class="btn btn-primary" style="float:right;" href="/skills/writeSkills">write</a>
			</div>
			</c:if>
		</div>
		<hr>
		<div class="recent-post-area">
			<div class="title-area">
				<i class="fas fa-pen fa-lg"></i><h2 style="display:inline; margin-left:10px;">Recent Post</h2>
			</div>
			<div class="life-wrapper row" style="float: none; margin:100 auto;" id="lifeList">
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
</script>