<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>관리자 자주 묻는 질문</title>
        <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"> -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">

        <style>
          @font-face {
            font-family: "NPSfontBold";
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/NPSfontBold.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
            }

            html,body {
                font-family: "NPSfontBold", Helvetica, Arial, sans-serif;
                background-color: #fdf4e1;
                margin: 0;
                color: #9A4444;
            }

            .spbtn{
                float: right;
            }

            .panel-faq-container {
                margin-bottom: -16px;
            }
            .panel-faq-title {
                cursor: pointer;
            }
            .panel-faq-answer {
                height: 0;
                overflow: hidden;
                /* 변화가 시작되는 쪽에다가 transition 적용해준다 0 -> 300px 
                왜? 닫기 버튼을 누를 때 변화가 티남 */
                transition: all 1s;
            }
            .active {
                display: block;
                /* 높이를 정해줘야지만 transition이 적용됨 */
                height: 200px;
            }

            .modal-content {
                background-color: #fdf4e1; /* 모달 배경색 변경 */
                color: #9A4444;
                
            }
            
            



        </style>


        <script>
            window.onload = () => {
            // panel-faq-container
            const panelFaqContainer = document.querySelectorAll(".panel-faq-container"); // NodeList 객체
            
            // panel-faq-answer
            let panelFaqAnswer = document.querySelectorAll(".panel-faq-answer");

            // btn-all-close
            const btnAllClose = document.querySelector("#btn-all-close");
            
            // 반복문 순회하면서 해당 FAQ제목 클릭시 콜백 처리
            for( let i=0; i < panelFaqContainer.length; i++ ) {
                panelFaqContainer[i].addEventListener('click', function() { // 클릭시 처리할 일
                // FAQ 제목 클릭시 -> 본문이 보이게끔 -> active 클래스 추가
                panelFaqAnswer[i].classList.toggle('active');
                });
            };
            }
        </script>
    </head>


    <body>
        <div class="container">
            <h3 style="text-align: center; padding-top: 50px;">
            자주 묻는 질문 게시판 관리
            </h3>
            <br>
            <table style="color: #9A4444;" class="table table-bordered table-striped table-hover table-warning">
            <thead class="table-success text-center">
                <tr>
                    <th>번호</th>
                    <th>질문제목</th>
                </tr>
            </thead>
            <tbody class="text-center">
                <tr>
                    <td>1</td>
                    <td class="text-left" width="90%">
                    <div class="panel-faq-container">
                        <p class="panel-faq-title">Q. 캠핑장 이름은 무엇입니까?
                            <span class="spbtn">
                            <button type="button" class="btn btn-warning text-light">수정</button>&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-warning text-light">삭제</button>
                            </span>
                        </p>
                    <div class="panel-faq-answer">
                        <p>A. 아직 미정입니다.</p>
                        
                    </div>
                    </div>
                  </td>
                
                </tr>
                <tr>
                  <td>2</td>
                  <td class="text-left" width="90%">
                    <div class="panel-faq-container">
                        <p class="panel-faq-title">Q. 기준인원은 몇명입니까?
                            <span class="spbtn">
                                <button type="button" class="btn btn-warning text-light">수정</button>&nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-warning text-light">삭제</button>
                                </span>
                        </p>
                    <div class="panel-faq-answer">
                        <p>A. 최대 성인2명입니다.</p>
                        
                      </div>
                    </div>
                  </td>
                 </tr>

                <tr>
                  <td>3</td>
                  <td class="text-left" width="90%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">Q. 매너타임은 몇시부터 입니까?
                        <span class="spbtn">
                            <button type="button" class="btn btn-warning text-light">수정</button>&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-warning text-light">삭제</button>
                            </span>
                      </p>
                      <div class="panel-faq-answer">
                        <p>A. 밤 10시부터 아침 8시까지 매너타임입니다.</p>
                        
                      </div>
                    </div>
                  </td>
                </tr>

                <tr>
                  <td>4</td>
                  <td class="text-left" width="90%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">Q. 캠핑장 1박 가격은 얼마입니까?
                        <span class="spbtn">
                            <button type="button" class="btn btn-warning text-light">수정</button>&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-warning text-light">삭제</button>
                            </span>
                      </p>
                      <div class="panel-faq-answer">
                        <p>A. 글램핑은 1박에 12만원, 카라반은 6만원, 오토캠핑은 3만원입니다. </p>
                        
                      </div>
                    </div>
                  </td>
                </tr>


                <tr>
                  <td>5</td>
                  <td class="text-left" width="90%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">Q. 캠핑장 주소는 어디입까?
                        <span class="spbtn">
                            <button type="button" class="btn btn-warning text-light">수정</button>&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-warning text-light">삭제</button>
                            </span>
                      </p>
                      <div class="panel-faq-answer">
                        <p>A.대전광역시 중구 오류동 삼성아파트 옆입니다.</p>
                        
                      </div>
                    </div>
                  </td>
                
                </tr>
              
              </tbody>
            </table>
             <!-- 모달버튼 -->
             <button type="button" class="btn btn-warning text-light" data-bs-toggle="modal" data-bs-target="#myModal" style="float:right;">
                자주 묻는 질문 작성+
            </button>
            
                <!-- The Modal -->
                <div class="modal text-secondary" id="myModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                            자주 묻는 질문 작성
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
        
                            <!-- Modal body -->
                            <div class="modal-body">
                                질문 : <textarea cols="50" rows="1"></textarea>

                                답변 : <textarea cols="50" rows="15"></textarea>
                            </div><br>
                            
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <div class="col text-center">
                                    <button type="button" class="btn btn-warning text-light">FAQ 작성</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

        </div>

    </body>
</html>