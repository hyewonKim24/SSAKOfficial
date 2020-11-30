package cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.model.CartListVO;
import member.model.memberVO;
import service.cart.CartService;

/**
 * Servlet implementation class CartInserts
 */
@WebServlet("/CartInserts.do")
public class CartInserts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartInserts() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//로그인 x
		memberVO mvo = (memberVO) request.getSession().getAttribute("member");
		if (mvo == null || mvo.equals("") || mvo.equals("null")) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('로그인을 해주세요.'); location.href='./member/memberLogin.jsp';</script>");
			writer.flush();
			writer.close();
		} else {
		CartService cart = new CartService();
		String mid = mvo.getMid();
		String bisbn = request.getParameter("bisbn");
		String stat = request.getParameter("oamount");

		String bisbn2[] = bisbn.split(",");
		String stat2[] = stat.split(",");

		Map<String, Integer> map = new HashMap<>();
		Map<String, Integer> updatemap = new HashMap<>();
		Map<String, Integer> insertmap = new HashMap<>();

		// 장바구니 담기로 불러온 상품들을 map에 저장함
		for (int i = 0; i < stat2.length; i++) {
			int[] omount = new int[stat2.length];
			omount[i] = Integer.parseInt(stat2[i]);
			map.put(bisbn2[i], omount[i]);
		}

		try {
			// 중복 책 체크 (업데이트)
			List<CartListVO> cartlist = cart.cartList(mid);
			// 장바구니 상품리스트
			Iterator<String> entries = map.keySet().iterator();

			while (entries.hasNext()) {
				String key = entries.next();
				for (int i = 0; i < cartlist.size(); i++) {
					String bisbnlist = cartlist.get(i).getBisbn(); // bisbn값
					int dnolist = cartlist.get(i).getDno(); // dno값
					int amountlist = cartlist.get(i).getOamount(); // oamount값

					if (bisbnlist.equals(key) && dnolist == 0) {
						updatemap.put(key, map.get(key) + amountlist);
						int result = cart.cartUpdateIns2(mid, updatemap);
						// System.out.println("entries:"+entries);
						entries.remove();
						// System.out.println("성공해라얍");
					}
				}
				System.out.println("재확인" + map.keySet() + "값" + map.get(key));
			}

			// 중복 책 제외 인서트
			if (!map.isEmpty()) {
				for (String key : map.keySet()) {
					System.out.println("인서트" + key);
					insertmap.put(key, map.get(key));
				}
				int result = cart.cartInserts(mid, insertmap);
				if (result >= 1) {
					System.out.println("여러개가 추가되었습니다.");
				} else {
					System.out.println("여러개 추가 실패");
				}

			}

			response.sendRedirect("CartList.do");

		} catch (Exception e) {
			e.printStackTrace();
		}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
