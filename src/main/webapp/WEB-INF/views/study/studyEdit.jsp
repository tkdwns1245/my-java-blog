<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="body-contents-wrapper" >
	<form id="frm" enctype="multipart/form-data" method="POST" accept-charset="UTF-8">
	<input type="hidden" name="num" value="${study.num}"/>
	<div class="input-area row">
		<div class="col-2">title</div>
		<div class="col-10">
			 <input type="text" name="title" class="form-control" value="${study.title}">
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">introduce</div>
		<div class="col-10">
			 <input type="text" name="introduce" class="form-control" value="${study.introduce}">
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">isShow</div>
		<div class="col-10">
			 <input type="checkbox" name="isShow" value="true" <c:if test="${study.isShow eq 'true'}" > checked</c:if>>
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">category</div>
		<div class="col-10">
			 <select type="select"  class="selectpicker" name="category" id="category" value="${study.category}">
			 <c:forEach var="category" items="${categoryList}" varStatus="status">
			 	<option <c:if test="${study.category == category.name}">selected</c:if>>${category.name}</option>
			 </c:forEach>
			 </select>
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">title img</div>
		<div class="col-3 custom-file" style="margin-left:15px;">
			 <input type="file" class="custom-file-input" name="title_img" id="title_img" multiple="multiple">
			 <label class="custom-file-label" for="title_img">Choose file</label>
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">contents</div>
		<div class="col-10">
			 <textarea id="summernote" name="contents"><c:out value="${study.contents}" /></textarea>
		</div>
	</div>
	</form>
	<div style="margin-top:100px;">
		<a class="btn btn-danger" style="float:right; margin-left:10px;" id="cancel-btn">Cancel</a>
		<a class="btn btn-primary" style="float:right;" id="submit-btn">Submit</a>
	</div>
</div>
<script>
$(document).ready(function () {
	/* prettyfy code styling function */
	PR.prettyPrint();
	$(".custom-file-input").on("change", function() {
		  var fileName = $(this).val().split("\\").pop();
		  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
		});
    $('#summernote').summernote({
      height: 500,                 
      minHeight: 500,            
      maxHeight: 500,            
      focus: true,                  
      lang: "ko-KR",					
      placeholder: '내용을 입력해주세요.',
      prettifyHtml: false,
      toolbar: [
    	    // [groupName, [list of button]]
    	    ['style', ['style','bold', 'italic', 'underline', 'clear']],
    	    ['font', ['strikethrough', 'superscript', 'subscript']],
    	    ['fontsize', ['fontsize']],
    	    ['color', ['color']],
    	    ['para', ['ul', 'ol', 'paragraph']],
    	    ["insert",["link","picture","video","hr"]],
    	    ['highlight', ['highlight']],
    	    ['height', ['height']],
    	    ['view', ['fullscreen', 'codeview', 'help']]
    	  ],
      fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36',
        '50', '72'],
      callbacks: {	//여기 부분이 이미지를 첨부하는 부분
			onImageUpload : function(files) {
				uploadSummernoteImageFile(files[0],this);
			},
			onPaste: function (e) {
				var clipboardData = e.originalEvent.clipboardData;
				if (clipboardData && clipboardData.items && clipboardData.items.length) {
					var item = clipboardData.items[0];
					if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
						e.preventDefault();
					}
				}
			}
		},
    })
    PR.prettyPrint();  
    function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/study/uploadSummernoteImageFile",
			contentType : false,
			enctype: 'multipart/form-data',
			processData : false,
			success : function(data) {
            	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage','\\resources\\study\\'+data.fileName);
			},
			error:function(request,status,error){
			    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	}
    $("#submit-btn").on("click",function(){
    	var formData = new FormData(document.getElementById("frm"));
    	if($("input[name=title]").val() == ""){
    		alert("insert title");
    		return;
    	}else if($("input[name=introduce]").val() == ""){
    		alert("insert introduce");
    		return;
    	}else if($("input[name=contents]").val() == ""){
    		alert("insert contents");
    		return;
    	}
    	$.ajax({
    		type: "POST",
    		enctype: '/multipart/form-data',
    		url: '/study/editStudy',
    		data: formData,
    		processData: false,
    		contentType: false,
    		cache: false,
    		success: function (result){
    			if(result.result == "SUCCESS"){
    				alert("success edit article!");
    				window.location.href = "/study/studyList";
    			}
    		},
    		error:function(response,status,error){
    			if(response.status == 900){
    	        	alert("finded illegal words!");
    			}
   	       }
    	})
    })
    $("#cancel-btn").on("click",function(){
    	history.go(-1);
    })
  });
</script>