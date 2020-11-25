package cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.BookVO;
import cart.model.CartListVO;
import cart.model.CartVO;
import member.model.memberVO;
import service.book.bookService;
import service.bookcover.bookCoverService;
import service.cart.CartService;

/**
 * Servlet implementation class cartInsert
 */
@WebServlet("/CartInsert")
public class CartInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartInsert() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CartService service = new CartService();
		CartVO vo = new CartVO();
		memberVO mvo = (memberVO) request.getSession().getAttribute("member");
		vo.setMid(mvo.getMid());
		System.out.println(mvo.getMid());
		vo.setBisbn(request.getParameter("bisbn"));
		String customURL = request.getParameter("customURL");
		String bookamount = request.getParameter("bookamount");
		String bisbn = request.getParameter("bisbn");
		String mid = mvo.getMid();
		System.out.println(customURL);
		System.out.println(bookamount);
		System.out.println(mid);

		
		if (customURL == null || customURL.equals("")) {
			// 북커버 null오류 처리
			int dnoConf = 0;
			if (request.getParameter("dno") != null) {
				vo.setDno(Integer.parseInt(request.getParameter("dno")));
				dnoConf = Integer.parseInt(request.getParameter("dno"));
			} else {
				vo.setDno(0);
			}
			
			vo.setOamount(Integer.parseInt(request.getParameter("oamount")));

			int oamount = Integer.parseInt(request.getParameter("oamount"));
			// System.out.println("추가한애:"+oamount+" "+bisbn+" "+dnoConf);

			try {
				// 중복 책 체크
				List<CartListVO> cartlist = service.cartList(mid);
				// System.out.println("있던애:"+cartlist.get(0).getOamount()+"
				// "+cartlist.get(0).getBisbn()+" "+cartlist.get(0).getDno());

				boolean check = false;
				for (int i = 0; i < cartlist.size(); i++) {
					if (bisbn.equals(cartlist.get(i).getBisbn()) && dnoConf == cartlist.get(i).getDno()) {
						check = true;
						int hasOamount = cartlist.get(i).getOamount();
						oamount += hasOamount;
						int result = service.cartUpdateIns(bisbn, oamount, mid);
						if (result >= 1) {
							response.sendRedirect("CartList");
							System.out.println("중복상품 수량이 변경되었습니다.");
						} else {
							System.out.println("중복상품 수량 변경 실패");
						}
					}
				}
				if (!check) {
					// 카트 인서트
					int result = service.cartInsert(vo);
					if (result >= 1) {
						response.sendRedirect("CartList");
						System.out.println("상품이 추가되었습니다.");
					} else {
						System.out.println("상품 추가 실패");
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {
			//북커버에서 장바구니 담기
			bookCoverService bcsv = new bookCoverService();
			bookService bsv = new bookService();
			PrintWriter out = response.getWriter();
			try {
				BookVO bvo = bsv.selectBook(bisbn);
				vo.setOamount(Integer.parseInt(bookamount));
				int rs= bcsv.bookCoverInsert(customURL, vo);
				System.out.println("bookcover insert "+rs+"행");
				out.print(rs);
				out.flush();
				out.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			

		}
	}
}
