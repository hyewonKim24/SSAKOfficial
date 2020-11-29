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
 * Servlet implementation class CheckEmail
 */
@WebServlet("/CheckEmail")
public class CheckEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckEmail() {
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

		String memail = request.getParameter("memail");
		PrintWriter out = response.getWriter();
		
		if(memail==null||memail=="") {
			out.println("이메일을 입력해주세요");
			
		}else {
		try {
		memberService msv = new memberService();
		boolean a = msv.isEmailChk(memail);
		System.out.println("email 체크"+a);
		if(a==true){
			//사용중 0
			out.println("0");
		}else{
			//사용가능 1
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
