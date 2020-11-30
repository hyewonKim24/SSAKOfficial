package order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.memberVO;
import order.model.NewOrderVO;
import order.model.orderVO;
import service.cart.CartService;
import service.member.memberService;
import service.order.orderService;

/**
 * Servlet implementation class OrderInsert
 */
@WebServlet("/OrderInsert.do")
public class OrderInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderInsert() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		orderService order = new orderService();
		CartService cart = new CartService();
		orderVO vo = new orderVO();
		NewOrderVO vo2 = new NewOrderVO();
		memberVO mvo = (memberVO) request.getSession().getAttribute("member");
		
		System.out.println(mvo.getMid());
		vo.setMid(mvo.getMid());
		vo.setOtotalprice(Integer.parseInt(request.getParameter("ototalprice")));
		vo.setOsalesprice(Integer.parseInt(request.getParameter("osalesprice")));
		vo.setOname(request.getParameter("mname"));
		vo.setOphone(request.getParameter("mphone"));
		vo.setOaddr1(request.getParameter("maddress"));
		vo.setOaddr2(request.getParameter("maddress2"));
		vo.setOaddr3(request.getParameter("maddress3"));
		vo.setOmemo(request.getParameter("mtext"));
		vo.setOpay(request.getParameter("payment"));
		vo.setOtotalamount(Integer.parseInt(request.getParameter("ototalamount")));

//		List<NewOrderVO> orderlist = new ArrayList<NewOrderVO>();
//		for(int i=0; i<i++;)
//		vo2.setDno(Integer.parseInt(request.getParameter("dno"+i)));
//		vo2.setBisbn(request.getParameter("bisbn"+i));
//		vo2.setOamount(Integer.parseInt(request.getParameter("oamount")));
//		orderlist.add(vo2);
//		System.out.println(request.getParameter("bisbn")); 
//		for(int i=0; i<orderlist.size(); i++) {
//			System.out.println("리스트"+orderlist.get(i).getBisbn());
//		}
//		System.out.println(orderlist);
//		System.out.println("테스트");

		String[] dno = request.getParameterValues("dno");
		String[] bisbn = request.getParameterValues("bisbn");
		String[] oamount = request.getParameterValues("oamount");

		try {

			//혹시모를 북커버 널 오류 처리...
			int[] dnos = new int[bisbn.length];
			if(dno==null) {
				for(int i=0; i<bisbn.length; i++) {
					dnos[i] = 0;
				}
			} else {
				for (int i = 0; i < dno.length; i++) {
					if(dno[i]==null) {
						dnos[i]=0;
					} else {
						dnos[i] = Integer.parseInt(dno[i]);
					}
				}				
			}

			// ★neworder 인서트
			int[] oamounts = new int[oamount.length];
			for (int i = 0; i < oamount.length; i++) {
				oamounts[i] = Integer.parseInt(oamount[i]);
			}

			int result = order.orderInsert(vo, dnos, bisbn, oamounts);
			if (result >= 1) {
				System.out.println("주문이 완료되었습니다");
			} else {
				System.out.println("주문 실패");
			}
			
			for(int i=0; i<bisbn.length; i++) {
				System.out.println("빠라빠:" + dnos[i]);
				System.out.println("오마운트:" + oamounts[i]);
				System.out.println("비스비:" + bisbn[i]);
			}

//			for(int i=0; i<orderlist.size(); i++)
//			System.out.println(orderlist.get(i).getBisbn());
//			int result3 = order.orderInsert2(dnos, bisbn, oamounts);
//			if (result3 >= 1) {
//				System.out.println("neworder2 인서트 완료");
//			} else {
//				System.out.println("neworder2 인서트 실패");
//			}

				//★카트비우기
				if (request.getParameter("chk1") != null && request.getParameter("chk1")!="") {
					String[] cno = request.getParameterValues("chk1"); 
					int[] chks = new int[cno.length];
					for(int i=0; i<cno.length; i++) {
						chks[i] = Integer.parseInt(cno[i]);
					}
					int result2 = cart.cartDelete(chks);
					if(result2>=1) {
						System.out.println("해당 상품들이 삭제되었습니다.");
					} else {
						System.out.println("해당 상품들 삭제 실패했습니다.");
					}	
				}

			response.sendRedirect("./order/order_success.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
