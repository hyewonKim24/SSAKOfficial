package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import member.model.*;

public class memberDAO {

	private PreparedStatement pstmt = null;
	private Statement stmt=null;
	private ResultSet rs = null;

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

//	MID           NOT NULL VARCHAR2(30)  
//	MPW           NOT NULL VARCHAR2(20)  
//	MNAME         NOT NULL VARCHAR2(20)  
//	MEMAIL        NOT NULL VARCHAR2(50)  
//	MPHONE        NOT NULL VARCHAR2(20)  
//	MZIP_CODE              VARCHAR2(10)  
//	M_FIRST_ADDR           VARCHAR2(120) 
//	M_SECOND_ADDR          VARCHAR2(90)  
//	MDATE                  DATE          
//	MBIRTHDAY     NOT NULL NUMBER(8)     
//	MGENDER       NOT NULL VARCHAR2(1)   
//	AUTHORITY     NOT NULL NUMBER(1) 

	// 회원가입하는 메소드
	public int registerMember(Connection conn, memberVO mvo) {
		System.out.println("INSERT 시작");
		int result = 0;
		String sql = "insert into member(mid,mpw,mname,memail,mphone,mzip_code,m_first_addr,m_second_addr,mbirthday,mgender,authority,mno) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,mb_seq.nextval)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mvo.getMid());
			pstmt.setString(2, mvo.getMpw());
			pstmt.setString(3, mvo.getMname());
			System.out.println(mvo.getMname() + mvo.getMemail());
			pstmt.setString(4, mvo.getMemail());
			pstmt.setString(5, mvo.getMphone());
			pstmt.setString(6, mvo.getMzip_code());
			pstmt.setString(7, mvo.getM_first_addr());
			pstmt.setString(8, mvo.getM_second_addr());
			pstmt.setInt(9, mvo.getMbirthday());
			pstmt.setInt(10, mvo.getMgender());
			pstmt.setInt(11, mvo.getAuthority());
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;

	}

