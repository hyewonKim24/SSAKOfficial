package book.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.*;
import service.book.bookService;

/**
 * Servlet implementation class ssakMain
 */
@WebServlet("/ssakMain.do")
public class ssakMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ssakMain() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      execute(request, response);
	}
	
	
	
	   private void execute(HttpServletRequest request, HttpServletResponse response)
		         throws ServletException, IOException {
		      bookService bsv = new bookService();
		      try {
		    	  	
		    	 //오늘의 책
		    	List<BookVO> todaylist = new ArrayList<BookVO>();
		    	BookVO today_book1= bsv.selectBook("K402636730");
		    	System.out.println(today_book1.getBtitle());
		    	todaylist.add(today_book1);
		    	BookVO today_book2= bsv.selectBook("8936456229");
		    	todaylist.add(today_book2);
		    	BookVO today_book3= bsv.selectBook("8952782070");
		    	todaylist.add(today_book3);
		    	BookVO today_book4= bsv.selectBook("8982182667");
		    	todaylist.add(today_book4);
		    	request.setAttribute("todaylist", todaylist);
		    	
		    	  
		    	 //블로그 베스트셀러
		    	List<BookVO> blogbest = bsv.blogBest();
		    	System.out.println(blogbest.size());
		    	System.out.println(blogbest.get(0).getBtitle());
		    	System.out.println(blogbest.get(1).getBtitle());
		    	System.out.println(blogbest.get(2).getBtitle());
		    	request.setAttribute("blogbest", blogbest);
		    	  
		    	  //베스트셀러 15개
				List<BookVO> bestseller = bsv.bestSellerList(20, 36);
				 request.setAttribute("bestseller", bestseller);
				 
		         //신간도서 15개
		         List<BookVO> newlist = bsv.newList(70, 86);
		         request.setAttribute("newlist", newlist);
		         System.out.println("신간"+newlist.size());
		         
		         //main.jsp로 이동
				 RequestDispatcher disp = request.getRequestDispatcher("./main/main.jsp"); /*변경 : 경로*/
		         disp.forward(request, response);
		         
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		      
	   }
}
