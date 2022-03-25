<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jquery script -->
<script src="/resources/js/jquery-3.5.1.min.js"></script>
<script src="/resources/js/jquery-ui-1.12.1.min.js"></script>
<script src="/resources/js/jquery.tmpl.min.js"></script>

<!-- bootstrap script -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<!-- prettify -->
<script src="/resources/js/prettify/prettify.js"></script>

<!-- for using summernote  -->
<script src="/resources/js/summernote/summernote-bs4.min.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
	<!-- github : heyanlong/summernote-ext-highlight -->
<script src="/resources/js/summernote/plugins/summernote-ext-highlight.js"></script>

<!-- timeline.js -->
<script src="/resources/js/timeline.min.js"></script>

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