package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import vo.PostimgVO;

public class PostimgDAO {
	
	Connection conn = OracleXEConnection.getInstance().getConnection();
	StringBuffer sb = new StringBuffer();
	
	//모든게시물 조회
	public ArrayList<PostimgVO> selectAll(){
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
			    String pdate = rs.getString("date");
			    
			    list.add(
			    		new PostimgVO(pno, ptitle, pwriter, pcontent, pdraw, pfile, plike, phit, pdate)
			    		);
			    
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	} 
	
	//게시물 검색
	
	
	//게시물 추가
	public void addData(PostimgVO vo){
		ArrayList<PostimgVO> list = new ArrayList<>();
		sb.setLength(0);
		sb.append(" insert into postimg ");
		sb.append(" values( postimg_pno_seq.nextval, ? ,? ,? ,? ,? ,0 ,0 , sysdate) ");
				
		try {
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getPtitle());
			pstmt.setString(2, vo.getPwriter());
			pstmt.setString(3, vo.getPcontent());
			pstmt.setString(4, vo.getPdraw());
			pstmt.setString(5, vo.getPfile());
			pstmt.executeUpdate();
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
	} 
	
/*	// 미리 준비
		public 리턴형 메소드이름(){
			ArrayList<PostimgVO> list = new ArrayList<>();
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
