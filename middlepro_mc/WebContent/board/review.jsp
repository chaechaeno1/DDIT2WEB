<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용후기게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/review.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/basic.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/infoPage.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>




<script>



$(function(){
	$("#header").load("<%=request.getContextPath()%>/main/header.jsp");
	$("#footer").load("<%=request.getContextPath()%>/main/footer.jsp");
	})
	
	
	

	
	
	
</script>

<style>
            tr, td{
                margin: 10px;
                padding: 10px;
          		vertical-align : top;
          		
            }

            table{
           		text-align : center;
                width: 90%;
                margin : 20px auto;
                word-break: break-all;
                height: auto;
                
            }
            
            .modal-content {
                padding: 20px;
                
            }
            
            h2{
            font-size: 20px;
            }
         
            
            #textarea{
             width : 100%;
             height : 60%;
             
            }
            
            .modal-body {
             width:100%;
            }
            
            .modifydeleteBtn{
            	display: inline-block;
            	align-items: flex-end;
            }
            #abc{
				text-align: right;          
            }
            
            #img{
            	text-align: right;
            }
            
            
</style>



</head>


<body>
	<header id="header"></header>
	<section id="review">

  <h1 style="text-align: center; font-size:45px;">이용후기 게시판</h1>
  <br><br><br>
        <!-- 모달버튼 -->
        <div class="rewwr">
        <button type="button" class="btn btn-warning text-light" data-bs-toggle="modal" data-bs-target="#myModal" style="float:right;">
            이용 후기 남기기
        </button>
        </div>
            <!-- The Modal -->
            <div class="modal text-secondary" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header">
                        <h2>
                        이용후기 쓰기</h2>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
    
                        <!-- Modal body -->
                        <div class="modal-body">
                            <textarea id="textarea" rows="20" style= "resize: none;">크기조절 왜케어려움.dfdgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdf..</textarea>
                        </div><br>
                        
                        
                        <input type="text" id="file_route" disabled="disabled">
                        <label for="upload_file"  class="btn btn-warning text-light btn-sm">사진추가+</label>
                        <input type="file" id="upload_file" accept="image/*" required=true style="position:absolute; clip:rect(0, 0, 0, 0);">
                
                
                
                        <script>
                        const reader = new FileReader();
                
                        reader.onload = (readerEvent) => {
                            document.querySelector("#img_section").setAttribute("src", readerEvent.target.result);
                        };
                
                        document.querySelector("#upload_file").addEventListener("change", (changeEvent) => {
                
                            const imgFile = changeEvent.target.files[0];
                            reader.readAsDataURL(imgFile);
                
                            const fileName = document.getElementById("file_route");
                            fileName.value = imgFile.name;
                            //파일 이름을 띄워줌
                        })
                        </script>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <div class="col text-center">
                                <button type="button" class="btn btn-warning text-light" id="rsend">후기 작성하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br><br>
<br>

        <div class="retab">
            <table>
                <tbody>
                <tr>
                    <td>zzangumin</td>
                    <td colspan="2">오토캠핑 A-10 사이</td>   
                    <td>작성날짜 : 2023.11.11</td>               
                    <td><div id="abc"><button type="button" class="btn btn-warning text-light modifydeleteBtn">삭제</button>&nbsp;
                    <button type="button" class="btn btn-warning text-light modifydeleteBtn">수정</button>&nbsp;</div></td>
                    
                </tr>
                <tr>
                    <td colspan="3">좋은 캠핑장 입니다~ 잘 쉬다가 갑니다!</td>
                    <td colspan="3"><div id="img"><img src="../images/camp01.jpg" width="600" height="400"></div></td>
                </tr>
               
                </tbody>
            </table>
            <hr>
           	
            <div class="adrev">운영자 : 소중한 이용 후기 감사합니다! 또 찾아주세요.</div>
        </div>
        <br>
        
        
        
       
        <div class="retab">
            <table>
                <tbody>
                <tr>
                    <td>zzangumin</td>
                    <td colspan="2">오토캠핑 A-10 사이</td>   
                    <td>작성날짜 : 2023.11.11</td>               
                    <td><div id="abc"><button type="button" class="btn btn-warning text-light modifydeleteBtn">삭제</button>&nbsp;
                    <button type="button" class="btn btn-warning text-light modifydeleteBtn">수정</button>&nbsp;</div></td>
                    
                </tr>
                <tr>
                    <td colspan="3">좋은 캠핑장 입니다~ 잘 쉬다가 갑니다!</td>
                    <td colspan="3"><div id="img"><img src="../images/camp01.jpg" width="600" height="400"></div></td>
                </tr>
               
                </tbody>
            </table>
            <hr>
           	
            <div class="adrev">운영자 : 소중한 이용 후기 감사합니다! 또 찾아주세요.</div>
        </div>
        <br>
        
        
 
        
		
		<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="#">이전</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">4</a></li>
    <li class="page-item"><a class="page-link" href="#">5</a></li>
    <li class="page-item">
      <a class="page-link" href="#">다음</a>
    </li>
  </ul>
</nav>
		

	</section>
	<footer id="footer"></footer>
</body>
</html>