<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="body-contents-wrapper">
	<div class="title-wrapper">
		<i class="fas fa-wrench fa-lg"></i><h2 style="display:inline; margin-left:10px;">Skills</h2>
	</div>
	<div class="content-wrapper row" style="float: none; margin:100 auto;">
		<div class="card-item col-md-10 mb-5">
			<div class="study-card">
				<div class="row">
					<div class=" col-12 col-xl-3 card-img-holder">
						<img src="/resources/study/${study.titleImg}" class="card-img" alt="image" style="position: relative;left: -20px;">
					</div>
					<div class="col-xl-9">
						<div class="card-body">
							<div class="card-title">
								<span>${study.title}</span>
							</div>
							<div class="card-summary">
								${study.introduce}
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
