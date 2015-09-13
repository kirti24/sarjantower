package com.example;

import java.net.URI;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

public class DBConnect {
	@SuppressWarnings("finally")
	public static boolean[] loginCheck(String username,String password){
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
		boolean returnArray[] = {isValid,isValidated};
		try{
			dbUri = new URI(System.getenv("DATABASE_URL"));
			String dbusername = dbUri.getUserInfo().split(":")[0];
			String dbpassword = dbUri.getUserInfo().split(":")[1];
			String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
			conn = DriverManager.getConnection(dbUrl, dbusername, dbpassword);
			stat = conn.prepareStatement("select pass, newpass, isvalidated from accounts where flatno=?");
			stat.setString(1, username);
			rs = stat.executeQuery();
			if(rs.next()){
				String pwd = rs.getString("newpass");
				if(pwd.equals(password)){
					returnArray[0] = true;
					returnArray[1] = true;
				}
				if(!isValid && !rs.getBoolean("isvalidated")) {
					pwd = rs.getString("pass");
					if(pwd.equals(password))
						returnArray[0] = true;
				}
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
			return returnArray;
		}
	}

	@SuppressWarnings("finally")
	public static int insertVote(String username,String event, String vote){
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
		String sql = "";
		int i=0;
		try{
			dbUri = new URI(System.getenv("DATABASE_URL"));
			String dbusername = dbUri.getUserInfo().split(":")[0];
			String dbpassword = dbUri.getUserInfo().split(":")[1];
			String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
			conn = DriverManager.getConnection(dbUrl, dbusername, dbpassword);
			stat = conn.prepareStatement("WITH upsert as (update votes set publicvote=? where flatno=? and event=? RETURNING *) INSERT INTO VOTES (flatno,event,publicvote) SELECT ?,?,? WHERE NOT EXISTS (SELECT * FROM UPSERT)");
			stat.setString(1, vote);
			stat.setString(2, username);
			stat.setString(3, event);
			stat.setString(4, username);
			stat.setString(5, event);
			stat.setString(6, vote);
			i = stat.executeUpdate();
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
			return i;
		}
	}
	
	@SuppressWarnings("finally")
	public static String getVote(String username,String event){
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
		String publicvote="";
		try{
			dbUri = new URI(System.getenv("DATABASE_URL"));
			String dbusername = dbUri.getUserInfo().split(":")[0];
			String dbpassword = dbUri.getUserInfo().split(":")[1];
			String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
			conn = DriverManager.getConnection(dbUrl, dbusername, dbpassword);
			stat = conn.prepareStatement("select publicvote from votes where flatno=? and event=?");
			stat.setString(1, username);
			stat.setString(2, event);
			rs = stat.executeQuery();
			if(rs.next()){
				publicvote = rs.getString("publicvote");
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
			return publicvote;
		}
	}
	
	@SuppressWarnings("finally")
	public static ArrayList<FlatVotes> getAdminData(){
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
		ArrayList<FlatVotes> fv = new ArrayList<FlatVotes>();
		try{
			dbUri = new URI(System.getenv("DATABASE_URL"));
			String dbusername = dbUri.getUserInfo().split(":")[0];
			String dbpassword = dbUri.getUserInfo().split(":")[1];
			String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
			conn = DriverManager.getConnection(dbUrl, dbusername, dbpassword);
			stat = conn.prepareStatement("select flatno,event from votes where flatno!='admin' order by event,flatno");
			rs = stat.executeQuery();
			while(rs.next()){
				fv.add(new FlatVotes(rs.getString("flatno"), rs.getString("event")));
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
			return fv;
		}
	}
	
	@SuppressWarnings("finally")
	public static ArrayList<FlatVotes> getAdminDataCount(){
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
		ArrayList<FlatVotes> fv = new ArrayList<FlatVotes>();
		try{
			dbUri = new URI(System.getenv("DATABASE_URL"));
			String dbusername = dbUri.getUserInfo().split(":")[0];
			String dbpassword = dbUri.getUserInfo().split(":")[1];
			String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
			conn = DriverManager.getConnection(dbUrl, dbusername, dbpassword);
			stat = conn.prepareStatement("select event,count(1) as totalcount from votes where flatno!='admin' group by event");
			rs = stat.executeQuery();
			while(rs.next()){
				fv.add(new FlatVotes(rs.getInt("totalcount")+"",rs.getString("event")));
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
			return fv;
		}
	}
	
	@SuppressWarnings("finally")
	public static void addExpense(String category, String item, double amount, String paidby){
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
		try{
			dbUri = new URI(System.getenv("DATABASE_URL"));
			String dbusername = dbUri.getUserInfo().split(":")[0];
			String dbpassword = dbUri.getUserInfo().split(":")[1];
			String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
			conn = DriverManager.getConnection(dbUrl, dbusername, dbpassword);
			stat = conn.prepareStatement("insert into expenses(category,item,amount,paidby,updatedt) values(?,?,?,?,?)");
			
			stat.setString(1, category);
			stat.setString(2, item);
			stat.setDouble(3, amount);
			stat.setString(4, paidby);
			stat.setTimestamp(5, new Timestamp(new java.util.Date().getTime()));
			rs = stat.executeQuery();
			
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
		}
	}
	
	@SuppressWarnings("finally")
	public static ArrayList<ExpenseList> getExpense(){
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
		ArrayList<ExpenseList> expenselist = new ArrayList<ExpenseList>();
		try{
			dbUri = new URI(System.getenv("DATABASE_URL"));
			String dbusername = dbUri.getUserInfo().split(":")[0];
			String dbpassword = dbUri.getUserInfo().split(":")[1];
			String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
			conn = DriverManager.getConnection(dbUrl, dbusername, dbpassword);
			
			stat = conn.prepareStatement("select ID, category, item, amount, paidby, updatedt from expenses order by updatedt desc");
			rs = stat.executeQuery();
			while(rs.next()){
				expenselist.add(new ExpenseList(rs.getInt("ID"), rs.getString("category"), rs.getString("item"), rs.getDouble("amount"), rs.getString("paidby"), rs.getTimestamp("updatedt")));
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
			return expenselist;
		}
	}
	
	@SuppressWarnings("finally")
	public static void deleteExpense(int id){
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
		try{
			dbUri = new URI(System.getenv("DATABASE_URL"));
			String dbusername = dbUri.getUserInfo().split(":")[0];
			String dbpassword = dbUri.getUserInfo().split(":")[1];
			String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
			conn = DriverManager.getConnection(dbUrl, dbusername, dbpassword);
			stat = conn.prepareStatement("delete from expenses where id = ?");
			
			stat.setInt(1, id);
			rs = stat.executeQuery();
			
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
		}
	}
	
	@SuppressWarnings("finally")
	public static ArrayList<ExpenseList> getExpenseGroupMember(){
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
		ArrayList<ExpenseList> expenselist = new ArrayList<ExpenseList>();
		try{
			dbUri = new URI(System.getenv("DATABASE_URL"));
			String dbusername = dbUri.getUserInfo().split(":")[0];
			String dbpassword = dbUri.getUserInfo().split(":")[1];
			String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
			conn = DriverManager.getConnection(dbUrl, dbusername, dbpassword);
			
			stat = conn.prepareStatement("select sum(amount) as amount, paidby from expenses group by paidby");
			rs = stat.executeQuery();
			while(rs.next()){
				expenselist.add(new ExpenseList(0, "", "", rs.getDouble("amount"), rs.getString("paidby"), null));
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
			return expenselist;
		}
	}
	
	@SuppressWarnings("finally")
	public static ArrayList<ExpenseList> getExpenseGroupType(){
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
		ArrayList<ExpenseList> expenselist = new ArrayList<ExpenseList>();
		try{
			dbUri = new URI(System.getenv("DATABASE_URL"));
			String dbusername = dbUri.getUserInfo().split(":")[0];
			String dbpassword = dbUri.getUserInfo().split(":")[1];
			String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
			conn = DriverManager.getConnection(dbUrl, dbusername, dbpassword);
			
			stat = conn.prepareStatement("select category, sum(amount) as amount from expenses group by category");
			rs = stat.executeQuery();
			while(rs.next()){
				expenselist.add(new ExpenseList(0, rs.getString("category"), "", rs.getDouble("amount"), "", null));
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
			return expenselist;
		}
	}
	
}
