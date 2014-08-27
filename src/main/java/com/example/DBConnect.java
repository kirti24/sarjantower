package com.example;

import java.net.URI;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnect {
	public static String getConnection(){
		URI dbUri = null;
		Connection conn = null;
	    try{
	        dbUri = new URI(System.getenv("DATABASE_URL"));
	        String username = dbUri.getUserInfo().split(":")[0];
	        String password = dbUri.getUserInfo().split(":")[1];
	        String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
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
	
	
}
