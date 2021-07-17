<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${rootPath}/static/css/mypage.css?ver=3" rel="stylesheet" />
<title>My Page</title>
<style>
div#table {
	
}

div.hidden {
	display: none;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/include/include_header.jspf"%>
	<div id="main_container">
		<h1 class="main_title">나의 활동</h1>
		<div class="sub_container">
			<div id="info_container">
				<img src="${rootPath}/static/images/profile.png" class="profile">
				<div class="nickname">
					<h5>${MEMBER.m_nickname}</h5>
					<div class="line"></div>
				</div>
				<p class="id">yub</p>
				<div class="buttons">
					<button class="modify">정보수정</button>

				</div>
			</div>
			<div id="right_container">
				<ul class="box_container">
					<li class="playlist box">
						<div class="b-title">내가 쓴 글</div>
						<div class="count">?건</div>
					</li>
					<li class="comment box">
						<div class="b-title">내가 쓴 댓글</div>
						<div class="count">?건</div>
					</li>
					<li class="heart box">
						<div class="b-title">찜한 PlayList</div>
						<div class="count">?건</div>
					</li>
				</ul>

				<div class="search_container">
					<form>
						<p>
							<input placeholder="search"> <img class="search_icon"
								src="${rootPath}/static/images/loupe.png" />
							<button class="btn_search">검색</button>
						</p>
						<div class="table"></div>
					</form>
				</div>
			</div>
		</div>
		<div id="table" class="hidden">
			<table>
				<thead>
					<tr>
						<th class="th_1"></th>
						<th class="th_2"></th>
						<th class="th_3"></th>
					</tr>
				</thead>
				<tbody class="tbody">

				</tbody>
			</table>
		</div>
	</div>
	<%@include file="/WEB-INF/views/include/include_footer.jspf"%>
</body>
<script>
	//변수
	const my_board= document.querySelector("li.playlist.box")
	const my_comment= document.querySelector("li.comment.box")
	const my_like= document.querySelector("li.heart.box")
	const m_id = document.querySelector("p.id").innerText
	const th_1 = document.querySelector("th.th_1")
	const th_2 = document.querySelector("th.th_2")
	const th_3 = document.querySelector("th.th_3")
	const div_table =document.querySelector("#table")
	const tbody = document.querySelector(".tbody")
	let boardList = []; 
	
	
//정보수정버튼을 click 하면 정보수정하는 페이지로 이동
// (member/update로 변경할 예정)
	document.querySelector("button.modify").addEventListener("click",(e)=>{
		location.href="${rootPath}/mypage/update"
	})
	// 날짜변환 function
	const dateFormat=(b_date)=>{
		let date = new Date()
		let year = date.getFullYear();
		let month = (1 + date.getMonth());
		month = month >= 10 ? month : '0' + month;
		let day = date.getDate();
		day = day >= 10 ? day : '0' + day;
		return year + '-' + month + '-' +day;
	}
	
	//게시글 테이블 생성 function
	const create_board_table=()=>{
		if(boardList.length>0){
		div_table.classList.remove("hidden")
		th_1.innerText="글코드"
		th_2.innerText="글제목"
		th_3.innerText="작성일"
		let html = "";
		for(let i = 0 ; i <boardList.length ; i++){
			date= boardList[i].b_date
			console.log(date)
			html += "<tr>"
				html += "<td>"+boardList[i].b_code + "</td>"
				html += "<td>"+boardList[i].b_title + "</td>"
				html += "<td>"+ dateFormat(date) + "</td>"
				html += "</tr>"
		}
		document.querySelector("tbody.tbody").innerHTML = html
	}
}

	// 내가 쓴 글을 찾아서 테이블로 보여주는 function
	const show_my_board=()=>{
		fetch("${rootPath}/mypage/myboard?m_id="+m_id)
		.then((response)=>{
		return response.json()
		}).then((data)=>{
		
			boardList = data.boardList
			console.log(data)
			console.log(boardList)
			// 테이블 생성
			create_board_table()
		})
	}
	// 내가 쓴 댓글을 찾아서 테이블을 만들어 보여주는 function
	const show_my_comment=()=>{
		fetch("${rootPath}/mypage/mycomment?m_id="+m_id).
		then((response)=>{
			return response.json()
		}).then((data)=>{
			console.log(data)
			if(data.length>0){
				div_table.classList.remove("hidden")
				th_1.innerText="게시글코드"
				th_2.innerText="댓글내용"
				th_3.innerText="작성일"
				let html = "";
				for(let i = 0 ; i < data.length ; i++){
					html += "<tr>"
						html += "<td>"+data[i].c_bcode + "</td>"
						html += "<td>"+data[i].c_comment + "</td>"
						html += "<td>"+ data[i].c_date+ "</td>"
						html += "</tr>"
				}
				document.querySelector("tbody.tbody").innerHTML = html
			}
			
		})
	}

	// "내가 쓴 글"이라는 박스를 클릭할 때 이벤트 
	my_board.addEventListener("click",()=>{
		//alert(m_id)
		show_my_board()
		
	})
	// "내가 쓴 댓글"이라는 박스를 클릭할 때 이벤트
	my_comment.addEventListener("click",()=>{
		show_my_comment()
	})
</script>
</html>