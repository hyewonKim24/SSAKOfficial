package order.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.memberVO;
import order.model.orderVO;
import service.order.orderService;

/**
 * Servlet implementation class MyOrderList
 */
@WebServlet("/MyOrderList.do")
public class MyOrderList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyOrderList() {
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
		
		orderService osv = new orderService();
		memberVO mvo = (memberVO)request.getSession().getAttribute("member");
		String mid= mvo.getMid();
		try {
			List<orderVO> myolist = osv.myOrderlist(mid);
			for(int i=0; i<myolist.size();i++) {
				
			}
			request.setAttribute("myolist", myolist);
			
			RequestDispatcher disp = request.getRequestDispatcher("./member/myOrderList.jsp");
			disp.forward(request, response);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
