package cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 * Servlet implementation class CartList
 */
@WebServlet("/CartList")
public class CartList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doProcess(request, response);
//	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartService cart = new CartService();
		memberVO mvo = (memberVO)request.getSession().getAttribute("member");
		
		if(mvo==null||mvo.equals("")||mvo.equals("null")) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('로그인을 해주세요.'); location.href='./member/memberLogin.jsp';</script>");
			writer.flush();
			writer.close();
		}else {
			String mid = mvo.getMid();
			System.out.println(mid);
			try {
				System.out.println(mid);
				List<CartListVO> cartlist = cart.cartList(mid);
				request.setAttribute("list", cartlist);
				System.out.println("노커스텀: "+cartlist);
				
				RequestDispatcher ds = request.getRequestDispatcher("./cart/cart.jsp");
				ds.forward(request, response);	
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
		
		
	}

}
