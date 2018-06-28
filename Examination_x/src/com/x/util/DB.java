package com.x.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {

	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	Connection con;
	public Connection getcon(){
	
		String url="jdbc:mysql://localhost:3306/q";
		try {
			con=DriverManager.getConnection(url, "xsm", "xsm19980122");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}
