package com.example;

import java.io.IOException;
import java.net.URI;
import java.util.logging.Logger;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        ServletOutputStream out = resp.getOutputStream();
        URI dbUri = null;
        try{
	        dbUri = new URI(System.getenv("DATABASE_URL"));
	
	        String username = dbUri.getUserInfo().split(":")[0];
	        String password = dbUri.getUserInfo().split(":")[1];
	        String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
        }
        catch (Exception e){
        	e.printStackTrace();
        }
        
        String msg = dbUri.getHost() + "|" + dbUri.getPath()+"|"+dbUri.getPort()+"|"dbUri.getUserInfo().split(":")[0]+ "|" + dbUri.getUserInfo().split(":")[1];
        out.write(msg.getBytes());
        out.write("Hello Heroku Version 1".getBytes());
        out.flush();
        out.close();
    }
    
}
