package cart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.memberVO;
import service.cart.CartService;

/**
 * Servlet implementation class CartrDeleteOne
 */
@WebServlet("/CartDeleteOne.do")
public class CartDeleteOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartDeleteOne() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//로그인 x
		memberVO mvo = (memberVO) request.getSession().getAttribute("member");
		if (mvo == null || mvo.equals("") || mvo.equals("null")) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('로그인을 해주세요.'); location.href='./member/memberLogin.jsp';</script>");
			writer.flush();
			writer.close();
		} else {
			
		CartService cart = new CartService();
		int cno=Integer.parseInt(request.getParameter("cno"));
		//String btn_delete = request.getParameter("btn_delete");

		try {
			int result = cart.cartDeleteOne(cno);
			if(result==1) {
				response.sendRedirect("CartList.do");
				System.out.println("해당 상품 한건이 삭제되었습니다.");
			} else {
				System.out.println("해당 상품 삭제에 실패했습니다.");
			}
		} catch(Exception e) {
		e.printStackTrace();
		}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
