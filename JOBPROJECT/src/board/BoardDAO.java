package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class BoardDAO {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public BoardDTO readDB(int bno) {
		BoardDTO board = new BoardDTO();
		
		String sql = "select * from tbl_board where bno =?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, bno);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				board.setBno(rs.getInt("bno"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setWriter(rs.getString("writer"));
				board.setRegdate(rs.getDate("regdate"));
				board.setUpdatedate(rs.getDate("updatedate"));
			}
			
		}catch (Exception e) {
			System.out.println("아이디 read 오류");
		
		}finally {
			DBCon.close(con, ps, rs);
		}
		
		return board;
	}
	
	public List<BoardDTO> readDBList(int pageNo, int pageLine, String cond, String ctext) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		int end = pageNo * pageLine;
		int start = end - pageLine + 1;
		
		String whereCondition = "";
		if (cond != null & ctext != "") {
			whereCondition = "where " + cond + " like '%" + ctext + "%'";
		}
		
		String sql = "select b.* from "
				+ "(select rownum rn, a.* from "
				+ "(select * from tbl_board " + whereCondition
				+ " order by bno desc)a "
				+ ")b "
				+ " where b.rn between " + start + " and " + end;
	
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setBno(rs.getInt("bno"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setWriter(rs.getString("writer"));
				board.setRegdate(rs.getDate("regdate"));
				board.setUpdatedate(rs.getDate("updatedate"));
				list.add(board);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("list 호출 오류");
		
		}finally {
			DBCon.close(con, ps, rs);
		}
		
		return list;
	}
	
	public int totalCnt() {
		int cnt = 0;
		
		String sql = "select count(bno) from tbl_board";
		
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		
		}finally {
			DBCon.close(con, ps, rs);
		}
		
		return cnt;
	}
	
	public int insertDB(BoardDTO board) {
		int result = -1;
		
		String sql = "insert into TBL_BOARD (bno, title, content, writer)"
				+ " values(?,?,?,?)";
		
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, board.getBno());
			ps.setString(2, board.getTitle());
			ps.setString(3, board.getContent());
			ps.setString(4,  board.getWriter());
			result = ps.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		
		}finally {
			DBCon.close(con, ps, null);
		}
		
		return result;
	}
	
	public int deleteDB(int bno) {
		int result = -1;
		
		String sql = "delete TBL_BOARD where bno=?";
		
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, bno);
			result = ps.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터 삭제 실패");
		
		}finally {
			DBCon.close(con, ps, null);
		}
		
		return result;
	}
	
	public int updateDB(BoardDTO board) {
		int result = -1;
		
		String sql = "update TBL_BOARD set title=?, content=?,"
				+ " updatedate=sysdate where bno=?";
		
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, board.getTitle());
			ps.setString(2, board.getContent());
			ps.setInt(3, board.getBno());
			result = ps.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터 수정 실패");
		
		}finally {
			DBCon.close(con, ps, null);
		}
		
		return result;
	}
	
}
