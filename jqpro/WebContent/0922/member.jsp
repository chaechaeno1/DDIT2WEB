<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.mybatis.config.MyBatisUtil"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//(1)
	//클라이언트 전송 시 데이터 받기 - id, pass - 현재는 받는 값 없음!!

	//(2)
	// DB를 이용한 CRUD처리 한다.
	// - MybatisUtil -> mybatis-config.xml 파일을 재료로 해서 
	//   Factory 생성 -> SqlSession을 생성
	// MybatisUtil에서 SqlSession을 얻어온다
	//SqlSession session = MyBatisUtil.getSqlSession();
	//이미 jsp에는 session은 내장 객체이므로 쓸 수 없음
	
	//변수 이름은 어떤게 와도 상관없음(예약어 및 내장객체명만 아니면됨)
	SqlSession sql = MyBatisUtil.getSqlSession();
	
	//(3)
	//SqlSession으로 mapper파일의 sql문을 실행한다. - 결과값을 얻는다.
	// select * from member;
	List<MemberVO> list = sql.selectList("member.selectMember");
	
	// CRUD 처리결과로 응답데이터를 생성한다 -json 배열객체

	%> 

[	
	<% 
		for(int i=0; i<list.size(); i++){
			MemberVO vo = list.get(i);
			if(i>0) out.print(","); 
	%>
				
			<%-- json obj --%>
			{
				"id" : "<%= vo.getMem_id() %>",
				"name" : "<%= vo.getMem_name()%>",
				"hp" : "<%= vo.getMem_hp() %>",
				"addr" : "<%= vo.getMem_add1() %> <%= vo.getMem_add2() %>",
				"email" : "<%= vo.getMem_mail() %>",	
				"pass" : "<%= vo.getMem_pass() %>"			
			}
		
	<%		
		}
	%>
	
] 	
	
	


	
	
	
	
	
	
	
	
	
	
	
	    