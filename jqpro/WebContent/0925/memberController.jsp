<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

//클라이언트 요청시 전송 데이터 받기

//service객체 얻기
IMemberService service = MemberServiceImpl.getService();


//service메서드 호출 - 결과값 얻기 - List
List<MemberVO> list = service.selectMember();

//List결과로 json 객체 배열 형태의 응답결과를 생성한다.
//view 페이지로 이동 - viewSelect.jsp - list결과를 가지고
//CONTROLLER와 view페이지가 list결과를 공유 해야한다.
//request와 response객체가 공유되는 forward방식 

request.setAttribute("list", list); //name은 아무거나 써도됨

RequestDispatcher disp = request.getRequestDispatcher("viewSelect.jsp");

disp.forward(request, response);


//*************************************************
//forwoad 방식    : controller와 view페이지 사이에 request와 response 공유

//controller -> request.setAttribute(키, value);
//view -> response.getAtrribute(키);

//redirect 방식  : 공유하지 않음 
//*************************************************


%>



    