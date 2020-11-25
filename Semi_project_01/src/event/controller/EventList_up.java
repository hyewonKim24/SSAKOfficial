package event.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import event.model.EventVO;
import service.event.EventService;

/**
 * Servlet implementation class EventList
 */
@WebServlet("/EventList_up")
public class EventList_up extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventList_up(){
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
		EventService event = new EventService();
		request.getParameter("eno");
		System.out.println(request.getParameter("eno"));
		request.getParameter("mid");
		request.getParameter("econtent");

		// 페이징
		int pageSize = 5; // 페이지 당 글 수
		int pageBlock = 5; // 페이지 링크 수
		
		try {
			int nCount = event.eventCount();
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) {
				pageNum = "1";
			} else if (pageNum.equals("")) {
				pageNum = "1";
			}
			// startPage , endPage 구하는 식
			int currentPage = 1;
			try {
				currentPage = Integer.parseInt(pageNum);
			} catch (Exception e) {
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
			System.out.println("엔드드드"+endPage);
			if (endPage > pageCount)
				endPage = pageCount;
			// 페이징 rownum 구하기
			int startRnum = ((currentPage - 1) * pageSize) + 1; // 거의 공식
			int endRnum = startRnum + pageSize - 1; // currentPage*pageSize
			System.out.println(startRnum + " - " + endRnum);

			// 이전 다음 기능
			int prev = 1;
			int next = 1;
			System.out.println("스타트"+startPage+"엔드"+endPage+"카운트"+pageCount);
			if (startPage != 1) {
				prev = startPage - 1;
			}
			if (endPage < pageCount) {
				next = endPage + 1;
			}
			System.out.println(prev + "이전 - 다음" + next);
			
			List<EventVO> eventlist = event.eventList(startRnum, endRnum);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("PageNum", currentPage);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("prev", prev);
			request.setAttribute("next", next);
			request.setAttribute("list", eventlist);
			RequestDispatcher ds = request.getRequestDispatcher("./event/event_update.jsp");
			ds.forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}


}
