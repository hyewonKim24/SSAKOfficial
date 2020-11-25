package member.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.*;
import service.member.memberService;

/**
 * Servlet implementation class memberRegister
 */
@WebServlet("/memberRegister.do")
public class memberRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public memberRegister() {
		super();
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
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String mphone = request.getParameter("mphone");
		String memail = request.getParameter("memail");
		String mzip_code = request.getParameter("mzip_code");
		String m_first_addr = request.getParameter("m_first_addr");
		String m_second_addr = request.getParameter("m_second_addr");

		String Smbirthday = request.getParameter("mbirthday");
		String Smgender = request.getParameter("mgender");

		if (mid == null || mid.equals("") || mpw == null || mpw.equals("") || mname == null || mname.equals("")
				|| mphone == null || mphone.equals("") || memail == null || memail.equals("") || mzip_code == null
				|| mzip_code.equals("") || m_first_addr == null || m_first_addr.equals("") || Smbirthday == null
				|| Smbirthday.equals("") || Smgender == null || Smgender.equals("")) {
			request.setAttribute("register_fail", "회원가입 정보를 제대로 입력해주세요.");
			RequestDispatcher dis = request.getRequestDispatcher("./memberRegister.jsp");
			dis.forward(request, response);

		} else {
			
			int mbirthday = Integer.parseInt(request.getParameter("mbirthday"));
			int mgender = Integer.parseInt(request.getParameter("mgender"));
			memberVO mvo = new memberVO();
			mvo.setMid(mid);
			mvo.setMpw(mpw);
			mvo.setMname(mname);
			mvo.setMemail(memail);
			mvo.setMphone(mphone);
			mvo.setMzip_code(mzip_code);
			mvo.setM_first_addr(m_first_addr);
			mvo.setM_second_addr(m_second_addr);
			mvo.setMgender(mgender);
			mvo.setMbirthday(mbirthday);

			memberService msv = new memberService();
			try {
				int rs = msv.registerMember(mvo);
				if (rs == 1) {
					System.out.println(rs + "행 추가되었습니다. register controller");
					request.setAttribute("register_ok", "회원가입이 완료되었습니다. 로그인을 해주세요");
					RequestDispatcher dis = request.getRequestDispatcher("./memberLogin.jsp");
					dis.forward(request, response);
				} else {
					request.setAttribute("register_fail", "회원가입에 실패했습니다. 다시 회원가입을 해주세요.");
					RequestDispatcher dis = request.getRequestDispatcher("./memberRegister.jsp");
					dis.forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				// 500 error페이지 만들어야함.
				// 404 error페이지도..
			}

		}
	}

}
