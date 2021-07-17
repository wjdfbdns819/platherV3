<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${rootPath}/static/css/play_list.css?ver=2021-06-15-001"
	rel="stylesheet" />

</head>
<body>
	<%@include file="/WEB-INF/views/include/include_header.jspf"%>
	<div class="content">
		<div class="play">
			<div class="title"><p>플레이리스트</p><button class="btn_add">&#43; 등록</button></div>
			<div class="select">
				<select>
					<option>조회순</option>
					<option>추천순</option>
				</select>
			</div>
			<table class="list">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
				<tr>
					<td>2</td>
					<td>배고플 때 들으면 더 배고픈 노래</td>
					<td>먹짱</td>
					<td>2021-06-12</td>
					<td>11</td>
				</tr>
				<tr>
					<td>1</td>
					<td>히스토리 psycho화자랑 레드벨벳 psycho화자에대해</td>
					<td>14년도특기생</td>
					<td>2021-06-12</td>
					<td>27</td>
				</tr>
			</table>
		</div>
		<div class="search">
		<form>
			<input/>
			<button>검색</button>
			</form>
		</div>
	</div>
	<%@include file="/WEB-INF/views/include/include_footer.jspf"%>
</body>
<script>
	document.querySelector("button.btn_add").addEventListener("click",(e)=>{
		location.href="${rootPath}/playlist/insert"
	})
	
</script>
</html>