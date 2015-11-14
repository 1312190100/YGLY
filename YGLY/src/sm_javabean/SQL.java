package sm_javabean;
import java.sql.*;

public class SQL {
	private Statement stmt = null;
	private Connection conn = null;
	ResultSet rs = null;
	public SQL(){}
	public void OpenConn()throws Exception
	{
		try
		{
			 Class.forName("com.mysql.jdbc.Driver");
			 String url = "jdbc:mysql://localhost:3306/sm?"  + "user=root&password=123456&useUnicode=true&characterEncoding=UTF8";
			 conn = DriverManager.getConnection(url);
		}
		catch(SQLException e)
		{
			System.err.println("Data.executeQuery:"+e.getMessage());
		}
	}
	public ResultSet executeQuery(String sql)
	{
		rs = null;
		try
		{
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		}
		catch(SQLException e)
		{
			System.err.println("Data.executeQuery:"+e.getMessage());
		}
		return rs;
	}
	public void executeUpdata(String sql)
	{
		stmt = null;
		try
		{
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		}
		catch(SQLException e)
		{
			System.err.println("Data.executeUpdate:"+e.getMessage());
		}
	}
	public void closeStmt()
	{
		try
		{
			stmt.close();
		}
		catch(SQLException e)
		{
			System.err.println("Date.executeQuery:"+e.getMessage());
		}
	}
	public void closeConn()
	{
		try
		{
			conn.close();
		}
		catch(SQLException e)
		{
			System.err.println("Date.executeQuery:"+e.getMessage());
		}
	}
}
