package Withdraw.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Withdraw.model.*;
import service.withdraw.withdrawService;




/**
 * Servlet implementation class wreqDetail
 */
@WebServlet("/wreqDetail.do")
public class wreqDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public wreqDetail() {
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
		String mid = request.getParameter("mid");
		withdrawService wsv = new withdrawService();
		
		try {
			WithdrawVO wdetail = wsv.wreqDetail(mid);
			request.setAttribute("wdetail", wdetail);
			RequestDispatcher disp = request.getRequestDispatcher("./manage/wManage2.jsp");
			disp.forward(request, response);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
	}

}
