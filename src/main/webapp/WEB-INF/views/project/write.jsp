<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<div class="body-contents-wrapper">
	<div class="input-area row">
		<div class="col-2">project name</div>
		<div class="col-10">
			 <input type="text" name="project_name" class="form-control" value="">
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">introduce</div>
		<div class="col-10">
			 <input type="text" name="introduce" class="form-control" value="">
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">members</div>
		<div class="col-10">
			 <input type="number" name="members" class="form-control" value="">
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">period</div>
		<div class="col-2">
			 <input type="text" name="from" class="form-control datepicker" value="">
		</div>
		<div class="col-1" style="text-align:center">
			 <span> ~ </span>
		</div>
		<div class="col-2">
			 <input type="text" name="to" class="form-control datepicker" value="">
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">skills</div>
		<div class="col-10">
			 <select type="select"  class="selectpicker" value="" id="skills">
			 <option>Java</option>
			 <option>Php</option>
			 <option>Python</option>
			 <option>Node.js</option>
			 <option>Javascript</option>
			 <option>Html</option>
			 <option>Css</option>
			 </select>
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2"></div>
		<div class="col-10" >
			<input type="hidden" name="skills">
			<ul id="skills-area">
			</ul>
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">project img</div>
		<div class="col-3 custom-file" style="margin-left:15px;">
			 <input type="file" class="custom-file-input" id="project_img">
			 <label class="custom-file-label" for="project_img">Choose file</label>
		</div>
	</div>
	<div class="input-area row">
		<div class="col-2">contents</div>
		<div class="col-10">
			 <textarea id="summernote" name="editordata"></textarea>
		</div>
	</div>
	<div style="margin-top:100px;">
		<a class="btn btn-danger" style="float:right; margin-left:10px;" id="cancel-btn">Cancel</a>
		<a class="btn btn-primary" style="float:right;" id="submit-btn">Submit</a>
	</div>
</div>
<script type="text/x-jquery-tmpl" id="skill-item">
	<li class="skill-item" style="margin-right:20px; float:left";>
		<span>\${name}</span>
		<a class="select-cancel" data-name="\${name}"><i class="fas fa-window-close"></i></a>
	</li>
</script>
<script>
$(document).ready(function () {
	var skillList=[];
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
        '50', '72']
    });
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
    	
    })
    $("#cancel-btn").on("click",function(){
    	history.go(-1);
    })
  });
</script>