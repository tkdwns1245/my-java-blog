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
				<col style="width:20%;">
				<col style="width:50%;">
				<col style="width:10%;">
				<col style="width:20%;">
			</colgroup>
			<thead class="thead-dark">
				<tr>
					<th scope="col">Title</th>
					<th scope="col">Content</th>
					<th scope="col">Date</th>
					<th scope="col">Setting</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="work" items="${workList}" varStatus="status">
				<tr>
					<td style="text-align:center;"><c:out value="${work.title}"/></td>
					<td style="text-align:center;">${work.content}</td>
					<td style="text-align:center;"><c:out value="${work.date}"/></td>
					<td style="text-align:center;">
						<a class="btn btn-danger deleteBtn" style="margin-right:30px;" data-num="${work.num}">delete</a>
						<a class="btn btn-primary editBtn" data-num="${work.num}">edit</a>
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
        <h5 class="modal-title">Create Resume WorkExperience</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<form id="frm" method="POST">
      	<input type="hidden" name="type" class="form-control" value="study">
      	<input type="hidden" name="num">
        <div class="input-area row">
			<div class="col-2">Title</div>
			<div class="col-10">
				 <input type="text" name="title" class="form-control">
			</div>
		</div>
		<div class="input-area row">
			<div class="col-2">Content</div>
			<div class="col-10">
				 <textarea id="summernote" name="content"></textarea>
			</div>
		</div>
		<div class="input-area row">
			<div class="col-2">Date</div>
			<div class="col-10">
				 <input type="text" name="date" class="form-control datepicker">
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
	if($("input[name=title]").val() == ""){
		alert("insert name");
		return;
	}else if($("input[name=date]").val() == ""){
		alert("insert date");
		return;
	}
	
	if(params.num == ""){
		$.ajax({
			type: "POST",
			url: '/manage/resume/record/create',
			data: params,
			success: function (result){
				if(result.result == "SUCCESS"){
					alert("success create work experience!");
					$("#createModal").modal('hide');
					window.location.href = "/manage/resume/record";
				}
			},
			error: function(e){
				console.log(e);
			}
		})
	}else{
		$.ajax({
			type: "POST",
			url: '/manage/resume/record/edit',
			data: params,
			success: function (result){
				if(result.result == "SUCCESS"){
					alert("success edit work experience!");
					$("#createModal").modal('hide');
					window.location.href = "/manage/resume/record";
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
		url: '/manage/resume/record/getWorkByNum',
		data: {"num" : selectNum},
		success: function (result){
			if(result.result == "SUCCESS"){
				var resultData = result.data;
				var resultDateStr = timestampToStringFormat(resultData.date);
				$("input[name=num]").val(resultData.num);
				$("input[name=title]").val(resultData.title);
				$("#summernote").summernote('code',resultData.content);
				$("input[name=date]").val(resultDateStr);
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
			url: '/manage/resume/record/delete',
			data: {"num" : selectNum},
			success: function (result){
				if(result.result == "SUCCESS"){
					alert("success delete category!");
					window.location.href = "/manage/resume/record";
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
$('#summernote').summernote({
      height: 100,                 
      minHeight: 100,            
      maxHeight: 100,            
      focus: true,                  
      lang: "ko-KR",					
      placeholder: '내용을 입력해주세요.',	
      toolbar: [
    	    // [groupName, [list of button]]
    	    ['style', ['bold', 'italic', 'underline', 'clear']],
    	    ['fontsize', ['fontsize']],
    	    ['color', ['color']],
    	    ['para', ['ul', 'ol', 'paragraph']],
    	    ['Insert', ['link']]
    	  ]
    });
$(".datepicker").datepicker({
	dateFormat: 'yy-mm-dd'
});
function timestampToStringFormat(timestamp) {
	function pad(n) { return n<10 ? "0"+n : n }
	d=new Date(timestamp);
	return d.getFullYear()+"-"+ 
	pad(d.getMonth()+1)+"-"+ 
	pad(d.getDate())
}

</script>
