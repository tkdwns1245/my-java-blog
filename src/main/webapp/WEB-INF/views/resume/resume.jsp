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
				<div class="col-12 card-wrapper row" style="float: none; margin:100 auto;">
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
				<div class="col-12 card-wrapper row" style="float: none; margin:100 auto;">
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
</script>
