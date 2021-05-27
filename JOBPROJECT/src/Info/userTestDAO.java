package Info;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class userTestDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public void insertDB(userInfo user) {
		String sql = "INSERT into TEST_GRADE"
				+ " (u_id, T_name, T_grade, T_date)"
				+ " values (?,?,?,?)";
		
		try {
			con = DBCon.getCon();
			
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getId());
			ps.setString(2, user.getTname());
			ps.setString(3, user.getGrade());
			ps.setString(4, user.getTdate());
			ps.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("test_grade insert 오류");
		
		}finally {
			DBCon.close(con,ps,rs);
		}
		
	}
	
	public userInfo readDB(String userid, String tname) {
		userInfo user = new userInfo();
		
		String sql = "select U_ID, T_NAME, T_GRADE, To_Char(T_date,'yy/MM/dd') from TEST_GRADE where U_ID = '" + userid + "' and T_NAME = '" + tname + "'";
		
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				user.setId(rs.getString("U_ID"));
				user.setTname(rs.getString("T_NAME"));
				user.setGrade(rs.getString("T_GRADE"));
				user.setTdate(rs.getString("To_Char(T_date,'yy/MM/dd')"));
			}
			
		}catch (Exception e) {
			System.out.println("test_grade 읽기 오류");
			
		}finally {
			DBCon.close(con, ps, rs);
		}
		return user;
	}

	public List<userInfo> readAllDB(String userid) {
		ArrayList<userInfo> list = new ArrayList<userInfo>();
		
		String sql = "select U_ID, T_NAME, T_GRADE, To_Char(T_date,'yy/MM/dd') from TEST_GRADE where U_ID = '" + userid + "'";
		
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
		
			while (rs.next()) {
				userInfo user = new userInfo();
				user.setId(rs.getString("U_ID"));
				user.setTname(rs.getString("T_NAME"));
				user.setGrade(rs.getString("T_GRADE"));
				user.setTdate(rs.getString("To_Char(T_date,'yy/MM/dd')"));
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
		String sql = "UPDATE cert_user"
				+ " SET c_name=?, c_date=?"
				+ " WHERE u_id=?";
		
		try {
			con = DBCon.getCon();
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, user.getCname());
			ps.setString(2, user.getCdate());
			ps.setString(3, user.getId());
			ps.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("record 수정 오류");
		
		}finally {
			DBCon.close(con,ps,null);
		}
	}
	
	public void deleteDB(String userid, String cname) {
		String sql = "delete cert_user where u_id=? and c_name=?";
		
		try {
			con = DBCon.getCon();
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, userid);
			ps.setString(2, cname);
			ps.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("record 삭제 오류");
		
		}finally {
			DBCon.close(con,ps,null);
		}
		
	}
	
	
}
