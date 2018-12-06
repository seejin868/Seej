package Project_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Project_VO.User1Vo;
import connection.OracleXEConnection;


public class User1DAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public User1DAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}//생성자 end
	
	//회원 추가
	public void addData(User1Vo vo) {
		sb.setLength(0);
		sb.append("insert into user1 ");
		sb.append("values (user1_seq.nextval, ?, ?, ?, ?, ?, 0, ?, 1 ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, vo.getCid());
			pstmt.setString(2, vo.getCnic());
			pstmt.setString(3, vo.getCpw());
			pstmt.setInt(4, vo.getCgen());
			pstmt.setString(5, vo.getCjob());
			pstmt.setString(6, vo.getCtel());
			
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//addData() end
	
	//존재하는 회원인지 파악
	public boolean isExist(String cid, String cpw) {
		
		sb.setLength(0);
		sb.append("select * from user1 ");
		sb.append("where cid = ? and cpw = ? ");
		
		boolean isOk = false;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, cid);
			pstmt.setString(2, cpw);
			
			rs = pstmt.executeQuery();
			
			isOk = rs.next(); //존재여부 파악해서 리턴
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return isOk;
	}//isExist() end
	
		//전체 회원 불러오기
		public ArrayList selectAll() {
			sb.setLength(0);
			sb.append("select * from user1 ");
			
			ArrayList<User1Vo> list = new ArrayList<>();
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					int cno = rs.getInt(1);
					String cid = rs.getString(2);
					String cnic = rs.getString(3);
					String cpw = rs.getString(4);
					int cgen = rs.getInt(5);
					String cjob = rs.getString(6);
					int cpo = rs.getInt(7);
					String ctel = rs.getString(8);
					int cgrade = rs.getInt(9);
					
					User1Vo vo = new User1Vo(cno, cid, cnic, cpw, cgen, cjob, cpo, ctel, cgrade);
					list.add(vo);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
		
		//검색했을때 viewList에 호출되는 메소드
		public ArrayList viewselectAll(User1Vo vo) {
			
			sb.setLength(0);
			sb.append("select * from user1 ");
			
			
			ArrayList<User1Vo> list = new ArrayList<>();
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					int cno = rs.getInt(1);
					String cid = rs.getString(2);
					String cnic = rs.getString(3);
					String cpw = rs.getString(4);
					int cgen = rs.getInt(5);
					String cjob = rs.getString(6);
					int cpo = rs.getInt(7);
					String ctel = rs.getString(8);
					int cgrade = rs.getInt(9);
					
					vo = new User1Vo(cno, cid, cnic, cpw, cgen, cjob, cpo, ctel, cgrade);
					list.add(vo);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
		
		//회원정보에 ID를 받아서 호출하는 메소드
		public User1Vo selectId(String cid) {
			User1Vo vo = null;
			
			sb.setLength(0);
			sb.append("select * from user1 ");
			sb.append("where cid = ? ");
			
			try {
				pstmt=conn.prepareStatement(sb.toString());
				
				pstmt.setString(1, cid);
				
				rs=pstmt.executeQuery();
				while(rs.next()) {
					int cno = rs.getInt(1);
					String cnic = rs.getString("cnic");
					String cpw = rs.getString(4);
					int cgen = rs.getInt(5);
					String cjob = rs.getString(6);
					int cpo = rs.getInt(7);
					String ctel = rs.getString(8);
					int cgrade = rs.getInt(9);
					
					vo = new User1Vo(cno, cid, cnic, cpw, cgen, cjob, cpo, ctel, cgrade);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return vo;

		}
		
		//닉네임 중복 체크 메소드
		
		
		// 수정 메소드
		public void modifyData(User1Vo vo) {
			sb.setLength(0);
			sb.append("update user1 ");
			sb.append("set cnic = ? , ");
			sb.append("cpw = ? , ");
			sb.append("cgen = ? , ");
			sb.append("cjob = ?, ");
			sb.append("ctel = ? ");
			sb.append("where cno = ? ");

			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getCnic());
				pstmt.setString(2, vo.getCpw());
				pstmt.setInt(3, vo.getCgen());
				pstmt.setString(4, vo.getCjob());
				pstmt.setString(5, vo.getCtel());
				pstmt.setInt(6, vo.getCno());
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}//cmodifyData() end
		
		// 삭제 메소드
		public void deleteDate(User1Vo vo) {
			sb.setLength(0);
			sb.append("delete user1 ");
			sb.append("where cno = ? ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				
				pstmt.setInt(1, vo.getCno());
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}//cdeleteDate() end
		
		//check ID 메소드
		public boolean checkId(String id) {
			sb.setLength(0);
			sb.append("select * from user1 ");
			sb.append("where cid = ? ");
			
			boolean isOk = false;
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, id);
				
				rs=pstmt.executeQuery();
				
				isOk=rs.next();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}					
			return isOk;			
		}
		
		//check nic 메소드
				public boolean checkNic(String nic) {
					sb.setLength(0);
					sb.append("select * from user1 ");
					sb.append("where cnic = ? ");
					
					boolean isOk = false;
					
					try {
						pstmt = conn.prepareStatement(sb.toString());
						pstmt.setString(1, nic);
						
						rs=pstmt.executeQuery();
						
						isOk=rs.next();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}					
					return isOk;			
				}
		//check id,pw 메소드
				public boolean checkIdPw(String id, String pw) {
					sb.setLength(0);
					sb.append("select * from user1 ");
					sb.append("where cid = ? and cpw = ? ");
					
					boolean isOk = false;
					
					try {
						pstmt = conn.prepareStatement(sb.toString());
						pstmt.setString(1, id);
						pstmt.setString(2, pw);
						
						rs=pstmt.executeQuery();
						
						isOk=rs.next();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}					
					return isOk;			
				}
				// 자원 반납
				public void close() {
					if(rs!=null) {
						try {
							rs.close();
							if(pstmt!=null) pstmt.close();
							if(conn!=null) conn.close();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}// close() end
	
	// 해당 아이디가 관리자 계정인지 확인 메소드 ( 0 이 관리자 )
	public boolean god(String cid) {
		sb.setLength(0);
		sb.append("select cgrade from user1 ");
		sb.append("where cid = ? ");
		
		boolean isOk = false;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, cid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int member = rs.getInt(1);
				
				if(member==0) {
					isOk = true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return isOk;
	}// god end
	
}//class end
