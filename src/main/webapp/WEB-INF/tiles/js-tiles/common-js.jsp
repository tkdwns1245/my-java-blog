<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/resources/js/jquery-3.5.1.min.js"></script>
<script src="/resources/js/jquery-ui-1.12.1.min.js"></script>
<script src="/resources/js/bootstrap/bootstrap.min.js"></script>
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