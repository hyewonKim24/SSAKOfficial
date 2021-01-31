package book.controller;

import java.io.IOException;
//import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.*;
import service.book.bookService;

/**
 * Servlet implementation class BookCtrl
 */
@WebServlet("/bookSearch.do")
public class BookSearchCtrl extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookSearchCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	private void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		bookService bsv = new bookService();
		String mSearchBar = request.getParameter("mSearchBar");
		System.out.println(mSearchBar);
				


		// 페이징
		int pageSize = 10; // 페이지 당 글 수
		int pageBlock = 10; // 페이지 링크 수
		try {			
				//총 글 개수 
			int nCount = bsv.getSearchCount(mSearchBar);/*변경 : 메소드*/
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
			if (endPage > pageCount) {
				endPage = pageCount;
			}
				// 페이징 rownum 구하기
			int startRnum = ((currentPage-1)*pageSize)+1;	// 거의 공식
			int endRnum = startRnum + pageSize - 1;			// currentPage*pageSize
			System.out.println(startRnum +  " - "+ endRnum );
			List<BookVO> bookSearch = bsv.bookSearch(startRnum , endRnum , mSearchBar);  /*변경 : 메소드*/
			
			// 이전 다음 기능
						int prev = 1;
						int next = 1;
						next = endPage + 1;
						prev = startPage - 1;
						if (startPage != 1) {
							prev = startPage - 1;
						}
						if (endPage > pageCount) {
							next = endPage + 1;
						}
						
						System.out.println(prev + "이전 - 다음" + next);

				//보내주기 
			request.setAttribute("startPage", startPage);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("endPage", endPage);
			request.setAttribute("PageNum", currentPage);
			request.setAttribute("mSearchBar", mSearchBar);
			request.setAttribute("bookSearch", bookSearch);	/* 변경 : el태그 - jsp이랑 맞추기  */
			request.setAttribute("prev", prev);
			request.setAttribute("next", next);
			request.setAttribute("nCount", nCount);
			
			System.out.println(bookSearch.size()+ ", " + startPage + ", "+ endPage);
			System.out.println(nCount);
			RequestDispatcher disp = request.getRequestDispatcher("./book/bookSearch.jsp"); /*변경 : 경로*/
			disp.forward(request, response);
		
	}catch (Exception e) {
		e.printStackTrace();
	}
	}

}