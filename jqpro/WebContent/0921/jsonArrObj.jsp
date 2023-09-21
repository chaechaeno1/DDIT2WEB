<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//클라이언트 전송 시 데이터 받기


	// DB를 이용한 CRUD처리 한다.
	
	
	// CRUD 처리결과로 응답데이터를 생성한다 -json 배열객체
	// select * from member;
%>
[
	{
	"name" : "김은대",
	"id"   : "a001",
	"tel"  : "010-1255-3688",
	"addr" : "대전 중구 오류동",
	"email": "ked1234@ddit.or.kr"
	}
	
	,{
	"name" : "성춘향",
	"id"   : "b001",
	"tel"  : "010-1234-5667",
	"addr" : "대전 서구 둔산동",
	"email": "sch1234@ddit.or.kr"
	}
	
	,{
	"name" : "이쁜이",
	"id"   : "b002",
	"tel"  : "010-5473-6822",
	"addr" : "대전 중구 대흥동",
	"email": "lbl1234@ddit.or.kr"
	}
	
	,{
	"name" : "라일락",
	"id"   : "a002",
	"tel"  : "010-1347-6381",
	"addr" : "대전 유성구 상대동",
	"email": "rir1234@ddit.or.kr"
	}
	
	,{
	"name" : "백장미",
	"id"   : "a003",
	"tel"  : "010-6821-6579",
	"addr" : "대전 대덕구 도룡동",
	"email": "bjm1234@ddit.or.kr"
	}
	
	,{
	"name" : "이몽룡",
	"id"   : "b003",
	"tel"  : "010-4299-0946",
	"addr" : "대전 동구 부사동",
	"email": "lml1234@ddit.or.kr"
	}
	
]
