package Withdraw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javafx.scene.control.Alert;
import service.withdraw.withdrawService;


/**
 * Servlet implementation class wreqAccept
 */
@WebServlet("/wreqAccept")
public class wreqAccept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public wreqAccept() {
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String mid = request.getParameter("mid");
		PrintWriter out = response.getWriter();
		System.out.println(mid);
		withdrawService wsv = new withdrawService();
		try {
			int result = wsv.wreqAccept(mid);
			System.out.println("bbb");
			if(result == 1) {
				System.out.println("성공");
				out.println("승인되었습니다.");
//				RequestDispatcher disp1 = request.getRequestDispatcher("");
//				disp1.forward(request, response);
			} else { 
				RequestDispatcher disp2 = request.getRequestDispatcher("./manage/wManage2.jsp");
				disp2.forward(request, response);
				System.out.println("update 실패");
			}
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("오류발생");
//			request.setAttribute("errorMsg","SQL 또는 예기치 못한 장애발생으로 데이터 입력 실패함!!!");
//			RequestDispatcher disp2 = request.getRequestDispatcher("/member/error.jsp");
//			disp2.forward(request, response);
		}
		out.flush();
		out.close();
	}

}
