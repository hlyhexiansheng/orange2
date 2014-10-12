package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Test1 {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		Connection conn;
		Statement stmt;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://192.168.2.104/tshirt","root","root");
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from cloth");
		while(rs.next()){
			System.out.println(rs.getInt(1));
		}
	}
}
