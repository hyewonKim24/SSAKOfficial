package cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.cart.CartService;
import service.event.EventService;

/**
 * Servlet implementation class CartUpdate
 */
@WebServlet("/CartUpdate.do")
public class CartUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartService cart = new CartService();
		int oamount=Integer.parseInt(request.getParameter("oamount"));
		int cno=Integer.parseInt(request.getParameter("chk2"));
		try {
			int result = cart.cartUpdate(cno, oamount);
			if(result==1) {
				response.sendRedirect("CartList.do");
				System.out.println("수량이 변경 되었습니다.");
				System.out.println(oamount);
				System.out.println(cno);
			} else {
				System.out.println("수량 변경 실패했습니다.");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
