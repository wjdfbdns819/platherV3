<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLATHER MAIN</title>
<link href="${rootPath}/static/css/main_home.css?ver=2021-06-27-004"
	rel="stylesheet" />
<style>
article#bn1 {
	background: url("${rootPath}/static/images/summer_event.png") no-repeat;
}

article#bn2 {
	background: url("${rootPath}/static/images/bn_white.png") no-repeat;
}

article#bn3 {
	background: url("${rootPath}/static/images/신곡.png") no-repeat;
}
</style>
</head>
<body>
	<nav id="main_nav">
		<h1>PLATHER</h1>
		<div>
			<ul>
				<li><a href="${rootPath}/notice">공지사항</a></li>
				<li><a href="${rootPath}/playlist">플레이리스트</a></li>
				<li><a href="${rootPath}/mypage">마이페이지</a></li>
				<li><a href="#">로그아웃</a></li>
			</ul>
		</div>
	</nav>
	<section id="banners">
		<article id="bn1"></article>
		<article id="bn2">
			<div>
				<h2>공지사항</h2>
				<table>
					<tr>
						<th>제목</th>
						<th>작성일</th>
					</tr>
					<tr>
						<td>플레이리스트 공유 시 주의사항</td>
						<td>2021-06-10</td>
					</tr>
				</table>
			</div>
			<div>
				<h2>최근 플래더</h2>
				<table>
					<tr>
						<th>제목</th>
						<th>작성일</th>
					</tr>
					<tr>
						<td>*여름에 필청* 체감온도 -5도 플레이리스트</td>
						<td>2021-06-10</td>
					</tr>
				</table>
			</div>
		</article>
		<article id="bn3"></article>
	</section>
	<%@include file="/WEB-INF/views/include/include_footer.jspf"%>
</body>
</html>