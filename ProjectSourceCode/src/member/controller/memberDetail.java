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

import member.model.*;
import service.member.memberService;


/**
 * Servlet implementation class memberDetail
 */
@WebServlet("/memberDetail.do")
public class memberDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberDetail() {
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
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 x
		memberVO mvo = (memberVO) request.getSession().getAttribute("member");
		if (mvo == null || mvo.equals("") || mvo.equals("null")) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('로그인을 해주세요.'); location.href='./member/memberLogin.jsp';</script>");
			writer.flush();
			writer.close();
		} else {
		String mid = request.getParameter("mid");
		memberService msv = new memberService();
		
		try {
			memberVO mdetail = msv.memberDetail(mid);
			request.setAttribute("mdetail", mdetail);
			System.out.println("member :" + mdetail);
			RequestDispatcher disp = request.getRequestDispatcher("./manage/mManage2.jsp");
			disp.forward(request, response);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		}
		
	}


}
