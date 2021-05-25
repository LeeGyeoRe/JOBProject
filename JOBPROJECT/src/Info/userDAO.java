package Info;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.*;

public class userDAO {
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
		Date now = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yy/MM/dd");
		String today = sf.format(now);

		String sql = "INSERT into users"
				+ " (u_id, u_pw, u_date)"
				+ " values (?,?,?)";
		
		try {
			con = DBCon.getCon();
			
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getId());
			ps.setString(2, user.getPw());
			ps.setString(3, today);
			ps.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("users insert 오류");
		
		}finally {
			DBCon.close(con,ps,rs);
		}
		
		String sql2 = "INSERT into user_Info"
				+ " (u_id, u_name, ub_date, u_gender, u_tel)"
				+ " values (?,?,?,?,?)";
		
		try {
			con = DBCon.getCon();
			
			ps = con.prepareStatement(sql2);
			ps.setString(1, user.getId());
			ps.setString(2, user.getName());
			ps.setString(3, user.getBirth());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getTel());
			ps.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("user_info insert 오류");
		
		}finally {
			DBCon.close(con,ps,rs);
		}
	}
	
	public userInfo readDB(String userid) {
		userInfo user = new userInfo();
		
		String sql = "select U_ID, U_PW, U_NAME, To_Char(UB_date,'yy/MM/dd'), U_GENDER, U_TEL, To_Char(U_date,'yy/MM/dd') from USER_INFO natural join users where U_ID = '" + userid + "'";
		
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				user.setId(rs.getString("U_ID"));
				user.setPw(rs.getString("U_PW"));
				user.setName(rs.getString("U_NAME"));
				user.setBirth(rs.getString("To_Char(UB_date,'yy/MM/dd')"));
				user.setGender(rs.getString("U_GENDER"));
				user.setTel(rs.getString("U_TEL"));
				user.setDate(rs.getString("To_Char(U_date,'yy/MM/dd')"));
			}
			
		}catch (Exception e) {
			System.out.println("user 읽기 오류");
			
		}finally {
			DBCon.close(con, ps, rs);
		}
		return user;
	}

	public List<userInfo> readAllDB() {
		ArrayList<userInfo> list = new ArrayList<userInfo>();
		
		String sql = "select U_ID, U_PW, U_NAME, To_Char(UB_date,'yy/MM/dd'), U_GENDER, U_TEL, To_Char(U_date,'yy/MM/dd') from user_Info natural join users";
		
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
		
			while (rs.next()) {
				userInfo user = new userInfo();
				user.setId(rs.getString("U_ID"));
				user.setPw(rs.getString("U_PW"));
				user.setName(rs.getString("U_NAME"));
				user.setBirth(rs.getString("To_Char(UB_date,'yy/MM/dd')"));
				user.setGender(rs.getString("U_GENDER"));
				user.setTel(rs.getString("U_TEL"));
				user.setDate(rs.getString("To_Char(U_date,'yy/MM/dd')"));
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
		String sql = "UPDATE user_info"
				+ " SET u_name=?, ub_date=?, u_tel=?"
				+ " WHERE u_id=?";
		
		try {
			con = DBCon.getCon();
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, user.getName());
			ps.setString(2, user.getBirth());
			ps.setString(3, user.getTel());
			ps.setString(4, user.getId());
			ps.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("record 수정 오류");
		
		}finally {
			DBCon.close(con,ps,null);
		}
	}
	
	public void deleteDB(String userid) {
		String sql = "delete user_Info where u_id=?";
		
		try {
			con = DBCon.getCon();
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, userid);
			ps.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("record1 삭제 오류");
		
		}finally {
			DBCon.close(con,ps,null);
		}
		
		String sql2 = "delete users where u_id=?";
		
		try {
			con = DBCon.getCon();
			
			ps = con.prepareStatement(sql2);
			
			ps.setString(1, userid);
			ps.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("record2 삭제 오류");
		
		}finally {
			DBCon.close(con,ps,null);
		}
		
	}
	
	
}
