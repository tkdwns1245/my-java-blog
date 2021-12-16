<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="body-contents-wrapper">
	<div class="content-wrapper" >
		<div class="skills-area">
			<div class="title-area">
			<i class="fas fa-wrench fa-lg"></i><h2 style="display:inline; margin-left:10px;">Skills</h2>
			</div>
			<div class="card-wrapper row" style="float: none; margin:100 auto;">
			<%for(int i =0; i <5; i++){ %>
			<div class="card-item col-md-2 mb-5 col-2">
				<div class="skills-card" style="text-align:center">
					<div class="row">
						<div class=" col-12 col-xl-12 skills-card-img-holder" >
						<i class="fab fa-java fa-5x"></i>
						</div>
						<div class="col-xl-12">
							<div class="card-body">
								<div class="card-title">
									<span>Java</span>
								</div>
								<div class="card-summary" style="white-space:pre">
자바스크립트의 기본 문법에
대해 숙지하고 있으며 jquery와
opensource 모듈을 활용 차트 그리기
및 각종 컴포넌트 구현 가능 
								</div>
							</div>
						</div>
					</div>
					<div class="link-mask row">
						<div class="link-mask-text" style="float: none; margin:auto auto;">
							<a class="btn btn-primary" href="/study/studyDetail?num=${study.num}">View Posts</a>
						</div>
					</div>
				</div>
			</div>
			<%} %>
			</div>
			<div class="card-wrapper row" style="float: none; margin:100 auto;">
			<%for(int i =0; i <5; i++){ %>
			<div class="card-item col-md-2 mb-5 col-2">
				<div class="skills-card" style="text-align:center">
					<div class="row">
						<div class=" col-12 col-xl-12 skills-card-img-holder" >
						<i class="fab fa-java fa-5x"></i>
						</div>
						<div class="col-xl-12">
							<div class="card-body">
								<div class="card-title">
									<span>Java</span>
								</div>
								<div class="card-summary" style="white-space:pre">
자바스크립트의 기본 문법에
대해 숙지하고 있으며 jquery와
opensource 모듈을 활용 차트 그리기
및 각종 컴포넌트 구현 가능 
								</div>
							</div>
						</div>
					</div>
					<div class="link-mask row">
						<div class="link-mask-text" style="float: none; margin:auto auto;">
							<a class="btn btn-primary" href="/study/studyDetail?num=${study.num}">View Posts</a>
						</div>
					</div>
				</div>
			</div>
			<%} %>
			</div>
		</div>
		<hr>
		<div class="recent-post-area">
			<div class="title-area">
				<i class="fas fa-pen fa-lg"></i><h2 style="display:inline; margin-left:10px;">Recent Post</h2>
			</div>
		</div>
	</div>
	<div style="margin-top:50px;">
		<a class="btn btn-primary" style="float:right;" href="/study/writeStudy">write</a>
	</div>
</div>
<script type="text/x-jquery-tmpl" id="study-item">
		<div class="card-item col-md-10 mb-5">
			<div class="study-card">
				<div class="row">
					<div class=" col-12 col-xl-3 card-img-holder">
						<img src="/resources/study/\${titleImg}" class="card-img" alt="image" style="position: relative;left: -20px;">
					</div>
					<div class="col-xl-9">
						<div class="card-body">
							<div class="card-title">
								<span>\${title}</span>
							</div>
							<div class="card-summary">
								\${introduce}
							</div>
						</div>
					</div>
				</div>
				<div class="link-mask row">
					<div class="link-mask-text" style="float: none; margin:auto auto;">
						<a class="btn btn-primary" href="/study/studyDetail?num=\${num}">View Posts</a>
					</div>
				</div>
			</div>
		</div>
</script>
