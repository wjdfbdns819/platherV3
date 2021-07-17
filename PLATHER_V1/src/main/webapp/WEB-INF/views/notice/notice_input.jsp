<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@charset "UTF-8";

#main_container {
	padding: 50px;
	padding-top: 130px;
	line-height: 30px;
	width: 80%;
	margin: 0 auto;
	min-height: calc(100vh - 30px);
}

#main_container div {
	white-space: nowrap;
}

#main_container h2 {
	margin: 20px;
}

fieldset {
	padding: 10px;
}

label {
	display: inline-block;
	width: 20%;
	text-align: right;
	margin: 5px 30px 5px 0px;
	padding: 10px;
	white-space: nowrap;
}

input {
	width: 70%;
	padding: 8px;
	outline: 0;
}

button {
	background-color: #91c788;
	border: 0px;
	border-radius: 5px;
}

span.nickname {
	font-weight: 800;
}

textarea {
	width: 70%;
	margin-left: 4px;
	resize: none;
	overflow-y: scroll;
}

.list_buttons {
	text-align: right;
	padding: 20px;
	margin-right: 7%;
}

div.list_buttons button {
	padding: 5px 10px;
	margin-top: 10px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/include/include_header.jspf"%>
	<div id="main_container">
		<fieldset>
			<h2>공지사항 등록하기</h2>

			<div class="div_list_title">
				<label class="label_title">공지제목</label> <input
					class="content i_title" />
			</div>
			<div class="div_name">
				<label class="lable_name">작성자</label><span class="nickname">관리자[Lv.1]</span>
			</div>
			<div class="div_content">
				<label class="lable_content"></label>
				<textarea name="t_content" class="content" cols="50" rows="10"
					placeholder="내용을 입력하세요"></textarea>
			</div>
			<div class="list_buttons">
				<button class="btn-save">💾 저장</button>
				<button class="btn-reset" type="reset">↺ 다시작성</button>
			</div>
		</fieldset>
	</div>
	<%@include file="/WEB-INF/views/include/include_footer.jspf"%>
</body>
</html>