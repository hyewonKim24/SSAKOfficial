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
 * Servlet implementation class memberIdSearch
 */
@WebServlet("/memberIdSearch.do")
public class memberIdSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberIdSearch() {
        super();
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
		// TODO Auto-generated method stub
		execute(request, response);
	}
	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		memberService msv = new memberService();
		String mname=request.getParameter("mname");
		String memail=request.getParameter("memail");
		if(mname==null || mname=="" || memail==null || memail=="") {
			request.setAttribute("id_search_error", "이름과 이메일 정보를 바르게 입력해주세요.");
			System.out.println("아이디 찾기 널인 경우");
			RequestDispatcher dis = request.getRequestDispatcher("./member/memberIdSearch.jsp");
			dis.forward(request, response);
		}else {
		
		try {
			memberVO m=msv.idSearch(mname, memail);
			if(m!=null) {
				request.setAttribute("id_search_mid", m.getMid());
				RequestDispatcher dis = request.getRequestDispatcher("./member/memberIdSearchEnd.jsp");
				dis.forward(request, response);
			}else {
				response.sendRedirect("./member/memberIdSearchError.jsp");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		}
		
		
		
	}
}
