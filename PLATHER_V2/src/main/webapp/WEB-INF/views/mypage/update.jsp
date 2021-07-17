<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project PLATHER</title>
<link href="${rootPath}/static/css/update.css" rel="stylesheet" />
</head>
<body>
	<%@include file="/WEB-INF/views/include/include_header.jspf"%>
	<form class="update" method="POST" action="${rootPath}/mypage">
		<fieldset>
			<legend>필수 회원정보</legend>
			<div>
				<label>이름</label> <input value="장이름" />
			</div>
			<div>
				<label>이메일</label> <input type="email" value="S2@love.come"
					/>
			</div>
			<div>
				<label>닉네임</label> <input value="zl존키티" />
			</div>
			<div>
				<label>비밀번호</label> <input type="password" />
			</div>
			<div>
				<label>비밀번호 확인</label> <input type="password"  />
			</div>
		</fieldset>
		<div class="btn_box">
			<button class="btn_update">🖉수정하기</button>
		</div>
	</form>
	<%@include file="/WEB-INF/views/include/include_footer.jspf"%>
	
</body>
</html>