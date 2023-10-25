<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 :: 이용후기 게시판 댓글 관리</title>
<!-- ** adminReview CSS ** -->
<style>
section #review {
	width: 80%;
	height: 100%;
	margin: 60px auto;
	overflow: auto;
}
#review * {
	color: #4d2222;
}
#review h1 {
	font-size: 35px;
	text-align: center;
	margin: 25px 0;
	color: #4d2222;
}
.rewwr {
	width: 90%;
	display: flex;
	justify-content: flex-end;
	margin: 30px 0;
}
#review input[type="button"] {
	padding: 7px 10px;
	background: #f1f0cb;
	border: none;
	border-radius: 10px;
}
#insertReview {
	font-size: 20px;
	padding: 15px !important;
	border-radius: 20px !important;
}
#review nav {
	margin: 40px 0;
}
.retab {
	border-top: 1px solid #4d2222;
	border-bottom: 1px solid #4d2222a4;
	width: 90%;
	margin: 0 auto;
	padding: 25px;
}
.retab #userinfo {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: center;
	margin: 0 25px;
}
#userinfo>div {
	display: flex;
	flex-direction: row;
}
p.wed {
	line-height: 30px;
}
#userinfo>div p {
	min-width: 200px;
}
#userBtns input {
	margin-right: 10px;
}
#userinfo span {
	margin-left: 10px;
	font-size: 14px;
	line-height: 16px;
}
#rvcont {
	display: flex;
	flex-direction: row;
	padding: 25px;
}
#txtcont {
	margin-right: 20px;
}
#txtcont, #imgcont, #replyCont {
	flex: 50%;
	border: 1px solid #d6d46d;
	padding: 25px;
	max-height: 600px;
	overflow: auto;
}
#reply p {
	display: inline-block;
	line-height: 30px;
}
#reply span {
	margin-top: 3px;
}
#review hr {
	height: 1px;
	background: #4d2222;
}
#review textarea {
	width: 100%;
	padding: 15px;
	resize: none;
	height: 15em;
	border: 2.5px solid #e4a47c;
	border-radius: 15px;
}
#rvcont {
	line-height: 20px;
}
#replyCont {
	margin: 15px 25px;
}
.rflex {
	display: flex;
	flex-direction: row;
    justify-content: space-between;
    margin: 0 20px;
}
#replyBtn input {
	margin-left: 10px;
}
</style>
</head>
<body>
	<section id="review">
		<!-- 댓글 작성 모달 -->
		<div class="modal text-secondary" id="insertRplModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					
					<div class="modal-header">
						<h2>댓글 작성</h2>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					
					<div class="modal-body">
						<textarea id="textarea"></textarea>
					</div>
					
					<!-- Modal footer -->
					<div class="modal-footer">
						<div class="col text-center">
							<input type="button" value="댓글 작성 완료" />
						</div>
					</div>
				</div>
			</div>
		</div>	
		
		<!-- 댓글 수정 모달 -->
		<div class="modal text-secondary" id="updateRplModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					
					<div class="modal-header">
						<h2>댓글 수정</h2>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					
					<div class="modal-body">
						<textarea id="textarea"></textarea>
					</div>
					
					<!-- Modal footer -->
					<div class="modal-footer">
						<div class="col text-center">
							<input type="button" value="댓글 수정 완료" />
						</div>
					</div>
				</div>
			</div>
		</div>
	
	
		<h1>이용후기 게시판 댓글 관리</h1>
		<!-- 이용후기 게시물 -->
		<div class="retab">
			<div id="userinfo">
				<div>
					<!-- span태그에 DB -->
					<p>
						아이디 | <span id="userID"></span>
					</p>
					<p>
						상품명 | <span id="rsvItem"></span>
					</p>
				</div>
				<div>
					<!-- 작성한 날짜 -->
					<p class="wed">
						작성날짜 | <span id="reviewDate"></span>
					</p>
					<!-- 댓글이 없을 때만 보이는 버튼 -->
					<div id="repInsBtn">
						<input type="button" value="댓글 작성" id="replyInsert" data-bs-toggle="modal" data-bs-target="#insertRplModal"> 
					</div>
				</div>
			</div>

			<div id="rvcont">
				<div id="txtcont"></div>
				<div id="imgcont"></div>
			</div>

			<!-- 운영자 댓글 부분 -->
			<div id="reply">
				<hr>
				<div class="rflex">
					<div>
						<span class="material-symbols-outlined">comment</span>
						<p>캠핑장의 댓글 !</p>
					</div>
					<div id="replyBtn">
						<input type="button" value="수정" id="replyUpdate"  data-bs-toggle="modal" data-bs-target="#updateRplModal">
						<input type="button" value="삭제" id="replyDelete">
					</div>
				</div>
				<div id="replyCont"></div>
			</div>
		</div>
		<!-- 페이징 -->
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#">이전</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link" href="#">다음</a></li>
			</ul>
		</nav>
	</section>
</body>
</html>