	//회원 정보 List로 뿌리는 메소드(아직 구현 ㄴㄴ)
	public List<memberVO> memberlist(Connection conn) {

		List<memberVO> mvo = new ArrayList<memberVO>();
		memberVO m = null;
		Statement stmt = null;
		String sql = "select * from member01";
		ResultSet rs = null;

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				do {
					m = new memberVO();
					// m.setId(rs.getString("id"));
					mvo.add(m);
					System.out.println(m + "추가됨");
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return mvo;
	}

	//로그인시 객체를 받아오는 메소드
	@SuppressWarnings("resource")
	public memberVO loginMember(Connection conn, String mid, String mpw) throws SQLException {
		// id만 가지고 들어가서 pw를 꺼냄.
		// id를 찾는데 pw가 없으면 id 자체가 없는 것.
		// id가 있을때는 입력받은 pw와 db의 값을 비교 (rs~pw)
		// memberVO에 int형 컬럼값을 하나 추가해서 id가 다른 경우, pw가 다른 경우 등등 체크해서 넘겨주어야함.
		// memberVO Login_type int형이 0인 경우 : id자체가 존재하지 않음.
		// memberVO Login_type int형이 1인 경우 : id가 존재하지만, id와 pw가 일치하지 않음.
		// memberVO Login_type int형이 2인 경우 : id와 pw가 일치함 => 로그인 시킴.
		String wrer_sql ="select * from withdraw where mid=?";
		memberVO m = null;
		PreparedStatement pstmt = null;
		String sql = "select *from member where mid=?";
		ResultSet rs = null;
		try {
			//탈퇴한 회원인지 확인후 로그인 시킴.
			pstmt=conn.prepareStatement(wrer_sql);
			pstmt.setString(1, mid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m = new memberVO();
				m.setLogin_type(3);
			}
			else {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if (rs.next() == true) {
				m = new memberVO();
				System.out.println(mpw);
				System.out.println(rs.getString("mpw"));
				if (rs.getString("mpw").equals(mpw)) {
					m.setMid(rs.getString("mid"));
					m.setMpw(rs.getString("mpw"));
					m.setMemail(rs.getString("memail"));
					m.setMname(rs.getString("mname"));
					m.setMgender(rs.getInt("mgender"));
					m.setMbirthday(rs.getInt("mbirthday"));
					m.setMphone(rs.getString("mphone"));
					m.setMzip_code(rs.getString("mzip_code"));
					m.setAuthority(rs.getInt("authority"));
					m.setM_first_addr(rs.getString("m_first_addr"));
					m.setM_second_addr(rs.getString("m_second_addr"));
					m.setMdate(rs.getDate("mdate"));
					m.setLogin_type(2);
				}
			 else if (rs.getString("mpw") != mpw) {
				m = new memberVO();
				System.out.println("아이디랑 비밀번호 일치하지 않은 경우");
				m.setLogin_type(1);
			 }
			} else {
				m = new memberVO();
				m.setLogin_type(0);
			}
		} } finally {
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
		}

		return m;
	}
	
	//아이디 찾기 메소드
	public memberVO idSearch(Connection conn,String mname,String memail) throws SQLException {
		memberVO m=null;
		PreparedStatement pstmt = null;
		String sql = "select *from member where mname=? and memail=?";
		ResultSet rs = null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mname);
			pstmt.setString(2, memail);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				m=new memberVO();
				m.setMid(rs.getString("mid"));
			}
		}finally {
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
		}
		return m;
	}
	
	//비밀번호 찾기 메소드
	public boolean pwSearch(Connection conn,String mid, String memail) throws SQLException {
		PreparedStatement pstmt=null;
		String sql ="select *from member where mid=? and memail=?";
		ResultSet rs=null;
	
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, memail);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				return true;
			}else {
				return false;
			}
			
		}finally {
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
		}
	}
	
	//임시비밀번호로 변경하는 메소드
	public int tmpPwUpdate(Connection conn,String mid,String tempPw) {
		int rs=0;
		PreparedStatement pstmt=null;
		String sql="update member set mpw=? where mid=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, tempPw);
			pstmt.setString(2, mid);
			rs=pstmt.executeUpdate();
			System.out.println(mid+tempPw+"dao 메소드 rs는"+rs);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	//아이디 중복 체크 메소드
	public boolean isIdChk(Connection conn, String mid) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "select * from member where mid=?";
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			return rs.next();

		} finally {
			close();
		}

	}
	
	//이메일 중복 체크 메소드
	public boolean isEmailChk(Connection conn, String memail) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "select * from member where memail=?";
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memail);
			rs = pstmt.executeQuery();
			return rs.next();

		} finally {
			close();
		}

	}
	
	public int myPageUpdate(Connection conn,memberVO mvo) throws SQLException {
		int rs=0;
		PreparedStatement pstmt=null;
		System.out.println("update dao들어옴 mid는" +mvo.getMid()+"pw는 "+mvo.getMpw());
		String sql="update member set mpw=?, mphone=?, mzip_code=?, m_first_addr=?, m_second_addr=?, mbirthday=? where mid=?";
		try {
			if(conn!=null) {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mvo.getMpw());
			pstmt.setString(2, mvo.getMphone());
			pstmt.setString(3, mvo.getMzip_code());
			pstmt.setString(4, mvo.getM_first_addr());
			pstmt.setString(5, mvo.getM_second_addr());
			pstmt.setInt(6, mvo.getMbirthday());
			pstmt.setString(7, mvo.getMid());
			rs=pstmt.executeUpdate();
			System.out.println(rs+"마이페이지 변경완료");
			}
		}finally {
			if(pstmt!=null)
				pstmt.close();
		}
		return rs;
	}

	
	//-------------------------이혜림 추가
	// 공지사항 검색했을때 뿌려지는 애들
		   //// qna option별 검색
		   public List<memberVO> memberSearch(Connection conn, String mtype, String msearchbar, int start, int end)
		         throws SQLException {
		      List<memberVO> mlist = new ArrayList<memberVO>();
		      memberVO mvo = null;
		      System.out.println("다오에 접근");
		      try {
		         if (mtype == null || mtype =="") {
		            String sql = "select * from (select ROWNUM rnum, m.* from (select * from member where mid like ? or mname like ? order by mno) m) where rnum >= ? and rnum <= ?";
		            pstmt = conn.prepareStatement(sql);
		            pstmt.setString(1, "%" + msearchbar + "%");
		            pstmt.setString(2, "%" + msearchbar + "%");
		            pstmt.setInt(3, start);
		            pstmt.setInt(4, end);
		            rs = pstmt.executeQuery();

		         } else if (mtype.equals("1")) {
		            String sql = "select * from (select ROWNUM rnum, m.* from (select * from member where mid like ? or mname like ? order by mno) m) where rnum >= ? and rnum <= ?";
		            pstmt = conn.prepareStatement(sql);
		            pstmt.setString(1, "%" + msearchbar + "%");
		            pstmt.setString(2, "%" + msearchbar + "%");
		            pstmt.setInt(3, start);
		            pstmt.setInt(4, end);
		            rs = pstmt.executeQuery();

		         } else if (mtype.equals("2")) {
		            String sql = "select * from (select ROWNUM rnum, m.* from (select * from member where mid like ? order by mno) m) where rnum >= ? and rnum <= ?";
		            pstmt = conn.prepareStatement(sql);
		            pstmt.setString(1, "%" + msearchbar + "%");
		            pstmt.setInt(2, start);
		            pstmt.setInt(3, end);
		            rs = pstmt.executeQuery();
		         } else if (mtype.equals("3")) {
			            String sql = "select * from (select ROWNUM rnum, m.* from (select * from member where mname like ? order by mno) m) where rnum >= ? and rnum <= ?";
			            pstmt = conn.prepareStatement(sql);
			            pstmt.setString(1, "%" + msearchbar + "%");
			            pstmt.setInt(2, start);
			            pstmt.setInt(3, end);
			            rs = pstmt.executeQuery();
			         } 
		         if (rs.next()) {
		            do {
		            	mvo = new memberVO();
						mvo.setMno(rs.getInt("mno"));
						mvo.setMid(rs.getString("mid"));
						mvo.setMname(rs.getString("mname"));
						mvo.setMgender(rs.getInt("mgender"));
						mvo.setMbirthday(rs.getInt("mbirthday"));
						mvo.setMemail(rs.getString("memail"));
						mvo.setM_first_addr(rs.getString("m_first_addr"));
						mlist.add(mvo);
		            } while (rs.next());
		         }
		      } finally {
		         close();
		      }
		      return mlist;
		   }

		   ////검색 총 결과 수
		   public int memberSearchCount(Connection conn, String mtype, String msearchbar) throws SQLException {
		      int cnt = 0;
		      Integer b = null;
		      try {
		    	  if (mtype == null || mtype == "") {
			            String sql = "select COUNT(*) from (select ROWNUM rnum, m.* from (select * from member where mid like ? or mname like ? order by mno) m)";
			            pstmt = conn.prepareStatement(sql);
			            pstmt.setString(1, "%" + msearchbar + "%");
			            pstmt.setString(2, "%" + msearchbar + "%");
			            rs = pstmt.executeQuery();

		    	  } else if (mtype.equals("1")) {
			            String sql = "select COUNT(*) from (select ROWNUM rnum, m.* from (select * from member where mid like ? or mname like ? order by mno) m)";
			            pstmt = conn.prepareStatement(sql);
			            pstmt.setString(1, "%" + msearchbar + "%");
			            pstmt.setString(2, "%" + msearchbar + "%");
			            rs = pstmt.executeQuery();

			      } else if (mtype.equals("2")) {
			            String sql = "select COUNT(*) from (select ROWNUM rnum, m.* from (select * from member where mid like ? order by mno) m) ";
			            pstmt = conn.prepareStatement(sql);
			            pstmt.setString(1, "%" + msearchbar + "%");
			            rs = pstmt.executeQuery();
			            
			       } else if (mtype.equals("3")) {
			            String sql = "select COUNT(*) from (select ROWNUM rnum, m.* from (select * from member where mname like ? order by mno) m)";
			            pstmt = conn.prepareStatement(sql);
			            pstmt.setString(1, "%" + msearchbar + "%");
			            rs = pstmt.executeQuery();
			        }
		         if (rs.next()) {
		            cnt = rs.getInt(1);
		         }
		      } finally {
		         close();
		      }
		      return cnt;
		   }
		   
	// 멤버 리스트 첫 목록 - 총 글 개수 
		// 공지사항 전체 목록 메소드
			public List<memberVO> getBoardPage (Connection conn, int start, int end) throws SQLException{
				List<memberVO> mlist = new ArrayList<memberVO>();
				memberVO mvo = null;
				String sql = "select * from (select ROWNUM rnum, m.* from (select * from member order by mno desc) m) where rnum >= ? and rnum <= ?";
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, start);
					pstmt.setInt(2, end);
					rs = pstmt.executeQuery();			
					if(rs.next()) {
						do {
							mvo = new memberVO();
							mvo.setMno(rs.getInt("mno"));
							mvo.setMid(rs.getString("mid"));
							mvo.setMname(rs.getString("mname"));
							mvo.setMgender(rs.getInt("mgender"));
							mvo.setMbirthday(rs.getInt("mbirthday"));
							mvo.setMemail(rs.getString("memail"));
							mvo.setM_first_addr(rs.getString("m_first_addr"));
							mlist.add(mvo);
						}while(rs.next());
					}
				}finally {
					close();
				}
				return mlist;
			}
			//페이징
			public int getBoardCount(Connection conn) throws SQLException {
				int cnt = 0;
				String sql = "select COUNT(*) from member";
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


			
		
		public memberVO memberDetail(Connection conn, String mid) throws SQLException {
			memberVO mvo = null;
			String sql = "select * from member where mid =?";
			try {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				rs = pstmt.executeQuery();
				if(rs.next()){
					mvo = new memberVO();
					mvo.setMno(rs.getInt("mno"));
					mvo.setMid(rs.getString("mid"));
					mvo.setMname(rs.getString("mname"));;
					mvo.setMemail(rs.getString("memail"));
					mvo.setMphone(rs.getString("mphone"));
					mvo.setM_first_addr(rs.getString("m_first_addr"));
					mvo.setM_second_addr(rs.getString("m_second_addr"));
					mvo.setMbirthday(rs.getInt("mbirthday"));
					mvo.setMdate(rs.getDate("mdate"));
					mvo.setAuthority(rs.getInt("authority"));
					mvo.setMgender(rs.getInt("mgender"));
				}
			
			} finally {
				close();
			}
			return mvo;
		}
		public int memberUpdate(Connection conn, memberVO mvo, String mid) throws SQLException{
			int result =0;
			String sql="update member set mname=?, memail=?, mphone=?, m_first_addr=?, m_second_addr=?, mbirthday=?, authority=?, mgender=? where mid =?";
			try {
				System.out.println("update까지 옴");
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, mvo.getMname());
				pstmt.setString(2, mvo.getMemail());
				pstmt.setString(3, mvo.getMphone());
				pstmt.setString(4, mvo.getM_first_addr());
				pstmt.setString(5, mvo.getM_second_addr());
				pstmt.setInt(6, mvo.getMbirthday());
				pstmt.setInt(7, mvo.getAuthority());
				pstmt.setInt(8, mvo.getMgender());
				pstmt.setString(9, mid);
				result = pstmt.executeUpdate();
			}finally {
				close();
			}
			return result;
		}

		
		
}
