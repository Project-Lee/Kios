package com.jy.kios;
import java.sql.*;

public class Dao {
	public Connection getCon() throws Exception {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String userName = "hr";
		String userPassword = "orcl";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url, userName, userPassword);
		System.out.println("Connection login! ^ ^ ★");
		return con;
	}
}
