package Info;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class userSchDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public void insertDB(userInfo user) {
		String sql = "INSERT into SCH_INFO"
				+ " (s_name, u_id, s_major, s_grade, s_edu, s_date)"
				+ " values (?,?,?,?,?,?)";
		
		try {
			con = DBCon.getCon();
			
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getId());
			ps.setString(3, user.getMajor());
			ps.setString(4, user.getGrade());
			ps.setString(5, user.getCname());
			ps.setString(6, user.getDate());
			ps.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("sch_info insert 오류");
		
		}finally {
			DBCon.close(con,ps,rs);
		}
		
	}
	
	public userInfo readDB(String userid) {
		userInfo user = new userInfo();
		
		String sql = "select S_NAME, U_ID, S_MAJOR, S_GRADE, S_EDU, To_Char(S_date,'yy/MM/dd') from SCH_INFO where U_ID = '" + userid + "'";
		
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				user.setName(rs.getString("S_NAME"));
				user.setId(rs.getString("U_ID"));
				user.setMajor(rs.getString("S_MAJOR"));
				user.setGrade(rs.getString("S_GRADE"));
				user.setCname(rs.getString("S_EDU"));
				user.setDate(rs.getString("To_Char(S_date,'yy/MM/dd')"));
			}
			
		}catch (Exception e) {
			System.out.println("sch_info 읽기 오류");
			
		}finally {
			DBCon.close(con, ps, rs);
		}
		return user;
	}

	public List<userInfo> readAllDB() {
		ArrayList<userInfo> list = new ArrayList<userInfo>();
		
		String sql = "select S_NAME, U_ID, S_MAJOR, S_GRADE, S_EDU, To_Char(S_date,'yy/MM/dd') from SCH_INFO";
		
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
		
			while (rs.next()) {
				userInfo user = new userInfo();
				user.setName(rs.getString("S_NAME"));
				user.setId(rs.getString("U_ID"));
				user.setMajor(rs.getString("S_MAJOR"));
				user.setGrade(rs.getString("S_GRADE"));
				user.setCname(rs.getString("S_EDU"));
				user.setDate(rs.getString("To_Char(S_date,'yy/MM/dd')"));
				list.add(user);
			}
		
		}catch (Exception e) {
			System.out.println("전체 목록 읽기 오류");
		
		}finally {
			DBCon.close(con, ps, rs);
		}
		return list;
		
	}
	
	public void dbUpdate(userInfo user) {
		String sql = "UPDATE sch_info"
				+ " SET s_name=?, s_major=?, s_grade=?, s_edu=?, s_date=?"
				+ " WHERE u_id=?";
		
		try {
			con = DBCon.getCon();
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, user.getName());
			ps.setString(2, user.getMajor());
			ps.setString(3, user.getGrade());
			ps.setString(4, user.getCname());
			ps.setString(5, user.getDate());
			ps.setString(6, user.getId());
			ps.executeUpdate();
			
			
		}catch (Exception e) {
			System.out.println("record 수정 오류");
		
		}finally {
			DBCon.close(con,ps,null);
		}
	}
	
	public void deleteDB(String userid) {
		String sql = "delete sch_info where u_id=?";
		
		try {
			con = DBCon.getCon();
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, userid);
			ps.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("record 삭제 오류");
		
		}finally {
			DBCon.close(con,ps,null);
		}
		
	}
	
	
}
