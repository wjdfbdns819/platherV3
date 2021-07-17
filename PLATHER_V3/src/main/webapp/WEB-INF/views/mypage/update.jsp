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
	<form class="update" method="POST">
		<fieldset>
			<legend>필수 회원정보</legend>
			<div>
				<label>이름</label> <input name="m_name" id="m_name"
					value="${MB_DETAIL.m_name}" />
			</div>
			<div>
				<label>ID</label> <input name="m_id" id="m_id" type="email"
					value="${MB_DETAIL.m_id}" />
			</div>
			<div>
				<label>닉네임</label> <input name="m_nickname" id="m_nickname"
					value="${MB_DETAIL.m_nickname}" />
			</div>
			<div>
				<label>비밀번호</label> <input name="m_pw" id="m_pw"
					value="${MB_DETAIL.m_pw}" type="password" />
			</div>
			<div>
				<label>비밀번호 확인</label> <input type="password" />
			</div>
		</fieldset>
		<div class="btn_box">
			<button class="btn_update">🖉수정하기</button>
		</div>
	</form>
	<%@include file="/WEB-INF/views/include/include_footer.jspf"%>

</body>
</html>