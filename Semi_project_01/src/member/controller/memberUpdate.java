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
 * Servlet implementation class memberUpdate
 */
@WebServlet("/memberUpdate")
public class memberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberUpdate() {
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
		PrintWriter out = response.getWriter();
		System.out.println("update 서블릿으로 들어옴");
		
		String mid = request.getParameter("mid");
		
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		String mphone = request.getParameter("mphone");
		String m_first_addr = request.getParameter("m_first_addr");
		String m_second_addr = request.getParameter("m_second_addr");
		String mbirthday = request.getParameter("mbirthday");
		String authority = request.getParameter("authority");
		String mgender = request.getParameter("mgender");

		memberVO mvo = new memberVO();
		mvo.setMid(mid);
		mvo.setMemail(memail);
		mvo.setMname(mname);
		mvo.setMphone(mphone);
		mvo.setM_first_addr(m_first_addr);
		mvo.setM_second_addr(m_second_addr);
		mvo.setMbirthday(Integer.parseInt(mbirthday));
		mvo.setAuthority(Integer.parseInt(authority));
		mvo.setMgender(Integer.parseInt(mgender));
		
		memberService msv = new memberService();
		try {
			int result = msv.memberUpdate(mvo, mid);
			System.out.println(mvo);
			
			if(result == 1) {
				System.out.println(result + "행 수정되었습니다");
				request.setAttribute("memberUpdate", "수정이 완료되었습니다" );
				RequestDispatcher disp2 = request.getRequestDispatcher("./memberList");
				disp2.forward(request, response);
				out.println("<script>alert('수정되었습니다 :)');</script>");	
			} else { 
				RequestDispatcher disp2 = request.getRequestDispatcher("./memberDetail");
				disp2.forward(request, response);
				out.println("<script>alert('수정하지 못했습니다 :(');</script>");
			}
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("오류발생");
	//		request.setAttribute("errorMsg","SQL 또는 예기치 못한 장애발생으로 데이터 입력 실패함!!!");
	//		RequestDispatcher disp2 = request.getRequestDispatcher("/member/error.jsp");
	//		disp2.forward(request, response);
		}
		out.flush();
		out.close();
	}

}
