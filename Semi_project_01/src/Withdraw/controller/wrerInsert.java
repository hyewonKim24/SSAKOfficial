package Withdraw.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Withdraw.model.*;
import member.model.*;
import service.withdraw.withdrawService;

/**
 * Servlet implementation class wrerInsert
 */
@WebServlet("/wrerInsert.do")
public class wrerInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public wrerInsert() {
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
		// TODO Auto-generated method stub
		execute(request,response);
	}

	
	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String wrer=request.getParameter("wrer");
		
		// 탈퇴사유 입력하지 않았을 때
		if(wrer==null||wrer=="") {
			request.setAttribute("wrer_error", "탈퇴사유를 올바르게 입력해주세요.");
			RequestDispatcher dis = request.getRequestDispatcher("./member/WrerWrite.jsp");
			dis.forward(request, response);
		}else {
			// 탈퇴사유 입력한 상태
			memberVO mvo = (memberVO)request.getSession().getAttribute("member");
			WithdrawVO wvo = new WithdrawVO();
			String mid=mvo.getMid();
			wvo.setMid(mid);
			wvo.setWrer(wrer);
			withdrawService wsv=new withdrawService();
			try {
				int rs=wsv.wrerInsert(wvo);
				if(rs==1) {
					System.out.println("탈퇴요청 처리됨.");
					HttpSession session = request.getSession(false);
					if (session != null) {
						session.invalidate(); // 세션 만료시킴
					}
					request.setAttribute("wrer_end", "탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.");
					RequestDispatcher dis = request.getRequestDispatcher("./ssakMain.do");
					dis.forward(request, response);
				}else {
					request.setAttribute("wrer_error", "탈퇴하는 도중 오류가 났습니다. 다시 시도해주세요");
					RequestDispatcher dis = request.getRequestDispatcher("./member/WrerWrite.jsp");
					dis.forward(request, response);
				}
				
				
			} catch (SQLException e) {
				request.setAttribute("wrer_error", "오류가 났습니다. 다시 시도해주세요");
				RequestDispatcher dis = request.getRequestDispatcher("./member/WrerWrite.jsp");
				dis.forward(request, response);
				e.printStackTrace();
			}
			
			
			
		}
		
		
		
	}

}
