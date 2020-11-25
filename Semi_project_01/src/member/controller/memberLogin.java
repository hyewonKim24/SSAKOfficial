package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.json.simple.JSONObject;

import com.oracle.jrockit.jfr.RequestableEvent;

import member.model.*;
import service.member.memberService;

/**
 * Servlet implementation class memberLogin
 */
@WebServlet("/memberLogin.do")
public class memberLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public memberLogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);

	}

	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		memberService msv = new memberService();
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		PrintWriter out = response.getWriter();
		
		String login_keep = request.getParameter("login_keep");

		if (mid == null || mid == "" || mpw == null || mpw == "") {
			request.setAttribute("login_error", "로그인 정보를 바르게 입력해주세요.");
			System.out.println("로그인이 널인 경우");
			RequestDispatcher dis = request.getRequestDispatcher("./member/memberLogin.jsp");
			dis.forward(request, response);
		} else {

			try {
				// memberVO Login_type int형이 0인 경우 : id자체가 존재하지 않음.
				// memberVO Login_type int형이 1인 경우 : id가 존재하지만, id와 pw가 일치하지 않음.
				// memberVO Login_type int형이 2인 경우 : id와 pw가 일치함 => 로그인 시킴.
				// memberVO Login_type int형이 3인 경우 : 탈퇴한 회원 => 로그인 불가능.
				
				memberVO m = msv.loginMember(mid, mpw);
				if (m != null) {
					if (m.getLogin_type() == 0) {
						//아이디가 존재하지 않는 경우.
						request.setAttribute("login_error", "존재하지 않는 아이디입니다.");
						RequestDispatcher dis = request.getRequestDispatcher("./member/memberLogin.jsp");
						dis.forward(request, response);
					} else if (m.getLogin_type() == 1) {
						//비밀번호 틀린 경우
						request.setAttribute("login_error", "아이디와 비밀번호가 올바르지 않습니다.");
						RequestDispatcher dis = request.getRequestDispatcher("./member/memberLogin.jsp");
						dis.forward(request, response);
					} else if(m.getLogin_type()==2){
						
						HttpSession session = request.getSession();
						session.setAttribute("member", m);
						RequestDispatcher dis = request.getRequestDispatcher("./ssakMain.do");
						dis.forward(request, response);
					}else if(m.getLogin_type()==3){
						// 탈퇴한 회원 로그인 안됨
						request.setAttribute("login_error", "탈퇴한 회원은 로그인 하실 수 없습니다.");
						RequestDispatcher dis = request.getRequestDispatcher("./member/memberLogin.jsp");
						dis.forward(request, response);
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			out.flush();
			out.close();
		}
	}
}
