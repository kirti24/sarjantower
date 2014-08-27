package com.example;

import java.io.IOException;
import java.net.URI;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.logging.Logger;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        ServletOutputStream out = resp.getOutputStream();
        
        
        URI dbUri = null;
		Connection conn = null;
	    try{
	        dbUri = new URI(System.getenv("DATABASE_URL"));
	        String username = dbUri.getUserInfo().split(":")[0];
	        String password = dbUri.getUserInfo().split(":")[1];
	        String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
	        conn = DriverManager.getConnection(dbUrl, username, password);
	        Statement stat = conn.createStatement();
	        out.write((conn.isClosed()+"").getBytes());
	        /*ResultSet rs = stat.executeQuery("select count(*) from accounts");
	        if(rs.next()){
	        	return rs.getString(1);
	        }*/
	    }
	    catch (Exception e){
	    	e.printStackTrace();
	    	//return null;
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
        
        
        //out.write((DBConnect.getConnection()).getBytes());
        //out.write("Hello Heroku Version 1".getBytes());
        out.flush();
        out.close();
    }
    
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
		doPost(req, resp);		
	}
}
