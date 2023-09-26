<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//서블릿에서 저장한 결과 데이터 꺼내기
//request.setAttribute("mem", vo);의 name과 일치
	MemberVO vo = (MemberVO)request.getAttribute("mem");
	//결과 json object데이터 생성
	if (vo != null) {
%>
    {
        "sw"	: "ok",
        "id"	: "<%= vo.getMem_id() %>",
        "name"	: "<%= vo.getMem_name() %>",
        "hp"	: "<%= vo.getMem_hp() %>",
        "mail"	: "<%= vo.getMem_mail() %>",
        "addr"	: "<%= vo.getMem_add1() %>"
  	 }
<%
    }else{
 %>
 {
        "sw"	: "no"
  }
    	
 <%   	
    }
%>








