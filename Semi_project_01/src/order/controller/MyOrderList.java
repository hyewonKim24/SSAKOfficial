package order.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.memberVO;
import order.model.orderVO;
import service.cart.CartService;
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
		CartService csv = new CartService();
		Date now = new Date();
		SimpleDateFormat vans = new SimpleDateFormat("yyyyMMdd");
		String wdate = vans.format(now);
		
		//로그인 x
		memberVO mvo = (memberVO) request.getSession().getAttribute("member");
		if (mvo == null || mvo.equals("") || mvo.equals("null")) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('로그인을 해주세요.'); location.href='./member/memberLogin.jsp';</script>");
			writer.flush();
			writer.close();
		} else {
		String mid = mvo.getMid();
		try {
			int rs = csv.CartCount(mid);
			List<orderVO> myolist = osv.myOrderlist(mid);
			request.setAttribute("myolist", myolist);
			request.setAttribute("cartCount", rs);
			request.setAttribute("wdate", wdate);
			
			RequestDispatcher disp = request.getRequestDispatcher("./member/myOrderList.jsp");
			disp.forward(request, response);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	}

}
