package cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.cart.CartService;


/**
 * Servlet implementation class CartDelete
 */
@WebServlet("/CartDelete")
public class CartDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartService cart = new CartService();
//		int cno=Integer.parseInt(request.getParameter("cno"));
		String[] cno = request.getParameterValues("chk1"); 
//		int cno2 = Integer.parseInt(request.getParameter("chk1"));
//		int cno2 = Integer.parseInt(request.getParameter("cno"));
		String btn_delete = request.getParameter("btn_delete");
		
		switch(btn_delete) {
		case "선택삭제":
			try {
				int[] chks = new int[cno.length];
				for(int i=0; i<cno.length; i++) 
					chks[i] = Integer.parseInt(cno[i]);
				int result = cart.cartDelete(chks);
				if(result>=1) {
					response.sendRedirect("CartList");
					System.out.println("해당 상품들이 삭제되었습니다.");
				} else {
					System.out.println("해당 상품들 삭제 실패했습니다.");
				}					
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			break;
			
//		case "x":
//			try {
//				int[] chks = new int[cno.length];
//				for(int i=0; i<cno.length; i++) 
//					chks[i] = Integer.parseInt(cno[i]);
//				int result = cart.cartDelete(chks);
//				if(result>=1) {
//					response.sendRedirect("CartList");
//					System.out.println("해당 상품이 삭제되었습니다.");
//				} else {
//					System.out.println("해당 상품 삭제 실패했습니다.");
//				}					
//				
//			} catch(Exception e) {
//				e.printStackTrace();
//			}
//			break;
		}
//		case "&#8855":
//			try {
//				int result = cart.cartDeleteOne(cno2);
//				if(result==1) {
//					response.sendRedirect("CartList");
//					System.out.println("해당 상품 한건이 삭제되었습니다.");
//				} else {
//					System.out.println("해당 상품 삭제에 실패했습니다.");
//				}
//			} catch(Exception e) {
//			e.printStackTrace();
//			}
//			break;
//		}

	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
