<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jquery script -->
<script src="/resources/js/jquery-3.5.1.min.js"></script>
<script src="/resources/js/jquery-ui-1.12.1.min.js"></script>
<script src="/resources/js/jquery.tmpl.min.js"></script>

<!-- bootstrap script -->
<script src="/resources/js/bootstrap/bootstrap.min.js"></script>

<!-- for using summernote  -->
<script type="text/javascript" src="/resources/js/prettify/prettify.js"></script>
<script type="text/javascript" src="https://unpkg.com/@popperjs/core@2"></script>
<script src="/resources/js/summernote/summernote-lite.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<script src="/resources/js/summernote/summernote-ext-highlight.js"></script>

<!-- else -->
<script src="https://kit.fontawesome.com/adf1f846d3.js" crossorigin="anonymous"></script>


<script>
var ajaxfunction = function(url,type,data,success,error){
	 $.ajax({
		 dataType: "json",
         url: url,
         type: type,
         data: data,
         success: success,
         error: error
     });
}
</script>