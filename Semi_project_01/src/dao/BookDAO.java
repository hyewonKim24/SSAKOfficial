package dao;

import java.sql.*;
import java.io.FileReader;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

//import com.sun.org.apache.xerces.internal.impl.xpath.regex.REUtil;

import book.model.*;

import java.util.ArrayList;
import java.util.List;

public class BookDAO {

   private PreparedStatement pstmt = null;
   private ResultSet rs = null;
   private Statement stmt = null;


   private void close() {
      try {
         if (rs != null) {
            rs.close();
            rs = null;
         }
         if (pstmt != null) {
            pstmt.close();
            pstmt = null;
         }

      } catch (SQLException e) {
         e.printStackTrace();
      }
   }

   // BISBN VARCHAR2(100) PRIMARY KEY,
   // bcategoryid NUMBER NOT NULL,
   // btitle VARCHAR2(100) NOT NULL,
   // bauthor VARCHAR2(100) NOT NULL,
   // bdiscription VARCHAR2(1800),
   // bcover VARCHAR2(300),
   // bpriceStandard VARCHAR2(10),
   // bpricesales VARCHAR2(10),
   // bpublisher VARCHAR2(100),
   // bpubDate VARCHAR2(100),
   // bstock NUMBER,
   // bBest VARCHAR2(10)

   public void getbookinfo(Connection conn) {

      List<BookVO> bookinfo = new ArrayList<BookVO>();
      // 파일 json에 있는 내용을 가져오는 코드.
      JSONParser p1 = new JSONParser();
      System.out.println("getbookinfo 메소드 들어옴");
      try {
         JSONArray arrCon = (JSONArray) p1.parse(new FileReader("C:\\Users\\jjang\\OneDrive\\바탕 화면\\hyewon\\학원관련\\학원수업관련\\Semi_project\\Semi_project_01\\category.json"));
         // enhanced for //foreach
         // 범위를 정하기는 힘들지만 리스트(배열) 전체를 반복하기에 좋음.
         for (Object obj : arrCon) {
            BookVO vo = new BookVO();
            JSONObject jo = (JSONObject) obj; // cast 자료형변환.
            vo.setBISBN((String) jo.get("isbn"));
            vo.setBcategoryid(String.valueOf(jo.get("categoryId")));
            vo.setBauthor((String) jo.get("author"));
            vo.setBtitle((String) jo.get("title"));
            vo.setBdiscription((String) jo.get("description"));
            vo.setBcover((String) jo.get("cover"));
            vo.setBpriceStandard(Integer.parseInt(String.valueOf(jo.get("priceStandard"))));
            vo.setBpricesales(Integer.parseInt(String.valueOf(jo.get("priceSales"))));
            vo.setBpublisher((String) jo.get("publisher"));
            vo.setBpubDate((String) jo.get("pubDate"));
            vo.setBstock(500);
            vo.setBbest(0);
            vo.setBnew(0);
            vo.setBblog(0);
            vo.setBcategory(1);
            bookinfo.add(vo);
            System.out.println((String) jo.get("isbn"));
         }

      } catch (Exception e) {
         e.printStackTrace();
      }

      int rs = 0;

      String sql = "INSERT INTO book VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

      try {
         pstmt = conn.prepareStatement(sql);

         for (BookVO e : bookinfo) {
            pstmt.setString(1, e.getBISBN());
            pstmt.setString(2, e.getBcategoryid());
            pstmt.setString(3, e.getBtitle());
            pstmt.setString(4, e.getBauthor());
            pstmt.setString(5, e.getBdiscription());
            pstmt.setString(6, e.getBcover());
            pstmt.setInt(7, e.getBpriceStandard());
            pstmt.setInt(8, e.getBpricesales());
            pstmt.setString(9, e.getBpublisher());
            pstmt.setString(10, e.getBpubDate());
            pstmt.setInt(11, e.getBstock());
            pstmt.setInt(12, e.getBbest());
            pstmt.setInt(13, e.getBnew());
            pstmt.setInt(14, e.getBblog());
            pstmt.setInt(15, e.getBcategory());

            rs = pstmt.executeUpdate();
            System.out.println(rs + "행 입력되었습니다.");
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         close();
      }

   }

   public List<BookVO> bestSellerList(Connection conn, int start, int end) throws SQLException {
      List<BookVO> bestSellerList = new ArrayList<BookVO>();
      BookVO vo = null;
      String sql = "select bisbn, btitle, bauthor, bdiscription, bcover, bpriceStandard, bpriceSales FROM" + 
            " (select rownum rnum,  bisbn, btitle, bauthor, bdiscription, bcover, bpriceStandard, bpriceSales from book where bbest=1)" + 
            " where rnum >=? and rnum <=?";
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, start);
         pstmt.setInt(2, end);
         rs = pstmt.executeQuery();
         if (rs.next()) {

            do {
               vo = new BookVO();
               vo.setBISBN(rs.getString("bisbn"));
               vo.setBtitle(rs.getString("btitle"));
               vo.setBauthor(rs.getString("bauthor"));
               vo.setBdiscription(rs.getString("bdiscription"));
               vo.setBcover(rs.getString("bcover"));
               vo.setBpriceStandard(rs.getInt("bpriceStandard"));
               vo.setBpricesales(rs.getInt("bpricesales"));
				vo.setBno(start++);
               bestSellerList.add(vo);
            } while (rs.next());
         }
      } finally {
         close();
      }

