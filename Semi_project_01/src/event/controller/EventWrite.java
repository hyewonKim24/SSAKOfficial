package event.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import event.model.EventVO;
import service.event.EventService;

/**
 * Servlet implementation class EventWrite
 */
@WebServlet("/EventWrite")
public class EventWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventWrite() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EventService event = new EventService();
		EventVO vo = new EventVO();
		request.getSession().setAttribute("mid", "kim");
		vo.setMid(request.getSession().getAttribute("mid").toString());
		vo.setEcontent(request.getParameter("econtent"));
//		String id = request.getSession().getAttribute("mid").toString();
//		String content = request.getParameter("econtent");
//		String edate = request.getParameter("edate");
//		int eno = Integer.parseInt(request.getParameter("eno"));
		
		try {
			int result = event.eventWrite(vo);
			if(result==1) {
				response.sendRedirect("EventList");
				System.out.println("게시글이 삽입되었습니다.");
			} else {
				System.out.println("게시글 삽입 실패했습니다.");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
