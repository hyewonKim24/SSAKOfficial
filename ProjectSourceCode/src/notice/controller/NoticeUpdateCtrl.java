package notice.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.NoticeVO;
import service.notice.NoticeService;

/**
 * Servlet implementation class NoticeUpdateCtrl
 */
@WebServlet("/noticeUpdate.do")
public class NoticeUpdateCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateCtrl() {
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
		NoticeService nsv = new NoticeService();
		PrintWriter out = response.getWriter();
		
		int nno = Integer.parseInt(request.getParameter("nno").trim());
//		String pageNum = request.getParameter("pageNum");
		String mid = request.getParameter("mid");
		String ntitle = request.getParameter("ntitle");
		String ncontent = request.getParameter("ncontent");
		
		NoticeVO vo = new NoticeVO();
		vo.setNno(nno);
		vo.setMid(mid);
		vo.setNtitle(ntitle);
		vo.setNcontent(ncontent);
		
		try {
			int result = nsv.noticeUpdate(vo, nno);
			System.out.println(vo);
			if(result == 1) {
				System.out.println(result+"행이 수정되었습니다");
				request.setAttribute("noticeUpdate", "수정이 완료되었습니다.");
				RequestDispatcher disp = request.getRequestDispatcher("./noticeDetail.do");
				disp.forward(request, response);
				out.println("수정되었습니다.");
			} else {
				RequestDispatcher disp = request.getRequestDispatcher("./noticeDetail.do");
				disp.forward(request, response);
				System.out.println("수정하지 못했습니다");
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("수정 오류 발생");
		}
		out.flush();
		out.close();

		//		if (session.getAttribute("userID") != null) {
//			userID = (String) session.getAttribute("userID");
//		} 
//		else {
//			out.append("<script>alert('관리자 로그인이 끊겼습니다.');");
//			out.append("location.href = 'login.jsp'");
//			out.append("</script>");
//		}
		
//		if(request.getParameter("mid")!=null) {
//			String mid = request.getParameter("mid");
//		}
		
	}
}
