<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="manage-container">
	<div class="manage-top-wrapper">
		<div class="manage-btn-area" style="float:right;margin-bottom:30px;">
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createModal" id="addBtn">
			  Add
			</button>
		</div>
	</div>
	<div class="manage-table-wrapper">
		<table class="table">
			<colgroup>
				<col style="width:50%;">
				<col style="width:20%;">
				<col style="width:30%;">
			</colgroup>
			<thead class="thead-dark">
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Seq</th>
					<th scope="col">Setting</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="category" items="${categoryList}" varStatus="status">
				<tr>
					<td style="text-align:center;">${category.name}</td>
					<td style="text-align:center;">${category.seq}</td>
					<td style="text-align:center;">
						<a class="btn btn-danger deleteBtn" style="margin-right:30px;" data-num="${category.num}">delete</a>
						<a class="btn btn-primary editBtn" data-num="${category.num}">edit</a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="modal" id="createModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Create Study category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<form id="frm" method="POST">
      	<input type="hidden" name="type" class="form-control" value="study">
      	<input type="hidden" name="num">
        <div class="input-area row">
			<div class="col-2">Name</div>
			<div class="col-10">
				 <input type="text" name="name" class="form-control">
			</div>
		</div>
		<div class="input-area row">
			<div class="col-2">Seq</div>
			<div class="col-10">
				 <input type="number" name="seq" class="form-control">
			</div>
		</div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="submitBtn">Save</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script>
var initFormValue = function(){
	$("input[name=num]").val("");
	$("input[name=name]").val("");
	$("input[name=seq]").val("");	
}
$.fn.serializeObject = function() { 
    var obj = null; 
    try { 
        if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) { 
            var arr = this.serializeArray(); 
            if(arr){ obj = {}; 
            jQuery.each(arr, function() { 
                obj[this.name] = this.value; }); 
            } 
        } 
    }catch(e) { 
        alert(e.message); 
    }finally {} 
    return obj; 
  }

$("#addBtn").on("click",function(){
	initFormValue();
})
$("#submitBtn").on("click",function(){
	var params = $('#frm').serializeObject();
	var JsonParams = JSON.stringify(params);
	if($("input[name=name]").val() == ""){
		alert("insert name");
		return;
	}else if($("input[name=seq]").val() == ""){
		alert("insert seq");
		return;
	}
	
	if(params.num == ""){
		$.ajax({
			type: "POST",
			url: '/manage/category/create',
			data: params,
			success: function (result){
				if(result.result == "SUCCESS"){
					alert("success create category!");
					$("#createModal").modal('hide');
					window.location.href = "/manage/category/study";
				}
			},
			error: function(e){
				console.log(e);
			}
		})
	}else{
		$.ajax({
			type: "POST",
			url: '/manage/category/edit',
			data: params,
			success: function (result){
				if(result.result == "SUCCESS"){
					alert("success edit category!");
					$("#createModal").modal('hide');
					window.location.href = "/manage/category/study";
				}
			},
			error: function(e){
				console.log(e);
			}
		})
	}
})
$(".editBtn").on("click",function(){
	initFormValue();
	var selectNum = $(this).data("num");
	$.ajax({
		type: "POST",
		url: '/manage/categry/getCategoryByNum',
		data: {"num" : selectNum},
		success: function (result){
			if(result.result == "SUCCESS"){
				var resultData = result.data;
				$("input[name=num]").val(resultData.num);
				$("input[name=name]").val(resultData.name);
				$("input[name=seq]").val(resultData.seq);
				$("#createModal").modal('show');
			}else{
				alert("Error is generated!");
			}
		},
		error: function(e){
			console.log(e);
		}
	})
})
$(".deleteBtn").on("click",function(){
	var selectNum = $(this).data("num");
	var confirm = window.confirm('Are you sure you want to delete?');
	if(confirm){
		$.ajax({
			type: "POST",
			url: '/manage/category/delete',
			data: {"num" : selectNum},
			success: function (result){
				if(result.result == "SUCCESS"){
					alert("success delete category!");
					window.location.href = "/manage/category/study";
				}else{
					alert("Error is generated!");
				}
			},
			error: function(e){
				console.log(e);
			}
		})
	}
})
</script>
