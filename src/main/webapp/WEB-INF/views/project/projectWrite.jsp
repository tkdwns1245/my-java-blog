<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<div class="body-contents-wrapper">
	<form id="frm" enctype="multipart/form-data" method="POST" accept-charset="UTF-8">
	<div class="input-area row">
		<div class="col-2">project name</div>
		<div class="col-10">
			 <input type="text" name="project_name" class="form-control">
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">introduce</div>
		<div class="col-10">
			 <input type="text" name="introduce" class="form-control">
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">members</div>
		<div class="col-10">
			 <input type="number" name="members" class="form-control">
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">period</div>
		<div class="col-2">
			 <input type="text" name="from" class="form-control datepicker">
		</div>
		<div class="col-1" style="text-align:center">
			 <span> ~ </span>
		</div>
		<div class="col-2">
			 <input type="text" name="to" class="form-control datepicker">
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">skills</div>
		<div class="col-10">
			 <select type="select"  class="selectpicker" id="skills">
			 <option>Java</option>
			 <option>Php</option>
			 <option>Python</option>
			 <option>Node.js</option>
			 <option>Javascript</option>
			 <option>Android</option>
			 <option>Html</option>
			 <option>Css</option>
			 </select>
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2"></div>
		<div class="col-10" >
			<input type="hidden" name="skills[]" id="skillsList">
			<ul id="skills-area">
			</ul>
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">project img</div>
		<div class="col-3 custom-file" style="margin-left:15px;">
			 <input type="file" class="custom-file-input" name="project_img" id="project_img" multiple="multiple">
			 <label class="custom-file-label" for="project_img">Choose file</label>
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">project file</div>
		<div class="col-3 custom-file" style="margin-left:15px;">
			 <input type="file" class="custom-file-input" name="project_file" id="project_file" multiple="multiple">
			 <label class="custom-file-label" for="project_file">Choose file</label>
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">contents</div>
		<div class="col-10">
			 <textarea id="summernote" name="contents"></textarea>
		</div>
	</div>
	</form>
	<div style="margin-top:100px;">
		<a class="btn btn-danger" style="float:right; margin-left:10px;" id="cancel-btn">Cancel</a>
		<a class="btn btn-primary" style="float:right;" id="submit-btn">Submit</a>
	</div>
</div>
<script type="text/x-jquery-tmpl" id="skill-item">
	<li class="skill-item" style="margin-right:20px; float:left;">
		<span>\${name}</span>
		<a class="select-cancel" data-name="\${name}"><i class="fas fa-window-close"></i></a>
	</li>
</script>
<script>
$(document).ready(function () {
	var skillList=[];
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
			url : "/project/uploadSummernoteImageFile",
			contentType : false,
			enctype: 'multipart/form-data',
			processData : false,
			success : function(data) {
            	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage','\\resources\\project\\'+data.fileName);
			},
			error:function(request,status,error){
			    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	}
    $(".datepicker").datepicker({
    	dateFormat: 'yy-mm-dd'
    });
    $("#skills").on( "change", function() {
    	var skill;
    	var val = $(this).val();
    	if(skillList.indexOf(val) == -1){
    		skillList.push(val);
	    	skill = [{ name : val}];
			$("#skill-item").tmpl(skill).appendTo($("#skills-area"));
    	}else{
    		alert(val + " is aready checked");
    	}
   	});
    $(document).on("click",".select-cancel",function(){
    	var val = $(this).data("name");
    	var selectedIndex = skillList.indexOf(val);
    	$(this).parent().remove();
    	skillList.splice(selectedIndex,1);
    })
    
    $("#submit-btn").on("click",function(){
    	$('#skillsList').val(skillList);
    	var formData = new FormData(document.getElementById("frm"));
    	if($("input[name=project_name]").val() == ""){
    		alert("insert project name");
    		return;
    	}else if($("input[name=introduce]").val() == ""){
    		alert("insert introduce");
    		return;
    	}else if($("input[name=members]").val() == ""){
    		alert("insert members");
    		return;
    	}else if(isNaN($("input[name=members]").val())){
    		alert("members item is can only insert number");
    		return;
    	}else if($("input[name=from]").val() == ""){
    		alert("insert from date");
    		return;
    	}else if($("input[name=to]").val() == ""){
    		alert("insert to date");
    		return;
    	}else if($("input[name=contents]").val() == ""){
    		alert("insert contents");
    		return;
    	}
    	$.ajax({
    		type: "POST",
    		enctype: '/multipart/form-data',
    		url: '/project/writeProject',
    		data: formData,
    		processData: false,
    		contentType: false,
    		cache: false,
    		success: function (result){
    			console.log(result);
    			if(result.result == "SUCCESS"){
    				alert("success upload project!");
    				window.location.href = "/project/projectList";
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