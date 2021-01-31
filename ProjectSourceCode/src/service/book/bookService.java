package service.book;

import static common.filter.JDBCTemplete.close;
import static common.filter.JDBCTemplete.commit;
import static common.filter.JDBCTemplete.getConnection;
import static common.filter.JDBCTemplete.rollback;

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

   public void getbookinfo() throws SQLException {
      System.out.println("bookservice");
      Connection conn=getConnection();
      new BookDAO().getbookinfo(conn);
      close(conn);
   }
   
   
   public List<BookVO> bestSellerList(int start, int end) throws SQLException {
      Connection conn = getConnection();
      List<BookVO> booklist =  new BookDAO().bestSellerList(conn, start, end);
      System.out.println("리스트 받아오기연결성공");
      close(conn);
      return booklist;
   }
   
   public List<BookVO> newList(int start, int end) throws SQLException {
      Connection conn = getConnection();
      List<BookVO> booklist =  new BookDAO().newList(conn, start, end);
      System.out.println("newList리스트 받아오기연결성공");
      close(conn);
      return booklist;
   }
   
   public List<BookVO> categoryList(int start, int end) throws SQLException {
      Connection conn = getConnection();
      List<BookVO> booklist =  new BookDAO().categoryList(conn, start, end);
      System.out.println("categoryList리스트 받아오기연결성공");
      close(conn);
      return booklist;
   }
   
   public int getBoardCount() throws SQLException {
      Connection conn = getConnection();
      int result = new BookDAO().getBoardCount(conn);
      close(conn);
      return result;
   }
   
   public BookVO selectBook(String bisbn) throws SQLException {
	   Connection conn=getConnection();
	   BookVO bvo = new BookDAO().selectBook(conn, bisbn);
	   close(conn);
	   return bvo;
   }


	public List<BookVO> bookSearch(int start, int end, String mSearchBar) throws SQLException {
		Connection conn = getConnection();
		List<BookVO> searchList = new BookDAO().bookSearch(conn, start, end, mSearchBar);
		System.out.println("searchList리스트 받아오기연결성공");
		close(conn);
		return searchList;
	}

	public int getSearchCount(String mSearchBar) throws SQLException {
		System.out.println("getsearchCount");
		Connection conn = getConnection();
		int result = new BookDAO().getSearchCount(conn, mSearchBar);
		System.out.println("getSearchCount리스트 받아오기연결성공");
		close(conn);
		return result;
	}

	public List<BookVO> blogBest() throws SQLException {
		Connection conn = getConnection();
		List<BookVO> booklist = new BookDAO().blogBest(conn);
		close(conn);
		return booklist;

	}

	public List<BookVO> bestSeller()throws SQLException {
		Connection conn = getConnection();
		List<BookVO> bestSeller = new BookDAO().bestSeller(conn);
		close(conn);
		return bestSeller;

	}

	public List<BookVO> NewList()throws SQLException {
		Connection conn = getConnection();
		List<BookVO> NewList = new BookDAO().NewList(conn);
		close(conn);
		return NewList;
	}
   
}