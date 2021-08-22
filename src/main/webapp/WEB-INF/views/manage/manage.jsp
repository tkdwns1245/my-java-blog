<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<div class="body-contents-wrapper">
	<div class="title-wrapper">
		<h2>${title}</h2>
	</div>
	<div class="manage-wrapper">
		<div class="manage-menu-wrapper">
			<div class="manage-menu-item">
				<ul>
					<li class="manage-item" data-item="cateogry">Category</a></li>
					<li class="manage-item" data-item="archives">Archives</a></li>
					<li class="manage-item" data-item="project">Project</a></li>
					<li class="manage-item" data-item="culture">Culture</a></li>
				</ul>
			</div>
		</div>
		<div class="manage-content-wrapper">
			<div class="manage-title-wrapper">
				<span class="manage-title">category</span>
				<input class="manage-category" type="button" value="카테고리 관리">
				<input class="register-btn" type="button" value="등록">
				<input class="delete-btn" type="button" value="삭제">
			</div>
			<div class="manage-list">
				
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="categoryMangeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="width:700px;">
      <div class="modal-header">
       <!-- 모달 이름 -->
        <h5 class="modal-title" id="exampleModalLabel">Category Manage</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="primary-category-wrapper" style="float:left; width:50%">
      	<div class="category-title">
      		<span>1차카테고리</span>
      	</div>
      	<div class="category-top-wrapper">
      		<button type="button" class="btn btn-primary primary-category-add">추가</button>
      		<button type="button" class="btn btn-danger">삭제</button>
      	</div>
      	<div class="category-contents">
      		<table>
      			<thead>
      				<th><input type="checkbox"/></th>
      				<th>카테고리명</th>
      				<th></th>
      			</thead>
      			<tbody class="primary-category-list">
      			</tbody>
      		</table>
      	</div>
      </div>
      <div class="secondary-category-wrapper" width="50%">
      	<div class="category-title">
      		<span>2차카테고리</span>
      	</div>
      	<div class="category-top-wrapper">
 	      	<button type="button" class="btn btn-primary secondary-category-add">추가</button>
      		<button type="button" class="btn btn-danger">삭제</button>
      	</div> 	
      	<div class="category-contents">
      		<table>
      			<thead>
      				<th><input type="checkbox"/></th>
      				<th>카테고리명</th>
      			</thead>
      			<tbody class="secondary-category-list">
      			</tbody>
      		</table>
      	</div>
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script>
	var selected_menu = "category";
	var primary_category_add_flag = true;
	var secondary_category_add_flag = true;
	$(".manage-item").click(function(){
		var title = $(this).data("item");
		var selected_menu = $(this).data("item");
		$(".manage-title").text(title);
	})
	$(".register-btn").click(function(){
		location.href="/manage/register/"+selected_menu;
	})
	$(".manage-category").click(function(){
		$(".primary-category-list").empty();
		var categoryItems;
		ajaxfunction(
				"/categories/pcategoryList",
				"GET",
				"",
				function(result){
					for(var i = 0 ; i < result.pcategoryList.length;i++ )
					{
						var category_name = result.pcategoryList[i].categoryName;
						var category_id = result.pcategoryList[i].categoryId;
							categoryItems += "<tr><td><input type='checkbox'/></td>";
							categoryItems += "<td><button type='button' class='btn btn-default primary-category-btn'>"+category_name+"</button></td>";
							categoryItems += "<td><button type='button' class='btn btn-default edit-primary-category-btn' data-category_name='"+category_name+"' data-category_id='"+category_id+"'>수정</button></td></tr>";
					}
					$(".primary-category-list").append(categoryItems);
				},
				function(){alert("에러가 발생하였습니다.")}
				)
		$("#categoryMangeModal").modal("show");
    });
	$(".primary-category-add").click(function(){
		if(primary_category_add_flag == true)
		{
			var categoryItem  = "<tr><td><input type='checkbox'/></td>";
				categoryItem += "<td><input type='text' class='primary-category-name'/></td>";
				categoryItem += "<td><button type='button' class='btn btn-default add-primary-category-btn'>확인</button></td></tr>";
			$(".primary-category-list").append(categoryItem);
			primary_category_add_flag = false;
		}else{
			alert("입력중에는 추가할 수 없습니다.");
		}
		
	});
	$(document).on("click",".add-primary-category-btn",function(){
		var primary_category_name = $(".primary-category-name").val();
		var add_category_id;
		var pcategory = {
                categoryName: primary_category_name
        }
		if(primary_category_add_flag == false)
		{
			ajaxfunction(
					"/categories/pcategoryInsert",
					"POST",
					pcategory,
					function(result){
						alert(result.resultMsg);
						add_category_id = result.categoryId;
						alert(add_category_id);
						},
					function(){alert("에러가 발생하였습니다.")}
					)
			$(this).parent().parent().remove();
			var categoryItem  = "<tr><td><input type='checkbox'/></td>";
				categoryItem += "<td><button type='button' class='btn btn-default primary-category-btn'>"+primary_category_name+"</button></td>";
				categoryItem += "<td><button type='button' class='btn btn-default edit-primary-category-btn' data-category_name='"+primary_category_name+"' data-category_id='"+add_category_id+"'>수정</button></td></tr>";
			$(".primary-category-list").append(categoryItem);
		primary_category_add_flag = true;
		}else{
			alert("잘못된 접근방법입니다.");
		}
	})
	$(document).on("click",".edit-primary-category-btn",function(){
		if(primary_category_add_flag == false)
		{
			alert("한번에 하나의 카테고리만 수정할 수 있습니다.");
			return;
		}
		primary_category_add_flag = false
		var category_name = $(this).data("category_name");
		var category_id = $(this).data("category_id");
		var categoryItem  = "<td><input type='checkbox'/></td>";
			categoryItem += "<td><input type='text' class='primary-category-name' value='"+category_name+"'/></td>";
			categoryItem += "<td><button type='button' class='btn btn-default edit-primary-category-ok-btn' data-category_name='"+category_name+"'  data-category_id='"+category_id+"'>확인</button></td>";
			$(this).parent().parent().html(categoryItem);
	})
	$(document).on("click",".edit-primary-category-ok-btn",function(){
		primary_category_add_flag =true
		var category_name = $(this).data("category_name");
		var category_id = $(this).data("category_id");
		var primary_category_name = $(".primary-category-name").val();
		var categoryItem  = "<td><input type='checkbox'/></td>";
			categoryItem += "<td><input type='button' class='btn btn-default primary-category-btn' value='"+primary_category_name+"'/></td>";
			categoryItem += "<td><button type='button' class='btn btn-default edit-primary-category-btn' data-category_name='"+primary_category_name+"' data-category_id='"+category_id+"'>수정</button></td>";
			$(this).parent().parent().html(categoryItem);
	})
	$(".secondary-category-add").click(function(){
		if(secondary_category_add_flag == true)
		{
			var categoryItem  = "<tr><td><input type='checkbox'/></td>";
				categoryItem += "<td><input type='text' class='secondary-category-name'/></td>";
				categoryItem += "<td><button type='button' class='btn btn-default add-secondary-category-btn'>확인</button></td></tr>";
			$(".secondary-category-list").append(categoryItem);
			secondary_category_add_flag = false;
		}else{
			alert("입력중에는 추가할 수 없습니다.");
		}
		
	});
	$(document).on("click",".add-secondary-category-btn",function(){
		var secondary_category_name = $(".secondary-category-name").val();
		if(secondary_category_add_flag == false)
		{
			$(this).parent().parent().remove();
			var categoryItem  = "<tr><td><input type='checkbox'/></td>";
				categoryItem += "<td><button type='button' class='btn btn-default secondary-category-btn'>"+secondary_category_name+"</button></td>";
				categoryItem += "<td><button type='button' class='btn btn-default edit-secondary-category-btn' data-category_name='"+secondary_category_name+"'>수정</button></td></tr>";
			$(".secondary-category-list").append(categoryItem);
			secondary_category_add_flag = true;
		}else{
			alert("잘못된 접근방법입니다.");
		}
	})
	$(document).on("click",".edit-secondary-category-btn",function(){
		if(secondary_category_add_flag == false)
		{
			alert("한번에 하나의 카테고리만 수정할 수 있습니다.");
			return;
		}
		secondary_category_add_flag = false
		var category_name = $(this).data("category_name");
		var categoryItem  = "<td><input type='checkbox'/></td>";
			categoryItem += "<td><input type='text' class='secondary-category-name' value='"+category_name+"'/></td>";
			categoryItem += "<td><button type='button' class='btn btn-default edit-secondary-category-ok-btn' data-category_name='"+category_name+"'>확인</button></td>";
			$(this).parent().parent().html(categoryItem);
	})
	$(document).on("click",".edit-secondary-category-ok-btn",function(){
		secondary_category_add_flag =true
		var category_name = $(this).data("category_name");
		var secondary_category_name = $(".secondary-category-name").val();
		var categoryItem  = "<td><input type='checkbox'/></td>";
			categoryItem += "<td><input type='button' class='btn btn-default secondary-category-btn' value='"+secondary_category_name+"'/></td>";
			categoryItem += "<td><button type='button' class='btn btn-default edit-secondary-category-btn' data-category_name='"+secondary_category_name+"'>수정</button></td>";
			$(this).parent().parent().html(categoryItem);
	})
</script>