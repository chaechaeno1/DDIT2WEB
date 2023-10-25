package kr.or.ddit.member.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.mybatis.config.MyBatisUtil;
import kr.or.ddit.vo.MemberVO;

@WebServlet("/memberPwFind.do")
public class MemberPwFind extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
        // 클라이언트 요청시 전송데이터 받기
        String userid = request.getParameter("mem_id");
        String usermail = request.getParameter("mem_mail");

        System.out.println("id============" + userid);
        System.out.println("usermail============" + usermail);

        MemberVO vo = new MemberVO();
        vo.setMem_id(userid);
        vo.setMem_mail(usermail);
        // service 객체 얻기
        IMemberService service = MemberServiceImpl.getInstance();

        String memPw = service.pwFind(vo); // 비밀번호 찾기

        // gson 사용해 결과값 담기
        Gson gson = new Gson();
        String jsonData = null;

        if (memPw != null) { // 비밀번호를 찾았을 때
            // 새로운 임시 비밀번호 생성
            String newPassword = rnamomPassword();

            // 데이터베이스에 임시 비밀번호 업데이트
            if (updateRandomPasswordB(response, userid, newPassword)) {
            	System.out.println("성공");
                // 임시 비밀번호 이메일로 전송
                sendEmail(usermail, newPassword);

                jsonData = gson.toJson("success"); // 성공적으로 메일을 전송했음을 클라이언트에게 알려줌
                
                	System.out.println(" 여기는 성공인가?여기타나?");
            } else {
                jsonData = gson.toJson("fail"); // 데이터베이스 업데이트 실패
                
                System.out.println("실패ㅐㅐㅐㅐㅐㅐㅐㅐ");
            }
        } else {
            jsonData = gson.toJson("fail"); // 비밀번호 찾기 실패
            System.out.println("실패ㅐㅐㅐㅐㅐㅐ");
        }

        response.getWriter().write(jsonData);
        response.flushBuffer();
    }
    
    private String rnamomPassword() {
        // 임시 비밀번호를 무작위로 생성하는 예시
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_";
        int passwordLength = 8; // 임시 비밀번호의 길이

        StringBuilder newPassword = new StringBuilder();

        for (int i = 0; i < passwordLength; i++) {
        	
            int index = (int) (Math.random() * characters.length());
            System.out.println("성공 : " + index);
            newPassword.append(characters.charAt(index));
        }

        return newPassword.toString();
    }

    private boolean updateRandomPasswordB(HttpServletResponse response, String userid, String newPassword) {
    	  SqlSession session = null;
    	    boolean updated = false;

    	    try {
    	        IMemberService service = MemberServiceImpl.getInstance();
    	        updated = service.updatePassword(userid, newPassword);

    	        // 세션 커밋
    	        session = MyBatisUtil.getSqlSession();
    	        session.update("member.updatePassword", new HashMap<String, String>() {{
    	            put("mem_id", userid);
    	            put("newPassword", newPassword);
    	            
    	            System.out.println("성공?실패?");
    	        }});
    	        session.commit();
    	    } catch (Exception e) {
    	        e.printStackTrace();

    	        // 업데이트 실패시
    	        updated = false;
    	    } finally {
    	        if (session != null) {
    	            session.close();
    	        }
    	    }
    	    return true;
    	  
    	}
    
    private void sendEmail(String to, String memPw) {
        // SMTP 서버 및 인증 정보 설정
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.naver.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // 세션 객체 생성
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("qnfspem@naver.com", "rkswl147");
            }
        });

        // 메일 내용 설정
        MimeMessage message = new MimeMessage(session);
        try {
            // 보낸 사람의 이름과 이메일 주소를 설정
            message.setFrom(new InternetAddress("qnfspem@naver.com", "슬기로운캠핑생활"));

            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            message.setSubject("고객님 요청하신 비밀번호입니다"); // 이메일 제목 설정

            // 메일 내용 설정 (비밀번호는 메일로 전달)
            String emailBody = "고객님 임시비밀번호는: " + memPw + "입니다.\n";
            emailBody += "로그인 후 보안 위험이 있으니 꼭 변경하시기 바랍니다.";
            message.setText(emailBody);

            // 메일 전송
            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
}