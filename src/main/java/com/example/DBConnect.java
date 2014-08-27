package com.example;

import java.net.URI;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnect {
	public static String getConnection(){
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		URI dbUri = null;
		Connection conn = null;
	    try{
	        String username = "postgres";
	        String password = "admin";
	        String dbUrl = "jdbc:postgresql://" + "localhost" + ':' + "5432" + "/postgres";
	        conn = DriverManager.getConnection(dbUrl, username, password);
	        Statement stat = conn.createStatement();
	        return conn.isClosed()+"";
	        /*ResultSet rs = stat.executeQuery("select count(*) from accounts");
	        if(rs.next()){
	        	return rs.getString(1);
	        }*/
	    }
	    catch (Exception e){
	    	e.printStackTrace();
	    	return null;
	    }
	    finally{
	    	try{
	    		if(conn!=null){
	    			conn.close();
	    		}
	    	}
	    	catch(Exception e){
	    		e.printStackTrace();
	    	}
	    }
	    //return null;
	}
	
	public static void main(String args[]) {
		DBConnect.getConnection();
	}
	
}
