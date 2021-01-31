package member.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.*;
import service.member.memberService;

/**
 * Servlet implementation class myPageUpdate
 */
@WebServlet("/myPageUpdate.do")
public class myPageUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public myPageUpdate() {
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
		
		String mpw=request.getParameter("mpw");
		String newpw=request.getParameter("newpw");
		String mphone=request.getParameter("mphone");
		String mzip_code=request.getParameter("mzip_code");
		String m_first_addr=request.getParameter("m_first_addr");
		String m_second_addr=request.getParameter("m_second_addr");
		int mbirthday=Integer.parseInt(request.getParameter("mbirthday"));
		
		if(mpw!=null && newpw!=null && mphone!=null && mzip_code!=null && m_first_addr!=null && m_second_addr!=null && mbirthday!=0) {
			memberVO newmvo= null;
		
			memberVO mvo =(memberVO) request.getSession().getAttribute("member");
			if(mvo.getMpw().equals(mpw))
			{
			//입력한 비밀번호랑 현재 비밀번호랑 동일한 경우 pw및 다양한 정보 업데이트 해줌.
			System.out.println("동일한지 확인");
			newmvo = new memberVO();
			newmvo.setMpw(newpw);
			newmvo.setMid(mvo.getMid());
			newmvo.setMphone(mphone);
			newmvo.setMzip_code(mzip_code);
			newmvo.setM_first_addr(m_first_addr);
			newmvo.setM_second_addr(m_second_addr);
			newmvo.setMbirthday(mbirthday);
			
			memberService msv = new memberService();
			try {
				int rs=msv.myPageUpdate(newmvo);
				System.out.println(rs+"행 변경됨");
				if(rs==1) {
					memberVO m=msv.loginMember(newmvo.getMid(), newmvo.getMpw());
					HttpSession session= request.getSession();
					session.setAttribute("member",m);
					//세션 다시 변경시킴
					request.setAttribute("pw_error", "변경되었습니다.");
					RequestDispatcher dis = request.getRequestDispatcher("./member/myPageList.jsp");
					dis.forward(request, response);
				}
				
			} catch (SQLException e) {
				System.out.println("sql문 오류발생_mypage_Update");
				e.printStackTrace();
			}
			
		}else {
			//입력한 현재 비밀번호랑 다른 경우 오류메세지 띄우고 다시 myPagelist로 이동
			request.setAttribute("pw_error", "현재 비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			RequestDispatcher dis = request.getRequestDispatcher("./member/myPageList.jsp");
			dis.forward(request, response);
		}
		}else {
			request.setAttribute("pw_error", "정보를 올바르게 입력하지 않았습니다. 다시 입력해주세요.");
			RequestDispatcher dis = request.getRequestDispatcher("./member/myPageList.jsp");
			dis.forward(request, response);
		}
		
		
		
		
	}
}
