package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import vo.PostimgVO;

public class PostimgDAO {
	
	Connection conn;
	StringBuffer sb;
	
	public PostimgDAO() { 
		conn = OracleXEConnection.getInstance().getConnection();
		sb = new StringBuffer();
	}
	
	//모든게시물 조회
	public ArrayList<PostimgVO> getAll(){
		ArrayList<PostimgVO> list = new ArrayList<>();
		sb.setLength(0);
		sb.append("select * from postimg");
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
			    int pno = rs.getInt("p_no");
			    String ptitle = rs.getString("p_title");
			    String pwriter = rs.getString("p_writer");
			    String pcontent = rs.getString("p_content") ;
			    String pdraw = rs.getString("p_draw");
			    String pfile = rs.getString("p_file");
			    int plike = rs.getInt("p_like");
			    int phit = rs.getInt("p_hit");
			    String pdate = rs.getString("p_date");
			    String pthumbnail=rs.getString("p_thumbnail");
			    
			    list.add(
			    		new PostimgVO(pno, ptitle, pwriter, pcontent, pdraw, pfile, plike, phit, pdate, pthumbnail)
			    		);
			    
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	} 
	
	//하나만 얻어오기
	public PostimgVO getOne(int pno){
		sb.setLength(0);
		sb.append(" select * from postimg ");
		sb.append(" where p_no = ? ");
		PostimgVO vo =null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, pno);
			
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
		    String ptitle = rs.getString("p_title");
		    String pwriter = rs.getString("p_writer");
		    String pcontent = rs.getString("p_content") ;
		    String pdraw = rs.getString("p_draw");
		    String pfile = rs.getString("p_file");
		    int plike = rs.getInt("p_like");
		    int phit = rs.getInt("p_hit");
		    String pdate = rs.getString("p_date");
		    String pthumbnail = rs.getString("p_thumbnail");
			
		    vo = new PostimgVO(pno, ptitle, pwriter, pcontent, pdraw, pfile, plike, phit, pdate, pthumbnail);
		    
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
		
	} 

	
	//게시물 추가
	public void addData(PostimgVO vo){
		sb.setLength(0);
		sb.append(" insert into postimg ");
		sb.append(" values( postimg_pno_seq.nextval, ? ,? ,? ,? ,? ,0 ,0 , sysdate , ? ) ");
				
		try {
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getPtitle());
			pstmt.setString(2, vo.getPwriter());
			pstmt.setString(3, vo.getPcontent());
			pstmt.setString(4, vo.getPdraw());
			pstmt.setString(5, vo.getPfile());
			pstmt.setString(6, vo.getPthumbnail());
			pstmt.executeUpdate();
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
	} 
	//시퀀스 last_number 조회
		public int getSeqLastNum(){
			int seqLastNum = 0;
			sb.setLength(0);
			sb.append(" SELECT LAST_NUMBER FROM USER_SEQUENCES ");
			sb.append(" WHERE SEQUENCE_NAME = UPPER('postimg_pno_seq')");
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(sb.toString());
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				seqLastNum = rs.getInt(1);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return seqLastNum;
		} 
		
	// 내용 변경
		public void updateOne( PostimgVO vo){
			sb.setLength(0);
			
			sb.append(" Update postimg ");
			sb.append(" set p_title = ? ,p_content = ? ,p_file = ? ,p_thumbnail = ? ");
			sb.append(" where  p_no = ? ");
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getPtitle());
				pstmt.setString(2, vo.getPcontent());
				pstmt.setString(3, vo.getPfile());
				pstmt.setInt(4, vo.getPno());
				pstmt.setString(5, vo.getPthumbnail() );
				
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} 

	

// 삭제
		public void deleteOne(int pno){
			sb.setLength(0);
			sb.append("delete from PostImg where p_no = ?");
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, pno);
				
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} 
		

/*	// 미리 준비
		public 리턴형 메소드이름(){
			sb.setLength(0);
			sb.append("");
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(sb.toString());
				
				
				pstmt.execute
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} 
*/
}
