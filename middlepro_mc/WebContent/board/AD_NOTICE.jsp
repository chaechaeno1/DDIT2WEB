<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>관리자 공지사항</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
                color: #9A4444 !important;
            }

            .panel-faq-container {
                margin-bottom: -16px;
                
            }
            
            body * {
                color: #9A4444 !important;
            }
            .pbtn{
                float: right;
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
            
            .modal-content {
                background-color: #fdf4e1; /* 모달 배경색 변경 */
                color: #9A4444;
                
            }

            div #flr {
                float: right;
            }

            .active {
                display: block;
                /* 높이를 정해줘야지만 transition이 적용됨 */
                height: auto;
                
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
                공지사항 게시판 관리
            </h3>
            <div id="flr">
                <input type="text" size=12 placeholder="검색">&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-warning text-light btn-sm" style="float:right">검색</button>
            </div>
            <br>
            <br>
            <table style="color: #9A4444;" class="table table-bordered table-striped table-hover table-warning">
                <thead class="table-success text-center">
                    <tr>
                        <th>번호</th>
                        <th>공지사항 제목</th>
                        <th>등록일</th>
                        <th>조회수</th>
                    </tr>
                </thead>

                <tbody class="text-center">
                <tr>
                    <td>1</td>
                    <td class="text-left" width="50%">
                        <div class="panel-faq-container">
                            <p class="panel-faq-title">다음주 태풍 상륙 예정임으로 휴장합니다.</p>
                            <div class="panel-faq-answer">
                                <p>일기예보 확인하시고 예약하시기 바랍니다.</p>
                                <p class="pbtn">
                                    <button type="button" class="btn btn-warning text-light">수정</button>&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-warning text-light">삭제</button>
                                </p>
                            </div>
                        </div>
                    </td>
                    <td>2032.01.01</td>
                    <td>84</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td class="text-left" width="50%">
                        <div class="panel-faq-container">
                            <p class="panel-faq-title">23년 동계장박캠퍼 모집합니다.</p>
                            <div class="panel-faq-answer">
                                <p>11월~24년3월까지 장박 캠퍼 모집합니다.</p>
                                <p>장박신청은 010-1234-5678로 문의해주세요.</p>
                                <p class="pbtn">
                                    <button type="button" class="btn btn-warning text-light">수정</button>&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-warning text-light">삭제</button>
                                </p>
                            </div>
                        </div>
                    </td>
                    <td>2032.02.02</td>
                    <td>114</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td class="text-left" width="50%">
                        <div class="panel-faq-container">
                            <p class="panel-faq-title">캠핑장 내 분리수거 철저히 해주세요.</p>
                            <div class="panel-faq-answer">
                            <p>지구가 아파합니다</p>
                            <p class="pbtn">
                                <button type="button" class="btn btn-warning text-light">수정</button>&nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-warning text-light">삭제</button>
                            </p>
                            </div>
                        </div>
                    </td>
                    <td>2032.03.03</td>
                    <td>98</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td class="text-left" width="50%">
                        <div class="panel-faq-container">
                            <p class="panel-faq-title">초대캠은 금지입니다.</p>
                            <div class="panel-faq-answer">
                                <p>적발시 즉각 퇴실조치입니다.</p>
                                <p class="pbtn">
                                    <button type="button" class="btn btn-warning text-light">수정</button>&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-warning text-light">삭제</button>
                                </p>
                            </div>
                        </div>
                    </td>
                    <td>2032.04.04</td>
                    <td>43</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td class="text-left" width="50%">
                        <div class="panel-faq-container">
                            <p class="panel-faq-title">노키즈존 캠핑장입니다.</p>
                            <div class="panel-faq-answer">
                                <p>14세 미만은 집으로 가주세요.</p>
                                <p class="pbtn">
                                    <button type="button" class="btn btn-warning text-light">수정</button>&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-warning text-light">삭제</button>
                                </p>
                            </div>
                        </div>
                    </td>
                    <td>2032.05.05</td>
                    <td>90</td>
                </tr>
            </tbody>
            </table>
            
            <!-- 모달버튼 -->
            <button type="button" class="btn btn-warning text-light" data-bs-toggle="modal" data-bs-target="#myModal" style="float:right;">
                공지사항 등록+
            </button>
            
                <!-- The Modal -->
                <div class="modal text-secondary" id="myModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                            공지사항 작성
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
        
                            <!-- Modal body -->
                            <div class="modal-body">
                                제목 : <textarea cols="50" rows="1"></textarea>

                                내용 : <textarea cols="50" rows="15"></textarea>
                            </div><br>
                            
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <div class="col text-center">
                                    <button type="button" class="btn btn-warning text-light">공지사항 작성하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>