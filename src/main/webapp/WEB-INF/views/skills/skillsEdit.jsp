<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<div class="body-contents-wrapper">
	<form id="frm" enctype="multipart/form-data" method="POST" accept-charset="UTF-8">
	<input type="hidden" name="num" value="${skill.num}"/>
	<div class="input-area row">
		<div class="col-2">skill name</div>
		<div class="col-10">
			 <input type="text" name="skillName" class="form-control" value="${skill.skillName}">
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">summary</div>
		<div class="col-10">
			 <input type="text" name="summary" class="form-control" value="${skill.summary}">
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">skill icon</div>
		<div class="col-3 custom-file" style="margin-left:15px;">
			 <input type="file" class="custom-file-input" name="skill_icon" id="skill_icon" multiple="multiple" value="${skill.skillIcon}">
			 <label class="custom-file-label" for="skill_icon">Choose file</label>
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">contents</div>
		<div class="col-10">
			 <textarea id="summernote" name="contents">${skill.contents}</textarea>
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
      fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체',
        '굴림', '돋음체', '바탕체'],
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
		}
    });
    function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/skills/uploadSummernoteImageFile",
			contentType : false,
			enctype: 'multipart/form-data',
			processData : false,
			success : function(data) {
            	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage','\\resources\\skills\\'+data.fileName);
			},
			error:function(request,status,error){
			    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	}
    
    $("#submit-btn").on("click",function(){
    	var formData = new FormData(document.getElementById("frm"));
    	if($("input[name=skillName]").val() == ""){
    		alert("insert skill name");
    		return;
    	}else if($("input[name=summary]").val() == ""){
    		alert("insert summary");
    		return;
    	}else if($("input[name=contents]").val() == ""){
    		alert("insert contents");
    		return;
    	}
    	$.ajax({
    		type: "POST",
    		enctype: '/multipart/form-data',
    		url: '/skills/editSkills',
    		data: formData,
    		processData: false,
    		contentType: false,
    		cache: false,
    		success: function (result){
    			console.log(result);
    			if(result.result == "SUCCESS"){
    				alert("success edit skills!");
    				window.location.href = "/home";
    			}
    		},
    		error: function(e){
    			console.log(e);
    		}
    	})
    })
    $("#cancel-btn").on("click",function(){
    	history.go(-1);
    })
  });
</script>