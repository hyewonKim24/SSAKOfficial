package event.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import event.model.EventVO;
import service.event.EventService;

/**
 * Servlet implementation class EventDelete
 */
@WebServlet("/EventDelete.do")
public class EventDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventDelete() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EventService event = new EventService();
		EventVO vo = new EventVO();
//		vo.setEno(Integer.parseInt(request.getParameter("eno")));
		int eno=Integer.parseInt(request.getParameter("eno"));
		System.out.println(eno);
		try {
			int result = event.eventDelete(eno);
			if(result==1) {
				response.sendRedirect("EventList.do");
				System.out.println("게시글이 삭제되었습니다.");
			} else {
				System.out.println("게시글 삭제 실패했습니다.");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
