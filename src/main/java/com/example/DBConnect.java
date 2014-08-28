package com.example;

import java.net.URI;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnect {
	@SuppressWarnings("finally")
	public static boolean loginCheck(String username,String password){
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		URI dbUri = null;
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		boolean isValid = false;
		try{
			dbUri = new URI(System.getenv("DATABASE_URL"));
			String dbusername = dbUri.getUserInfo().split(":")[0];
			String dbpassword = dbUri.getUserInfo().split(":")[1];
			String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
			conn = DriverManager.getConnection(dbUrl, dbusername, dbpassword);
			stat = conn.prepareStatement("select count(*) from accounts where flatno=?");
			stat.setString(1, username);
			rs = stat.executeQuery();
			if(rs!=null){
				isValid = true;
			}
		}
		catch (Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(rs!=null){
					rs.close();
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
			try{
				if(stat!=null){
					stat.close();
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
			try{
				if(conn!=null){
					conn.close();
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
			return isValid;
		}
	}
	
}
