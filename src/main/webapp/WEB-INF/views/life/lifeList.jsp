<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>\
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="body-contents-wrapper">
	<div class="title-wrapper">
		<h1>Life</h2>
	</div>
	<div class="content-wrapper row">
		<div class="category-area col-8">
			<ul class="nav nav-pills"  id="category-list">
				<li class="category-item nav-item" data-category="All">
					<a class="nav-link active btn" data-category="All">All</a>
				</li>
				<c:forEach var="category" items="${categoryList}" varStatus="status">
				<li class="category-item nav-item" >
					<a class="nav-link btn" data-category="${category.name}">${category.name}</a>
				</li>
				</c:forEach>
			</ul>
		</div>
		<div class="col-2"></div>
		<div class="search-area col-2">
			<div class="input-group md-form form-sm form-1 pl-0">
			  <div class="input-group-prepend">
			    <span class="input-group-text purple lighten-3" id="basic-text1"><i class="fas fa-search text-white"
			        aria-hidden="true"></i></span>
			  </div>
			  <input class="form-control my-0 py-1" type="text" placeholder="Search" id="searchInput" aria-label="Search">
			</div>
		</div>
	</div>
	<div class="life-wrapper row" style="float: none; margin:100 auto;" id="lifeList">
		<div class="card-wrapper row" style="float: left; margin:100 auto;">
			<c:forEach var="life" items="${lifeList}" varStatus="status" begin="0" end="3">
			<div class="life-card-item col-md-3 mb-5 col-3">
				<div class="life-card">
					<div class="row">
						<div class=" col-12 col-xl-12 card-img-holder">
							<img src="/resources/life/${life.titleImg}" class="card-img" alt="image">
						</div>
						<div class="col-xl-12">
							<div class="card-body">
								<div class="card-title">
									<span>${life.title}</span>
								</div>
								<div class="card-summary">
									${life.introduce}
								</div>
								<div class="post-date">
									${fn:split(life.createDate,':')[0]}:${fn:split(life.createDate,':')[1]}
								</div>
							</div>
						</div>
					</div>
					<div class="link-mask" style="display:flex">
						<div class="link-mask-text" style="float: none; margin:auto auto;">
							<a class="btn btn-primary" href="/life/lifeDetail?num=${life.num}">View Posts</a>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
		<div class="card-wrapper row" style="float: left; margin:100 auto;">
			<c:forEach var="life" items="${lifeList}" varStatus="status" begin="4" end="7">
				<div class="life-card-item col-md-3 mb-5 col-3">
					<div class="life-card">
						<div class="row">
							<div class=" col-12 col-xl-12 card-img-holder">
								<img src="/resources/life/${life.titleImg}" class="card-img" alt="image">
							</div>
							<div class="col-xl-12">
								<div class="card-body">
									<div class="card-title">
										<span>${life.title}</span>
									</div>
									<div class="card-summary">
										${life.introduce}
									</div>
									<div class="post-date">
										${fn:split(life.createDate,':')[0]}:${fn:split(life.createDate,':')[1]}
									</div>
								</div>
							</div>
						</div>
						<div class="link-mask" style="display:flex">
							<div class="link-mask-text" style="float: none; margin:auto auto;">
								<a class="btn btn-primary" href="/life/lifeDetail?num=${life.num}">View Posts</a>
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
	<s:authorize access="isAuthenticated()">
	<div style="margin-top:50px;">
		<a class="btn btn-primary" style="float:right;" href="/life/writeLife">write</a>
	</div>
	</s:authorize>
</div>

<script type="text/x-jquery-tmpl" id="life-item">
<div class="life-card-item col-md-3 mb-5 col-3" style="text-align:center;">
	<div class="life-card">
		<div class="row">
			<div class=" col-12 col-xl-12 card-img-holder">
				<img src="/resources/life/\${titleImg}" class="card-img" alt="image">
			</div>
			<div class="col-xl-12">
				<div class="card-body">
					<div class="card-title">
						<span>\${title}</span>
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
		<div class="link-mask" style="display:flex">
			<div class="link-mask-text" style="float: none; margin:auto auto;">
				<a class="btn btn-primary" href="/life/lifeDetail?num=\${num}">View Posts</a>
			</div>
		</div>
	</div>
</div>
</script>
<script>
var category = "All";	
var keyword = "";
$(document).on("mouseover",".life-card-item",function () {
    $(this).find('.link-mask').css("visibility","visible");
    $(this).find('.link-mask-text').css("display","block");
})

$(document).on("mouseout",".life-card-item",function () {
	$(this).find('.link-mask').css("visibility","hidden");
	$(this).find('.link-mask-text').css("display","none");
})

$(".nav-link").on( "click", function() {
	var lifeListHtml ="";
	category = $(this).data("category");
	$(".nav-link").removeClass("active");
	$(this).addClass("active");
	setLifeList(category,keyword,1,1);
});
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
1. load life list by category and page and range
2. append lifeList at lifeList tag
3. append pagination Items at paginationBox tag
*/
var setLifeList = function(category,keyword,page,range){
	var paginationItem = "";
	$.ajax({
		type: "POST",
		url: '/life/filterLifeList',
		data: {
			"category": category,
			"keyword" : keyword,
			"page" : page,
			"range" : range,
			},
		success: function (result){
			if(result.responseCode == "success"){
				var pagination;
				$("#lifeList").empty();
				for(var i =0; i <result.data.length; i++){
					var createDate = dateFormat(result.data[i].createDate);
					result.data[i].createDate = createDate;
					$("#lifeList").append($("#life-item").tmpl(result.data[i]));
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
	setLifeList(category,keyword,page,range);
}
function fn_pagination(page, range, rangeSize) {
	setLifeList(category,keyword,page,range);
}

$("#searchInput").on("change keyup paste",function(){
	var searchKeyword = $(this).val();
	keyword = searchKeyword;
	setLifeList(category,searchKeyword,1,1)
})

</script>