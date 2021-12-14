<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="body-contents-wrapper">
	<div class="title-wrapper">
		<h1>Study</h2>
	</div>
	<div class="category-wrapper row">
		<ul id="category-area">
			<li class="category-item">
				<a>
					All
				</a>
			</li>
			<li class="category-item">
				<a>
					Java
				</a>
			</li>
			<li class="category-item">
				<a>
					Php
				</a>
			</li>
			<li class="category-item">
				<a>
					Python
				</a>
			</li>
			<li class="category-item">
				<a>
					Javascript
				</a>
			</li>
			<li class="category-item">
				<a>
					Node.js
				</a>
			</li>
		</ul>
	</div>
	<div class="study-wrapper row" style="float: none; margin:100 auto;">
		<c:forEach var="study" items="${studyList}" varStatus="status">
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
		</c:forEach>
	</div>
	<div style="margin-top:50px;">
		<a class="btn btn-primary" style="float:right;" href="/study/writeStudy">write</a>
	</div>
</div>
<script>
$(".card-item").mouseover(function () {
    $(this).find('.link-mask').css("visibility","visible");
    $(this).find('.link-mask-text').css("display","block");
});
$(".card-item").mouseout(function () {
	$(this).find('.link-mask').css("visibility","hidden");
	$(this).find('.link-mask-text').css("display","none");
});
</script>