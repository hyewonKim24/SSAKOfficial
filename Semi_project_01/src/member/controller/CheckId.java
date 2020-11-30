package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.member.memberService;

/**
 * Servlet implementation class CheckId
 */
@WebServlet("/CheckId.do")
public class CheckId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckId() {
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
	
	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String mid = request.getParameter("mid");
		PrintWriter out = response.getWriter();
		if(mid==null||mid=="") {
			out.println("아이디를 입력해주세요");
			
		}else {
		try {
		memberService msv = new memberService();
		boolean a = msv.isIdChk(mid);
		System.out.println("id 체크"+a);
		if(a==true){
			//0 : 이미 사용중
			out.println("0");
		}else{
			//1 : 사용가능
			out.println("1");
		}
		}catch(SQLException e) {
			e.printStackTrace();
			out.println("입력범위를 벗어났습니다. 다시 입력해주세요");
		}catch(Exception e) {
			e.printStackTrace();
			out.println("조회하는 도중에 오류가 발생했습니다.");
		}
		out.flush();
		out.close();
		
	}
		
	}
	

}
