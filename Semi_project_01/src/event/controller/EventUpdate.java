package event.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.event.EventService;

/**
 * Servlet implementation class EventUpdate
 */
@WebServlet("/EventUpdate.do")
public class EventUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventUpdate() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher ds = request.getRequestDispatcher("./event/event_update.jsp");
		ds.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EventService event = new EventService();
		int eno=Integer.parseInt(request.getParameter("eno"));
		String econtent = (request.getParameter("econtent"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		try {
			int result = event.eventUpdate(econtent, eno);
			if(result==1) {
				response.sendRedirect("EventList.do?pageNum="+pageNum);
				System.out.println("게시글이 수정되었습니다.");
			} else {
				System.out.println("게시글 수정을 실패했습니다.");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
