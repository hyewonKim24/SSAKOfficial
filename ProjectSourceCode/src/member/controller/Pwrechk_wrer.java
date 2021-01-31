package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.*;

/**
 * Servlet implementation class Pwrechk_wrer
 */
@WebServlet("/Pwrechk_wrer.do")
public class Pwrechk_wrer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pwrechk_wrer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request,response);
	}

	
	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mid=request.getParameter("mid");
		String mpw=request.getParameter("mpw");
		
		memberVO mvo = (memberVO)request.getSession().getAttribute("member");
		System.out.println(mvo.getMid());
		
		// 비밀번호 재입력 아이디랑 비밀번호 제대로 입력했을 경우
		if(mid.equals(mvo.getMid()) && mpw.equals(mvo.getMpw())) {
			response.sendRedirect("./member/WrerWrite.jsp");
			//탈퇴 사유 입력페이지로 이동
		}else {
			request.setAttribute("pw_re_error", "아이디랑 비밀번호를 바르게 입력하지 않았습니다. ");
			RequestDispatcher dis = request.getRequestDispatcher("./member/WrerPwrechk.jsp");
			dis.forward(request, response);
		}
		
		
		
	}
}
