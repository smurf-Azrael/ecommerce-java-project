package com.kitchenstore.utilities;

import java.sql.Connection;
import java.sql.DriverManager;

public final class JDBCConnection {

	public static final Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/kitchenstore", "root", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}
