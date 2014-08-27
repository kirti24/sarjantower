package com.example;

import java.io.IOException;
import java.net.URI;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
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
	        out.write(dbUrl.getBytes());
	        conn = DriverManager.getConnection(dbUrl, username, password);
	        Statement stat = conn.createStatement();
	        //out.write((conn.isClosed()+"hkjhkj").getBytes());
	        ResultSet rs = stat.executeQuery("select count(*) from BLUE.accounts");
	        if(rs!=null){
	        	out.write(rs.getString(1).getBytes());
	        }
	        else{
	        	out.write("Null rs".getBytes());
	        }
	    }
	    catch (Exception e){
	    	out.write("exception".getBytes());
	    	e.printStackTrace();
	    	//return null;
	    }
	    finally{
	    	out.write("finally".getBytes());
	    	try{
	    		if(conn!=null){
	    			conn.close();
	    		}
	    	}
	    	catch(Exception e){
	    		e.printStackTrace();
	    	}
	    	out.flush();
	        out.close();
	    }
        
    }
    
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
		doPost(req, resp);		
	}
}
