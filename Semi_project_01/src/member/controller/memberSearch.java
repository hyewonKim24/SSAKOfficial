package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.*;
import service.member.memberService;

/**
 * Servlet implementation class memberSearch
 */
@WebServlet("/memberSearch")
public class memberSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberSearch() {
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
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String msearchbar = request.getParameter("msearchbar");
		System.out.println("msearchbar" + msearchbar);
		String mtype = request.getParameter("mtype");
		System.out.println("mtype:" + mtype);

		memberService msv = new memberService();
		
		// 페이징
		int pageSize = 10; // 페이지 당 글 수
		int pageBlock = 10; // 페이지 링크 수
		try {
			// 총 글 개수
			int nCount = msv.memberSearchCount(mtype, msearchbar);
			System.out.println("nCount : " + nCount);

			// 페이지 수 초기화
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
			if (endPage > pageCount)
				endPage = pageCount;

			// 페이징 rownum 구하기
			int start = ((currentPage - 1) * pageSize) + 1; // 거의 공식
			int end = start + pageSize - 1; // currentPage*pageSize
			System.out.println(start + " - " + end);
			

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

			// 보내주기
			if (msearchbar == null || msearchbar == "") {
				request.setAttribute("search_error", "검색어를 입력해주세요");
				System.out.println("검색어가 null 인 경우");
				RequestDispatcher disp = request.getRequestDispatcher("./memberList");
				disp.forward(request, response);
			} else {
				try {
					List<memberVO> mlist = msv.memberSearch(mtype, msearchbar, start, end);
					if (mlist != null) {
						request.setAttribute("startPage", startPage);
						request.setAttribute("endPage", endPage);
						request.setAttribute("PageNum", currentPage);
						request.setAttribute("pageCount", pageCount);
						request.setAttribute("prev", prev);
						request.setAttribute("next", next);
						request.setAttribute("mtype", mtype);
						request.setAttribute("mlist", mlist);
						request.setAttribute("msearchbar", msearchbar);
						System.out.println("검색 수 " + mlist.size() + ", " + startPage + ", " + endPage);
						RequestDispatcher disp = request.getRequestDispatcher("./manage/mManageSearch.jsp");
						disp.forward(request, response);

					} else {
						// null elert
					}
				} catch (SQLException e) {
					e.printStackTrace();
					request.setAttribute("errorMsg", "존재하지 않는 회원입니다. 다시 입력해주세요 :(");
					RequestDispatcher disp1 = request.getRequestDispatcher("./manage/mManage1.jsp"); /* 변경 : 경로 */
					disp1.forward(request, response);
				}
			}
		}catch(SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", "존재하지 않는 회원입니다. 다시 입력해주세요 :(");
			RequestDispatcher disp1 = request.getRequestDispatcher("./manage/mManage1.jsp"); /*변경 : 경로*/
			disp1.forward(request, response);
			
					
		}
	}
}
