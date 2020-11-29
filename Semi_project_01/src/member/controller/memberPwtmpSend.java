package member.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Random;

import java.util.Properties;

import java.io.IOException;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import service.member.memberService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class memberPwtmpSend
 */
@WebServlet("/memberPwtmpSend.do")
public class memberPwtmpSend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberPwtmpSend() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	
	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//기존에 받아온 이메일을 string으로 받음.
		String memail=(String)request.getAttribute("memail");


		// mail server 설정
		String host = "smtp.naver.com";
		String user = "jjanghyewon@naver.com"; // 자신의 네이버 계정
		String password = "gpdnjs24";// 자신의 네이버 패스워드

		// 메일 받을 주소
		/* String to_email = m.getEmail(); */
		String to_email = memail;

		// SMTP 서버 정보를 설정한다.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");

		// 임시 비밀번호 생성키
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		String tempPw = temp.toString();
		System.out.println(tempPw);
		
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		//임시 비밀번호 update로 비밀번호 변경시키기
		memberService msv = new memberService();
		String mid=(String)request.getAttribute("mid");
		try {
			System.out.println(mid);
			int rs=msv.tmpPwUpdate(mid, tempPw);
			System.out.println(rs+"개의 비밀번호 변경, 임시비밀번호:"+tempPw);
			
			if(rs==1) {
				// 비밀번호가 업데이트 되고나서 email 전송
				try {
					MimeMessage msg = new MimeMessage(session);
					msg.setFrom(new InternetAddress(user, "SSAK"));
					msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

					// 메일 제목
					msg.setSubject("안녕하세요  SSAK의 임시 비밀번호입니다..");
					// 메일 내용
					msg.setText("임시 비밀번호는 :" + temp+"입니다.");

					Transport.send(msg);
					System.out.println("이메일 전송");
					
					request.setAttribute("login_error", "임시비밀번호가 전송되었습니다. 메일 확인 후 로그인해주세요.");
					RequestDispatcher dis = request.getRequestDispatcher("./member/memberLogin.jsp");
					dis.forward(request, response);

				} catch (Exception e) {
					e.printStackTrace();// TODO: handle exception
				}
				
			}else {
				request.setAttribute("pw_Search_error", "에러가 발생했습니다. 다시 시도해주세요");
				RequestDispatcher dis = request.getRequestDispatcher("./member/memberPwSearch.jsp");
				dis.forward(request, response);
				
			}
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		HttpSession saveKey = request.getSession();
		saveKey.setAttribute("tempPw", tempPw);
		
	}
}
