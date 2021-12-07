<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="col-md-12 mb-5">
	<div class="project-detail-card">
		<div class="row">
			<div class=" col-3 col-xl-3 card-img-holder" style="margin:2rem">
				<img src="resources/project/${project.projectImg}" class="card-img" alt="image">
			</div>
			<div class="col-xl-5">
				<div class="card-body">
					<div class="card-title">
						<span>${project.projectName}</span>
					</div>
					<div>
						${project.introduce}
					</div>
					<div>
						<i class="fas fa-users"></i>  members : ${project.members}
					</div>
					<div>
						<i class="far fa-clock"></i>  period : ${project.fromDate} ~ ${project.toDate} ${project.period}days
					</div>
					<div>
						<i class="fas fa-wrench"></i>  skills : ${project.skills}
					</div>
				</div>
			</div>
			<div class="col-12">
				<div class="project-detail-contents-title">
					<h1>Contents</h2>
				</div>
				<div class="proejct-contents">
					${project.contents}
				</div>
			</div>
		</div>
	</div>
</div>