package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Account;

public class AccountDAO {
	//Phương thức để kiểm tra đăng nhập hệ thống
			public Account checkLogin(String user, String pass) {
				Account account = null;
				Connection conn = DBConnect.getConnection();
				String sql = "SELECT * FROM account WHERE user =? and pass =?";
				try {
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, user);
					ps.setString(2, pass);
					ResultSet rs = ps.executeQuery();
					while(rs.next()) {
						account = new Account();
						account.setId(rs.getInt(1));
						account.setUser(rs.getString(2));
						account.setPass(rs.getString(3));
						account.setIsSell(rs.getInt(4));
						account.setIsAdmin(rs.getInt(5));
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return account;
			}
			public Account checkExist(String user) {
				Account account = null;
				Connection conn = DBConnect.getConnection();
				String sql = "SELECT * FROM account WHERE user =?";
				try {
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, user);
					ResultSet rs = ps.executeQuery();
					while(rs.next()) {
						account = new Account();
						account.setId(rs.getInt(1));
						account.setUser(rs.getString(2));
						account.setPass(rs.getString(3));
						account.setIsSell(rs.getInt(4));
						account.setIsAdmin(rs.getInt(5));
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return account;
			}
			public void registration(String user, String pass) {
				Connection conn = DBConnect.getConnection();
				String sql = "INSERT INTO account (user, pass, isSell, isAdmin) VALUES (?, ?, 0, 0)";
				try {
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, user);
					ps.setString(2, pass);
					ps.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			
}
