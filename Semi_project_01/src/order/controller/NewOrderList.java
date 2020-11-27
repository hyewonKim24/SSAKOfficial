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
 * Servlet implementation class OrderList
 */
@WebServlet("/NewOrderList.do")
public class NewOrderList extends HttpServlet {
   private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewOrderList() {
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
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doProcess(request, response);
   }

   protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      orderService order = new orderService();
      memberService msv = new memberService();
	  memberVO mvo = (memberVO)request.getSession().getAttribute("member");
      String mid = mvo.getMid();
      System.out.println("아이디는"+mid);
      String cno2 = request.getParameter("cno"); 
      System.out.println(cno2);
      String[] cno = cno2.split(",");

      try {
         int[] chks = new int[cno.length];
         for(int i=0; i<cno.length; i++) 
            chks[i] = Integer.parseInt(cno[i]);

         List<CartListVO> orderList = order.orderList(chks);
         request.setAttribute("list", orderList);

         memberVO mdetail = msv.memberDetail(mid);
         request.setAttribute("mdetail", mdetail);
         System.out.println("member : " + mdetail);

         RequestDispatcher ds = request.getRequestDispatcher("./order/order.jsp");
         ds.forward(request, response);   

      } catch(Exception e) {
         e.printStackTrace();
      }
   }

}