<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SSJ's Place</title>
<tiles:insertAttribute name="css" />
<link href="/resources/css/login.css" rel="stylesheet" />
<tiles:insertAttribute name="js" />
</head>
<body>
  <div class="login">
  <h1>Login</h1>
    <form action="/login_check" method="post">
   		<c:if test="${param.error!=null}">
			<p> error : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/> </p>
		</c:if>
      <input type="text" name="id" placeholder="id" required="required" />
        <input type="password" name="pass" placeholder="password" required="required" />
        <button type="submit" class="btn btn-primary btn-block btn-large">login</button>
    </form>
</div>
</body>
</html>
<script>
var loginCheck = "true";
loginCheck = '${loginCheck}';
if(loginCheck == "false")
	alert("로그인에 실패했습니다.");
$("#login-btn").on("click",function(){
	var id = $("#id");
	var pass = $("#pass");
	//유효성 체크
	console.log(loginForm);
	var idRegExp = /^[a-zA-z0-9]{4,12}$/;
	var passRegExp = /^[a-zA-z0-9]{4,12}$/;
    if (id.val() == ""){
    	alert("아이디를 입력해주세요.");
    	return;
    }else if(!idRegExp.test(id.val())){
    	alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
    	id.val("");
    	id.focus();
    	return;
    }else if(pass.val() == ""){
    	alert("비밀번호를 입력해주세요.");
    	return;
    }else if (!passRegExp.test(pass.val())) {
        alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
        pass.val("");
        pass.focus();
        return;
    }
    //로그인 submit
    loginForm.submit();
	
})
</script>