package Project_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Project_VO.GameVO;
import connection.OracleXEConnection;

public class GameDAO {

	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public GameDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	
	// 전체 조회 리스트
	public ArrayList<GameVO> getAllData() {
		ArrayList<GameVO> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * from mindgame ");
		sb.append("order by currect,g_no desc ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int g_no = rs.getInt(1);
				String g_title = rs.getString(2);
				String g_writer = rs.getString(3);
				String g_content = rs.getString(4);
				String g_file = rs.getString(5);
				int g_like = rs.getInt(6);
				int g_hit = rs.getInt(7);
				String g_date= rs.getString(8);
				String answer= rs.getString(9);
				int currect = rs.getInt(10);
				
				GameVO vo = new GameVO(g_no, g_title, g_writer, g_content, g_file, g_like, g_hit, g_date, answer, currect);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}//getAllData() end;
	
	// 등록
	public void addData(GameVO vo) {
		sb.setLength(0);
		sb.append("insert into mindgame ");
		sb.append("values (MINDGAME_GNO_SEQ.nextval,?,?,?,?,0,0,sysdate,?,0) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, vo.getG_title());
			pstmt.setString(2, vo.getG_writer());
			pstmt.setString(3, vo.getG_content());
			pstmt.setString(4, vo.getG_file());
			pstmt.setString(5, vo.getAnswer());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 수정
	public void modifyData(GameVO vo) {
		sb.setLength(0);
		sb.append("update mindgame ");
		sb.append("set g_title = ? , ");
		sb.append("g_content = ? ");
		sb.append("g_file = ? ");
		sb.append("where g_no = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getG_title());
			pstmt.setString(2, vo.getG_content());
			pstmt.setString(3, vo.getG_file());
			pstmt.setInt(3, vo.getG_no());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//modifyData() end
	
	// 삭제
	public void deleteDate(int g_no) {
		sb.setLength(0);
		sb.append("delete from mindgame ");
		sb.append("where g_no = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, g_no);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//deleteDate() end
	
	// 조회수 증가
	public void raiseHits(int g_no) {
		sb.setLength(0);
		sb.append("update mindgame ");
		sb.append("set g_hit = g_hit+1 ");
		sb.append("where g_no = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, g_no);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// raiseHits() end
	
	// 디테일 보기 ( 한건 )
	public GameVO getDetail(int g_no) {
		sb.setLength(0);
		sb.append("select * from mindgame ");
		sb.append("where g_no = ? ");
		
		GameVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, g_no);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String g_title = rs.getString(2);
			String g_writer = rs.getString(3);
			String g_content = rs.getString(4);
			String g_file = rs.getString(5);
			int g_like = rs.getInt(6);
			int g_hit = rs.getInt(7);
			String g_date = rs.getString(8);
			String answer = rs.getString(9);
			
			vo = new GameVO(g_no, g_title, g_writer, g_content, g_file, g_like, g_hit, g_date, answer);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	// 전체 조회 리스트 ( detail에서 이미 조회된 건 뺀 나머지 전체 리스트 )
	public ArrayList<GameVO> getAllData2(int gno) {
		ArrayList<GameVO> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * from mindgame ");
		sb.append("where not g_no in (?) ");
		sb.append("order by currect, g_no asc ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, gno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int g_no = rs.getInt(1);
				String g_title = rs.getString(2);
				String g_writer = rs.getString(3);
				String g_content = rs.getString(4);
				String g_file = rs.getString(5);
				int g_like = rs.getInt(6);
				int g_hit = rs.getInt(7);
				String g_date= rs.getString(8);
				String answer= rs.getString(9);
				int currect = rs.getInt(10);
				
				GameVO vo = new GameVO(g_no, g_title, g_writer, g_content, g_file, g_like, g_hit, g_date, answer, currect);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}//getAllData2() end;
	
	//메인창에 최신 등록게시글 4개 출력
	public ArrayList<GameVO> main_gameList4() {
		ArrayList<GameVO> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * from ");
		sb.append("(select * from mindgame where currect = 0 order by g_no desc)  ");
		sb.append("where rownum in(1,2,3,4,5) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int g_no = rs.getInt("g_no");
				String g_title = rs.getString("g_title");
				String g_writer = rs.getString("g_writer");
				String g_content = rs.getString("g_content");
				String g_file = rs.getString("g_file");
				int g_like = rs.getInt("g_like");
				int g_hit = rs.getInt("g_hit");
				String g_date= rs.getString("g_date");
				
				GameVO vo = new GameVO(g_no, g_title, g_writer, g_content, g_file, g_like, g_hit, g_date);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	// 시퀀스 last_number 조회
	public int getSeqLastNum() {
		int seqLastNum = 0;
		
		sb.setLength(0);
		sb.append("select last_number from user_sequences ");
		sb.append("where sequence_name = 'MINDGAME_GNO_SEQ' ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			seqLastNum = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return seqLastNum;
	}
	
	// 좋아요 수 1 올리기
	public void increLike(int g_no) {
		sb.setLength(0);
		sb.append("update mindgame ");
		sb.append("set g_like = g_like+1 ");
		sb.append("where g_no = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, g_no);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 좋아요 수 1 내리기
	public void decreLike(int g_no) {
		sb.setLength(0);
		sb.append("update mindgame ");
		sb.append("set g_like = g_like-1 ");
		sb.append("where g_no = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, g_no);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 정답을 마췄을 시 currect 1 로 활성화
	public void currect(int g_no) {
		sb.setLength(0);
		sb.append("update mindgame ");
		sb.append("set currect = 1 ");
		sb.append("where g_no = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, g_no);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 해당 문제가 currect 1 인지 확인
	public boolean isCurrect(int g_no) {
		boolean flag = false;
		
		sb.setLength(0);
		sb.append("select currect from mindgame ");
		sb.append("where g_no = ? and currect = 1 ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, g_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()==true) {
				flag = true;	// 1(정답을 마춤) 이 있으면 true로 리턴
			}else {
				flag = false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
		
		
	}
	
}
