package book.controller;

import java.io.IOException;
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
 * Servlet implementation class bookCategorCtrl
 */
@WebServlet("/bookCategory.do")
public class bookCategoryCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookCategoryCtrl() {
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

//		List<BookVO> blist = null;
//		System.out.println("aaa");
//		try {
//			blist = bsv.bestSellerList(1,10);
//			System.out.println(blist.size());
//			if (blist != null) {
//				request.setAttribute("bestSeller", blist);
//				RequestDispatcher disp = request.getRequestDispatcher("./bookBestSeller.jsp");
//				disp.forward(request, response);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}

		// 페이징
		int pageSize = 10; // 페이지 당 글 수
		int pageBlock = 10; // 페이지 링크 수
		try {			
				//총 글 개수 
			int nCount = bsv.getBoardCount();/*변경 : 메소드*/
			System.out.println(nCount);
				//페이지 수 초기화
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) {
				pageNum = "1";
			} else if(pageNum.equals("")){
				pageNum = "1";
			}
				//startPage , endPage 구하는 식
			int currentPage = 1;
			try {
				currentPage = Integer.parseInt(pageNum);
			} catch(Exception e) {
				e.printStackTrace();
				
			}
			
			int pageCount = (nCount / pageSize) + (nCount % pageSize == 0 ? 0 : 1);
			int startPage = 1;
			int endPage = 1;
			if (currentPage % pageBlock == 0) {
				startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
			} else {
				startPage = ((currentPage / pageBlock)) * pageBlock + 1;
			}
			endPage = startPage + pageBlock - 1;
			if (endPage > pageCount)
				endPage = pageCount;

				// 페이징 rownum 구하기
			int startRnum = ((currentPage-1)*pageSize)+1;	// 거의 공식
			int endRnum = startRnum + pageSize - 1;			// currentPage*pageSize
			System.out.println(startRnum +  " - "+ endRnum );
			List<BookVO> list = bsv.categoryList(startRnum , endRnum);  /*변경 : 메소드*/
			
			  
	    	 
			
			
			//블로그 베스트셀러
			List<BookVO> blogBest = bsv.blogBest();
			System.out.println(blogBest.size());
			System.out.println(blogBest.get(0).getBtitle());
			System.out.println(blogBest.get(1).getBtitle());
			request.setAttribute("blogBest", blogBest);
			
			//베스트셀러
			List<BookVO> bestSeller = bsv.bestSeller();
			System.out.println(bestSeller.size());
			System.out.println(bestSeller.get(0).getBtitle());
			System.out.println(bestSeller.get(1).getBtitle());
			request.setAttribute("bestSeller", bestSeller);
			//새로나온책
			List<BookVO> NewList = bsv.NewList();
			System.out.println(NewList.size());
			System.out.println(NewList.get(0).getBtitle());
			System.out.println(NewList.get(1).getBtitle());
			request.setAttribute("NewList", NewList);
		

				//보내주기 
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("PageNum", currentPage);
			request.setAttribute("categoryList", list);	/* 변경 : el태그 - jsp이랑 맞추기  */
			
			
			System.out.println(list.size()+ ", " + startPage + ", "+ endPage);
			RequestDispatcher disp = request.getRequestDispatcher("./book/bookCategory.jsp"); /*변경 : 경로*/
			disp.forward(request, response);
			
		
	}catch (Exception e) {
		e.printStackTrace();
	}
	}
}
