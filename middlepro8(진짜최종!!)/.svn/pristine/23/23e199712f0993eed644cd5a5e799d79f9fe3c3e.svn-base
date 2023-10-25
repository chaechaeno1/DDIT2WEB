<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용후기게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/basic.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reviewNew.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<script>
$(function(){
	$("#header").load("<%=request.getContextPath()%>/main/header.jsp");
	$("#footer").load("<%=request.getContextPath()%>/main/footer.jsp");
		
		$("#file").on('change',function(){
			  var fileName = $("#file").val();
			  $(".upload-name").val(fileName);
		});
});
</script>
</head>
<body>
	<header id="header"></header>
	
	<!-- 메뉴타이틀 & 배경 -->
	<div id="mapback">
		<h1>이용후기 게시판</h1>
		<img src="<%=request.getContextPath()%>/images/imageSlide02.jpg" alt="" />
	</div>

	<!-- 이용후기 게시판 -->
	<section id="review">

	<!-- 이용후기 작성 모달 -->
		<div class="modal text-secondary" id="myModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					
					<div class="modal-header">
						<h2>이용후기 쓰기</h2>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					
					<div class="modal-body">
						<textarea id="textarea" placeholder="이용후기를 남겨주세요 ^^*"></textarea>
						
						
						<div class="filebox">
						    <input class="upload-name" id="file_route" value="첨부파일" placeholder="첨부파일">
						    <label for="file">파일찾기</label> 
						    <input type="file" id="file" id="upload_file" accept="image/*">
						</div>

					</div>
					
					<!-- Modal footer -->
					<div class="modal-footer">
						<div class="col text-center">
							<input type="button" value="후기 작성하기" />
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 이용후기 수정 모달 -->
		<div class="modal text-secondary" id="updateRevModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					
					<div class="modal-header">
						<h2>이용후기 수정</h2>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					
					<div class="modal-body">
						<textarea id="textarea"></textarea>
						
						<div class="filebox">
						    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
						    <label for="ufile">파일찾기</label> 
						    <input type="file" id="ufile" accept="image/*">
						</div>

					</div>
					
					<!-- Modal footer -->
					<div class="modal-footer">
						<div class="col text-center">
							<input type="button" value="후기 수정 완료" />
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 이용후기 작성 버튼 -->
		<div class="rewwr">
			<input type="button" value="이용 후기 남기기" id="insertReview"
				data-bs-toggle="modal" data-bs-target="#myModal">
		</div>

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
					<!-- 작성자 본인이여야 보이는 버튼 -->
					<div id="userBtns">
						<input type="button" value="수정" id="updateReview" data-bs-toggle="modal" data-bs-target="#updateRevModal">  
						<input type="button" value="삭제" id="deleteReview">
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
				<span class="material-symbols-outlined">comment</span>
				<p>캠핑장의 댓글 !</p>
				<div id="replyCont"></div>
			</div>
		</div>

		<!-- 페이징 -->
		<nav>
		  <ul class="pagination justify-content-center">
			    <li class="page-item">
			      <a id="prev" class="page-link" href="#">prev</a>
			    </li>
			    <li class="page-item"><a class="page-link" href="#">1</a></li>
			    <li class="page-item"><a class="page-link" href="#">2</a></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item"><a class="page-link" href="#">4</a></li>
			    <li class="page-item"><a class="page-link" href="#">5</a></li>
			    <li class="page-item">
			      <a id="next" class="page-link " href="#">next</a>
			    </li>
		  </ul>
		</nav>

	</section>

	<footer id="footer"></footer>
</body>
</html>