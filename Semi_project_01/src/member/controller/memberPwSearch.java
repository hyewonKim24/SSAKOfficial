package member.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.member.memberService;

/**
 * Servlet implementation class memberPwSearch
 */
@WebServlet("/memberPwSearch.do")
public class memberPwSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public memberPwSearch() {
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
		String memail=request.getParameter("memail");
		
		System.out.println(mid+memail);
		if (mid == null || mid == "" || memail == null || memail == "") {
			System.out.println("pw_search_null임");
			request.setAttribute("pw_Search_error", "아이디와 이메일을 바르게 입력해주세요.");
			RequestDispatcher dis = request.getRequestDispatcher("./member/memberPwSearch.jsp");
			dis.forward(request, response);
		} else {
			try {
				boolean a=msv.pwSearch(mid, memail);
				if(a){
					//아이디와 이메일이 존재하므로 메일을 보내는 servlet으로 이동시켜야함.
					System.out.println("pw찾기_이메일 확인완료");
					request.setAttribute("memail", memail);
					request.setAttribute("mid", mid);
					RequestDispatcher dis = request.getRequestDispatcher("/memberPwtmpSend.do");
					dis.forward(request, response);
					
				}else {
					request.setAttribute("pw_Search_error", "등록되지 않은 아이디와 이메일입니다.");
					RequestDispatcher dis = request.getRequestDispatcher("./member/memberPwSearch.jsp");
					dis.forward(request, response);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		

		}
	}
}
