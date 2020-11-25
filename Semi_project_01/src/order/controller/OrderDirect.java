package order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.model.CartListVO;
import member.model.memberVO;
import service.cart.CartService;
import service.member.memberService;
import service.order.orderService;

/**
 * Servlet implementation class OrderDirect
 */
@WebServlet("/OrderDirect")
public class OrderDirect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDirect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		orderService service = new orderService();
		CartListVO vo = new CartListVO();
		memberService msv = new memberService();
		memberVO mvo = (memberVO)request.getSession().getAttribute("member");
		
		
		//북커버 null오류 처리
		int dnoConf = 0;
		if (request.getParameter("dno") != null) {
			vo.setDno(Integer.parseInt(request.getParameter("dno")));
			dnoConf = Integer.parseInt(request.getParameter("dno"));
		} else {
			vo.setDno(0);
		}

		int oamount = Integer.parseInt(request.getParameter("oamount"));
		String bisbn = request.getParameter("bisbn");
		System.out.println("추가한애:"+oamount+" "+bisbn+" "+dnoConf);

		try {
				List<CartListVO> result = service.directOrderList(bisbn, dnoConf);
				request.setAttribute("list2", result);				
				request.setAttribute("dioamount", oamount);
				
				RequestDispatcher ds = request.getRequestDispatcher("./order/directOrder.jsp");
				ds.forward(request, response);
				
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
