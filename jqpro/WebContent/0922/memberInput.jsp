<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.mybatis.config.MyBatisUtil"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//클라이언트에서 전송 되는 값을 받는다 - id, pass
	String userId = request.getParameter("id");
	String userPass = request.getParameter("pass");
	
	//db에서 member테이블에서 id와 pass가 일치 하는 사람 검색
	SqlSession sql = MyBatisUtil.getSqlSession();
	
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("id", userId);
	map.put("pass", userPass);
	
	
	MemberVO vo = null;
	try{
		vo = sql.selectOne("member.selectById", map);
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		sql.commit(); //select는 commit은 안해줘도 됨. update,delete,insert는 반드시 커밋필요
		sql.close();
	}
	//결과값 vo를 가지고 json데이터를 생성
	if(vo!=null){

		
%>
{
	"sw" : "ok",
	"id" :   "<%= vo.getMem_id() %>",
	"name" : "<%= vo.getMem_name()%>",
	"mail" : "<%= vo.getMem_mail() %>",
	"hp" :   "<%= vo.getMem_hp() %>",
	"addr" : "<%= vo.getMem_add1() %>"
}


<%
	}else{
%>
	{
		"sw" : "No..."
	}


<%		
	}
%>