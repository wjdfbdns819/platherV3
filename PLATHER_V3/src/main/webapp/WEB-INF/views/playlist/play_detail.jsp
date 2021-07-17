<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project PLATHER</title>
<link href="${rootPath}/static/css/play_detail.css?ver=2021-06-12-011"
	rel="stylesheet" />
</head>
<body>
	<%@include file="/WEB-INF/views/include/include_header.jspf"%>
	<div class="content">
		<div class="play">
			<h1>플레이리스트</h1>
			<table class="detail">
				<tr class="data_code" data-code="${BOARD_DETAIL.b_code}">
					<th colspan="3">${BOARD_DETAIL.b_title}</th>
					<th><fmt:formatDate pattern="yyyy-MM-dd"
							value="${BOARD_DETAIL.b_date}" /></th>
				</tr>
				<tr>
					<td colspan="3">조회수 : ${BOARD_DETAIL.b_hit}</td>
					<td>${BOARD_DETAIL.b_id}</td>
				</tr>
				<tr>
					<td colspan="4">${BOARD_DETAIL.b_content}</td>
				</tr>
				<tr>
					<td>💗</td>
				</tr>
			</table>
			<div class="div_button">
				<button class="btn_back" type="button">뒤로가기</button>
				<button class="btn_modify" type="submit">수정</button>
				<button class="btn_delete" type="button">삭제</button>
			</div>

		</div>

		<div class="songs">
			<h1>노래 목록</h1>
			<table class="song">
				<c:forEach items="${BOARD_DETAIL.playList}" var="play">
				<tr>
				<th>${play.s_title}</th>
				<th>${play.s_singer}</th>
				</tr>
				</c:forEach>
			</table>
		</div>

		<%@include file="/WEB-INF/views/include/include_comment.jspf" %>

	</div>

	<%@include file="/WEB-INF/views/include/include_footer.jspf"%>
</body>
<script>
//변수
const btn_back = document.querySelector("button.btn_back")
const btn_modify=document.querySelector("button.btn_modify")
const btn_delete=document.querySelector("button.btn_delete")
let b_code = document.querySelector("tr.data_code").dataset.code

//
btn_back.addEventListener("click",()=>{
	location.href="${rootPath}/board"
})
btn_modify.addEventListener("click",()=>{
	//alert(b_code)
	location.href="${rootPath}/board/modify?b_code="+b_code
})
btn_delete.addEventListener("click",()=>{
	location.href="${rootPath}/board/delete?b_code="+b_code
})
</script>
</html>