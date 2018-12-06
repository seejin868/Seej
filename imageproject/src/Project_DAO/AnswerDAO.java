package Project_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import Project_VO.AnswerVO;
import connection.OracleXEConnection;

public class AnswerDAO {

	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public AnswerDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	
	// DB에서 a_no length 추출
	private ArrayList<Integer> anoLength() {
		
		ArrayList<Integer> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select a_no from gameanswer ");
		sb.append("where use = 0 ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int a_no = rs.getInt("a_no");
				
				list.add(a_no);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	// a_no length에서 랜덤 값 추출
	private Integer randomANO() {
		ArrayList<Integer> list = anoLength();
		
		Random rnd = new Random();
		if(list.size()!=0) {
			return list.get(rnd.nextInt(list.size()));
		}else {
			return 0;
		}
		
	}
	
	// 랜덤으로 정답 뽑기 ( 정답이 없을 시 a_no 0 으로 리턴 )
	public AnswerVO randomAnswer() {
		
		int a_no = randomANO();
		
		AnswerVO vo = null;
		
		sb.setLength(0);
		sb.append("select * from gameanswer ");
		sb.append("where a_no = ? ");
		
		try {
			if(a_no!=0) {
				pstmt = conn.prepareStatement(sb.toString());
				
				pstmt.setInt(1, a_no);
				
				rs = pstmt.executeQuery();
				
				rs.next();
				
				String answer = rs.getString(2);
				String tag = rs.getString(3);
				int use = rs.getInt(4);
				
				vo = new AnswerVO(a_no, answer, tag, use);
			}else {
				vo = new AnswerVO();
				vo.setA_no(0);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	// 사용한 문제는 use 컬럼 1로 변경하기
	public void usedAnswer(int a_no) {
		sb.setLength(0);
		sb.append("update gameanswer ");
		sb.append("set use = 1 ");
		sb.append("where a_no = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, a_no);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 문제 추가하기
	public void addAnswer(String answer,String tag) {
		sb.setLength(0);
		sb.append("insert into gameanswer ");
		sb.append("values (gameanswer_ano_seq.nextval,?,?,0) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, answer);
			pstmt.setString(2, tag);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 전체 문제 출력
	public ArrayList<AnswerVO> getAllData() {
		ArrayList<AnswerVO> list = new ArrayList<>();
		AnswerVO vo = null;
		
		sb.setLength(0);
		sb.append("select * from gameanswer ");
		sb.append("order by use, a_no ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int a_no = rs.getInt(1);
				String answer = rs.getString(2);
				String tag = rs.getString(3);
				int use = rs.getInt(4);
				
				vo = new AnswerVO(a_no, answer, tag, use);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	
	// 태그 구하기
	public String getTag(String answer) {
		String tag = "";
		
		sb.setLength(0);
		sb.append("select tag from gameanswer ");
		sb.append("where answer = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, answer);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			tag = rs.getString(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tag;
		
	}
	
	// 다시 사용가능하도록 바꾸는 메소드 use = 0
	public void reUse(String answer) {
		sb.setLength(0);
		sb.append("update gameanswer ");
		sb.append("set use = 0 ");
		sb.append("where answer = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, answer);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
