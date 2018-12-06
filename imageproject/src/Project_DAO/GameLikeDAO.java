package Project_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.OracleXEConnection;

public class GameLikeDAO {
	
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public GameLikeDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	
	// 해당 게시물 추천 누름
	public void CheckTo(int g_no, int cno) {
		sb.setLength(0);
		sb.append("insert into game_like ");
		sb.append("values(gamelike_glno_seq.nextval, 0, ?, ?) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, g_no);
			pstmt.setInt(2, cno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	// 한번 더눌러서 추천 제거 row 삭제
	public void CheckOut(int g_no, int cno) {
		sb.setLength(0);
		sb.append("delete from game_like ");
		sb.append("where g_no = ? and cno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, g_no);
			pstmt.setInt(2, cno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// CheckOut() end...
	
	// 추천 하나 오르기
	public void CheckLike(int g_no, int cno) {
		sb.setLength(0);
		sb.append("update game_like ");
		sb.append("set gl_like = gl_like+1 ");
		sb.append("where g_no = ? and cno = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, g_no);
			pstmt.setInt(2, cno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void CheckLike_Cancel(int g_no, int cno) {
		sb.setLength(0);
		sb.append("update game_like ");
		sb.append("set gl_like = 0 ");
		sb.append("where g_no = ? and cno = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, g_no);
			pstmt.setInt(2, cno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 해당 게시물 추천 여부
	public boolean likeTF(int g_no, int cno) {
		sb.setLength(0);
		sb.append("select gl_like ");
		sb.append("from game_like ");
		sb.append("where g_no = ? and cno = ? ");
		
		boolean flag = false; // 추천을 안했다면 false
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, g_no);
			pstmt.setInt(2, cno);
			
			rs = pstmt.executeQuery();
			
			int check = 0;
			
			if(rs.next()) {
				check = rs.getInt(1);
				if(check == 1) { // 추천했으면 
					flag = true; // 이미 추천했다면 true
				}else if(check == 0) {
					flag = false;		// 추천을 안했으면 false
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag; 
		
	}
}
