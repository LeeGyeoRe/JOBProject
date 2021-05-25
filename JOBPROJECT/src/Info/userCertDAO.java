package Info;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class userCertDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public boolean idcheck(String id) {
		String sql = "select u_pw from users where u_id = '" + id + "'";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if (rs.next())
				return true;
			else
				return false;
			
		}catch (Exception e) {
			 System.out.println("아이디 read 오류");
			 
		}finally {
			DBCon.close(con,ps,rs);
		}
		return false;
	}
	
	public void insertDB(userInfo user) {
		String sql = "INSERT into cert_user"
				+ " (u_id, c_name, c_date)"
				+ " values (?,?,?)";
		
		try {
			con = DBCon.getCon();
			
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getId());
			ps.setString(2, user.getCname());
			ps.setString(3, user.getCdate());
			ps.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("cert_user insert 오류");
		
		}finally {
			DBCon.close(con,ps,rs);
		}
		
	}
	
	public userInfo readDB(String userid, String cname) {
		userInfo user = new userInfo();
		
		String sql = "select U_ID, C_NAME, To_Char(C_date,'yy/MM/dd') from CERT_USER where U_ID = '" + userid + "' and C_NAME = '" + cname + "'";
		
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				user.setId(rs.getString("U_ID"));
				user.setCname(rs.getString("C_NAME"));
				user.setCdate(rs.getString("To_Char(C_date,'yy/MM/dd')"));
			}
			
		}catch (Exception e) {
			System.out.println("cert_user 읽기 오류");
			
		}finally {
			DBCon.close(con, ps, rs);
		}
		return user;
	}

	public List<userInfo> readAllDB(String userid) {
		ArrayList<userInfo> list = new ArrayList<userInfo>();
		
		String sql = "select U_ID, C_NAME, To_Char(C_date,'yy/MM/dd') from CERT_USER where U_ID = '" + userid + "'";
		
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
		
			while (rs.next()) {
				userInfo user = new userInfo();
				user.setId(rs.getString("U_ID"));
				user.setCname(rs.getString("C_NAME"));
				user.setCdate(rs.getString("To_Char(C_date,'yy/MM/dd')"));
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
