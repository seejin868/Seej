package Project_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Project_VO.GCommentVO;
import Project_VO.GameVO;
import connection.OracleXEConnection;

public class GCommentDAO {

	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public GCommentDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	
	// 해당 g_no의 전체 리스트 조회
	public ArrayList<GCommentVO> getAllData(int g_no) {
		ArrayList<GCommentVO> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * from game_comments ");
		sb.append("where g_no = ?");
		sb.append("order by gc_no asc ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, g_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int gc_no = rs.getInt(1);
				String gc_writer = rs.getString(2);
				String gc_comment = rs.getString(3);
				String gc_date = rs.getString(4);

				GCommentVO vo = new GCommentVO(gc_no, gc_writer, gc_comment, gc_date, g_no);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}//getAllData() end;
	
	// 댓글 등록
	public void addData(GCommentVO vo,int g_no) {
		sb.setLength(0);
		sb.append("insert into game_comments ");
		sb.append("values (gcomments_gno_seq.nextval,?,?,sysdate,?) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, vo.getGc_writer());
			pstmt.setString(2, vo.getGc_comment());
			pstmt.setInt(3, g_no);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 댓글 수정
	public void modifyData(GCommentVO vo,int g_no,String gc_writer,String comment) {
		sb.setLength(0);
		sb.append("update game_comments ");
		sb.append("set gc_comment = ? ");
		sb.append("where g_no = ? ");
		sb.append("and gc_writer = ? ");
		sb.append("and gc_comment = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getGc_comment());
			pstmt.setInt(2, g_no);
			pstmt.setString(3, gc_writer);
			pstmt.setString(3, comment);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//modifyData() end
	
	// 댓글 삭제
	public void deleteDate(String comment, String gc_writer, int g_no) {
		sb.setLength(0);
		sb.append("delete game_comments ");
		sb.append("where g_no = ? ");
		sb.append("and gc_writer = ? ");
		sb.append("and gc_comment = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, g_no);
			pstmt.setString(2, gc_writer);
			pstmt.setString(3, comment);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//deleteDate() end
	
	// 댓글 글자를 추출 후 [] 안의 정답 추출
	public String userAnswer(String comment) {
		String uAnswer = "";
		if(comment.isEmpty()) {
		}else if(comment.indexOf("[")!=-1 || comment.indexOf("[")!=-1){
			int last = comment.indexOf("]");
			int first = comment.indexOf("[");
			uAnswer = comment.substring(first+1, last);
		}
		return uAnswer;
		
	}
}