      return bestSellerList;
   }
   
   
   public List<BookVO> newList(Connection conn, int start, int end) throws SQLException {
      List<BookVO> newList = new ArrayList<BookVO>();
      BookVO vo = null;
      String sql = "select bisbn, btitle, bauthor, bdiscription, bcover, bpriceStandard, bpriceSales FROM" + 
            " (select rownum rnum, bisbn,  btitle, bauthor, bdiscription, bcover, bpriceStandard, bpriceSales from book where bnew=1)" + 
            " where rnum >=? and rnum <=?";
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, start);
         pstmt.setInt(2, end);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            
            do {
               vo = new BookVO();
               vo.setBISBN(rs.getString("bisbn"));
               vo.setBtitle(rs.getString("btitle"));
               vo.setBauthor(rs.getString("bauthor"));
               vo.setBdiscription(rs.getString("bdiscription"));
               vo.setBcover(rs.getString("bcover"));
               vo.setBpriceStandard(rs.getInt("bpriceStandard"));
               vo.setBpricesales(rs.getInt("bpricesales"));
				vo.setBno(start++);
               newList.add(vo);
            } while (rs.next());
         }
      } finally {
         close();
      }
      
      return newList;
   }
   
   public List<BookVO> categoryList(Connection conn, int start, int end) throws SQLException {
      List<BookVO> categoryList = new ArrayList<BookVO>();
      BookVO vo = null;
      String sql = "select bisbn, btitle, bauthor, bdiscription, bcover, bpriceStandard, bpriceSales FROM" + 
            " (select rownum rnum, bisbn,  btitle, bauthor, bdiscription, bcover, bpriceStandard, bpriceSales from book where bCategory=1)" + 
            " where rnum >=? and rnum <=?";
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, start);
         pstmt.setInt(2, end);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            
            do {
               vo = new BookVO();
               vo.setBISBN(rs.getString("bisbn"));
               vo.setBtitle(rs.getString("btitle"));
               vo.setBauthor(rs.getString("bauthor"));
               vo.setBdiscription(rs.getString("bdiscription"));
               vo.setBcover(rs.getString("bcover"));
               vo.setBpriceStandard(rs.getInt("bpriceStandard"));
               vo.setBpricesales(rs.getInt("bpricesales"));
               System.out.println(start);
               vo.setBno(start++);
               categoryList.add(vo);
            } while (rs.next());
         }
      } finally {
         close();
      }
      
      return categoryList;
   }
   
   
   
   
     public int getBoardCount(Connection conn) throws SQLException {
         
         int cnt = 0;
         String sql = "select COUNT(*) from book";
         try {
           stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
               cnt = rs.getInt(1);
            }
         } finally {
            close();
         }
         return cnt;
      }
     
     public BookVO selectBook(Connection conn,String bisbn) throws SQLException {
    	 BookVO bvo = new BookVO();
    	 String sql = "select * from book where bisbn=?";
    	 int count=1;
    	      
    	      try {
    	         pstmt = conn.prepareStatement(sql);
    	         pstmt.setString(1, bisbn);
    	         rs = pstmt.executeQuery();
    	         if (rs.next()) {
    	        	 bvo.setBtitle(rs.getString("btitle"));
    	        	 bvo.setBISBN(rs.getString("bisbn"));
    	        	 bvo.setBauthor(rs.getString("bauthor"));
    	        	 bvo.setBpriceStandard(rs.getInt("bpricestandard"));
    	        	 bvo.setBpricesales(rs.getInt("bpricesales"));
    	        	 bvo.setBdiscription(rs.getString("bdiscription"));
    	        	 bvo.setBcover(rs.getString("bcover"));
    	        	 bvo.setBno(count++);
    	         }
    	      }finally {
    	        	 close();
    	         }
    	 return bvo;
     }
     
     public List<BookVO> blogBest(Connection conn) throws SQLException {
    	  List<BookVO> blogBest = new ArrayList<BookVO>();
    	  BookVO vo = null;
          String sql = "select * from book where bBlog=1";
    	  try {
    	         pstmt = conn.prepareStatement(sql);
    	         rs = pstmt.executeQuery();
    	         if (rs.next()) {
    	            
    	            for(int i=0;i<3;i++){
    	            	rs.next();
    	               vo = new BookVO();
    	               vo.setBISBN(rs.getString("bisbn"));
    	               vo.setBtitle(rs.getString("btitle"));
    	               vo.setBauthor(rs.getString("bauthor"));
    	               vo.setBdiscription(rs.getString("bdiscription"));
    	               vo.setBcover(rs.getString("bcover"));
    	               vo.setBpriceStandard(rs.getInt("bpriceStandard"));
    	               vo.setBpricesales(rs.getInt("bpricesales"));
    	               blogBest.add(vo);
    	            }
    	         }
    	      } finally {
    	         close();
    	      }
    	  
    	  return blogBest;
     }
   

 	public List<BookVO> bookSearch(Connection conn, int start, int end, String mSearchBar) throws SQLException {
 		List<BookVO> searchList = new ArrayList<BookVO>();
 		BookVO vo = null;
 		String sql = "select BISBN, btitle, bauthor, bdiscription, bcover, bpriceStandard, bpriceSales FROM"
 				+ " (select rownum rnum, BISBN, btitle, bauthor, bdiscription, bcover, bpriceStandard, bpriceSales from book where btitle like '%"
 				+ mSearchBar + "%' or bauthor like '%" + mSearchBar + "%' or bpublisher like '%" + mSearchBar + "%')"
 				+ " where rnum >=? and rnum <=?";
 		try {
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setInt(1, start);
 			pstmt.setInt(2, end);
 			rs = pstmt.executeQuery();
 			if (rs.next()) {
 				do {
 					vo = new BookVO();
 					vo.setBISBN(rs.getString("BISBN"));
 					vo.setBtitle(rs.getString("btitle"));
 					vo.setBauthor(rs.getString("bauthor"));
 					vo.setBdiscription(rs.getString("bdiscription"));
 					vo.setBcover(rs.getString("bcover"));
 					vo.setBpriceStandard(rs.getInt("bpriceStandard"));
 					vo.setBpricesales(rs.getInt("bpricesales"));
 					vo.setBno(start++);
 					searchList.add(vo);
 					System.out.println(vo);
 				} while (rs.next());
 			}
 		} finally {
 			close();
 		}

 		return searchList;
 	}

 	public int getSearchCount(Connection conn, String mSearchBar) throws SQLException {
 		int cnt = 0;

 		String sql = "select count(*) FROM"
 				+ " (select rownum rnum, BISBN, btitle, bauthor, bdiscription, bcover, bpriceStandard, bpriceSales from book where btitle like '%"
 				+ mSearchBar + "%' or bauthor like '%" + mSearchBar + "%' or bpublisher like '%" + mSearchBar + "%')";

 		try {
 			stmt = conn.createStatement();
 			rs = stmt.executeQuery(sql);
 			if (rs.next()) {
 				cnt = rs.getInt(1);
 			}
 			System.out.println(cnt + "검색카운트");
 		} finally {
 			close();
 		}
 		return cnt;

 	}
 	
 	
 	public List<BookVO> bestSeller(Connection conn) throws SQLException {
		List<BookVO> bestSeller = new ArrayList<BookVO>();
		BookVO vo = null;
		String sql = "select * from book where bbest=1";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				for (int i = 0; i < 6; i++) {
					rs.next();
					vo = new BookVO();
					vo.setBISBN(rs.getString("bisbn"));
					vo.setBtitle(rs.getString("btitle"));
					vo.setBauthor(rs.getString("bauthor"));
					vo.setBdiscription(rs.getString("bdiscription"));
					vo.setBcover(rs.getString("bcover"));
					vo.setBpriceStandard(rs.getInt("bpriceStandard"));
					vo.setBpricesales(rs.getInt("bpricesales"));
					bestSeller.add(vo);
				}
			}
		} finally {
			close();
		}

		return bestSeller;
	}
	
	public List<BookVO> NewList(Connection conn) throws SQLException {
		List<BookVO> NewList = new ArrayList<BookVO>();
		BookVO vo = null;
		String sql = "select * from book where bnew=1";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				for (int i = 0; i < 6; i++) {
					rs.next();
					vo = new BookVO();
					vo.setBISBN(rs.getString("bisbn"));
					vo.setBtitle(rs.getString("btitle"));
					vo.setBauthor(rs.getString("bauthor"));
					vo.setBdiscription(rs.getString("bdiscription"));
					vo.setBcover(rs.getString("bcover"));
					vo.setBpriceStandard(rs.getInt("bpriceStandard"));
					vo.setBpricesales(rs.getInt("bpricesales"));
					NewList.add(vo);
				}
			}
		} finally {
			close();
		}

		return NewList;
	}
}