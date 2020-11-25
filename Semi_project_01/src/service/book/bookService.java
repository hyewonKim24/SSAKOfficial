package service.book;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import book.model.*;
import dao.BookDAO;

public class bookService {
   private DataSource ds=null;      //Datasource ds는 아파치톰캣(WAS)가 제공하는 DBCP(CB connection pool)이다.
   
   public bookService() {
      Context initContext1;
      try {
         initContext1 = new InitialContext();
         Context envContext1 = (Context) initContext1.lookup("java:/comp/env");
         ds = (DataSource) envContext1.lookup("jdbc/myoracle");
       if(ds==null) {
         System.out.println("연결실패");
      }else {
      }
         System.out.println("연결성공");
      }catch (NamingException e) {
         e.printStackTrace();
         
      }
   }
   
   public void getbookinfo() throws SQLException {
      System.out.println("bookservice");
      Connection conn=ds.getConnection();
      new BookDAO().getbookinfo(conn);
      conn.close();
   }
   
   
   public List<BookVO> bestSellerList(int start, int end) throws SQLException {
      Connection conn = ds.getConnection();
      List<BookVO> booklist =  new BookDAO().bestSellerList(conn, start, end);
      System.out.println("리스트 받아오기연결성공");
      conn.close();
      return booklist;
   }
   
   public List<BookVO> newList(int start, int end) throws SQLException {
      Connection conn = ds.getConnection();
      List<BookVO> booklist =  new BookDAO().newList(conn, start, end);
      System.out.println("newList리스트 받아오기연결성공");
      conn.close();
      return booklist;
   }
   
   public List<BookVO> categoryList(int start, int end) throws SQLException {
      Connection conn = ds.getConnection();
      List<BookVO> booklist =  new BookDAO().categoryList(conn, start, end);
      System.out.println("categoryList리스트 받아오기연결성공");
      conn.close();
      return booklist;
   }
   
   public int getBoardCount() throws SQLException {
      Connection conn = ds.getConnection();
      int result = new BookDAO().getBoardCount(conn);
      conn.close();
      return result;
   }
   
   public BookVO selectBook(String bisbn) throws SQLException {
	   Connection conn=ds.getConnection();
	   BookVO bvo = new BookDAO().selectBook(conn, bisbn);
	   conn.close();
	   return bvo;
   }


	public List<BookVO> bookSearch(int start, int end, String mSearchBar) throws SQLException {
		Connection conn = ds.getConnection();
		List<BookVO> searchList = new BookDAO().bookSearch(conn, start, end, mSearchBar);
		System.out.println("searchList리스트 받아오기연결성공");
		conn.close();
		return searchList;
	}

	public int getSearchCount(String mSearchBar) throws SQLException {
		System.out.println("getsearchCount");
		Connection conn = ds.getConnection();
		int result = new BookDAO().getSearchCount(conn, mSearchBar);
		System.out.println("getSearchCount리스트 받아오기연결성공");
		conn.close();
		return result;
	}

	public List<BookVO> blogBest() throws SQLException {
		Connection conn = ds.getConnection();
		List<BookVO> booklist = new BookDAO().blogBest(conn);
		conn.close();
		return booklist;

	}

	public List<BookVO> bestSeller()throws SQLException {
		Connection conn = ds.getConnection();
		List<BookVO> bestSeller = new BookDAO().bestSeller(conn);
		conn.close();
		return bestSeller;

	}

	public List<BookVO> NewList()throws SQLException {
		Connection conn = ds.getConnection();
		List<BookVO> NewList = new BookDAO().NewList(conn);
		conn.close();
		return NewList;
	}
   
}