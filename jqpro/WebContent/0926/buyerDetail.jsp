<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//서블릿에서 저장한 데이터 꺼내기
//request.setAttribute("vo", vo); 에 저장된 name 필요

BuyerVO vo = (BuyerVO)request.getAttribute("vo");
%>

{
	"b_id" 		: "<%= vo.getBuyer_id() %>",
	"b_lgu" 	: "<%= vo.getBuyer_lgu() %>",
	"b_mail" 	: "<%= vo.getBuyer_mail() %>",
	"b_name" 	: "<%= vo.getBuyer_name() %>",
	"b_bank" 	: "<%= vo.getBuyer_bank() %>",
	"b_bankname" : "<%= vo.getBuyer_bankname() %>",
	"b_bankno" 	: "<%= vo.getBuyer_bankno() %>",
	"b_zip" 	: "<%= vo.getBuyer_zip() %>",
	"b_add1" 	: "<%= vo.getBuyer_add1() %>",
	"b_add2" 	: "<%= vo.getBuyer_add2() %>"
}
