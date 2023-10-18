<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">


        <style>
            @font-face{
            font-family: 'NPSfontBold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/NPSfontBold.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
            }  
            
            html,body {
                padding: 10px;
                font-family: "NPSfontBold", Helvetica, Arial, sans-serif;
            }

            h1{
                text-align: center;
                color: #9A4444;
            }

            body{
                background-color: #fdf4e1;
                color: #9A4444;
            }

            .modal-content {
                background-color: #fdf4e1; /* 모달 배경색 변경 */
                color: #9A4444;
                
            }
            
            .rewwr{
                padding: 10px;
                float: right;
            }


            .retab{
                border: 3px solid #D6D46D;
                margin: 10px;
            }

            .rere{
                float: right;
                
            }

            table, tr, td{
                margin: 10px;
                padding: 10px;
                /* border: 1px solid red; */
            }

            table{
                width: 700px;
                table-layout: fixed;
                word-break: break-all;
                height: auto;
            }
            
            .adrev{
                padding: 10px;
            }
            
        </style>






    </head>

    <body>
        <h1>이용후기 게시판 관리</h1>
        
            <!-- The Modal -->
            <div class="modal text-secondary" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header">
                        댓글 쓰기
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
    
                        <!-- Modal body -->
                        <div class="modal-body">
                            <textarea cols="50" rows="2"></textarea>
                        </div><br>
                        
                        
                
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
                                <button type="button" class="btn btn-warning text-light">댓글 작성하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br><br>


        <div class="retab">
            <table>
                <tbody>
                <tr id="tabth">
                    <td>이용자 아이디</td>
                    <td colspan="2">예약했던 상품</td>
                    <td></td>
                    <td></td>
                    <td>날짜</td>
                </tr>
                <tr id="txim">
                    <td colspan="3">글쓰는곳</td>
                    <td colspan="3">사진올라오는곳</td>
                </tr>
                </tbody>
            </table>
            <hr>
            <div class="adrev">운영자 댓글
                <div class="rere">
                    <button type="button" class="btn btn-warning text-light">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-warning text-light">삭제</button>
                </div><br><br>
            </div>
        </div>
        <br>
        <div class="retab">
            <table>
                <tbody>
                <tr id="tabth">
                    <td>이용자 아이디</td>
                    <td colspan="2">예약했던 상품</td>
                    <td></td>
                    <td></td>
                    <td>날짜</td>
                </tr>
                <tr id="txim">
                    <td colspan="3">글</td>
                    <td colspan="3">사진</td>
                </tr>
                </tbody>
            </table>
            <hr>
            <div class="adrev">운영자 댓글
                <div class="rere">
                <button type="button" class="btn btn-warning text-light">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-warning text-light">삭제</button>
                </div><br><br>
            </div>
        </div>

        <div class="rewwr">
            <button type="button" class="btn btn-warning text-light" data-bs-toggle="modal" data-bs-target="#myModal" style="float:right;">
                댓글 작성하기 +
            </button>
            </div>




    </body>
</html>