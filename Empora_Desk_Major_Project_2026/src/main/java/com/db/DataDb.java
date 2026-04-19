package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.http.HttpServletRequest;

public class DataDb {
	public Connection connection = null;
	
	private String db_name = "empora_desk_db";
	private String user_name = "root";
	private String pass = "";
	private String server_type = "xampp"; // "xampp" db backup for xampp
	// private String server_type = "wamp"; // "wamp" db backup for wamp
	
	public String getDb_name() {
		return db_name;
	}

	public String getUser_name() {
		return user_name;
	}
	
	public String getPass() {
		return pass;
	}
	
	public String getServer_type() {
		return server_type;
	}


	public DataDb(HttpServletRequest request) {
		// HttpSession session = request.getSession();
		try {
			
			// String temp = (String) session.getAttribute("schtype");
			Class.forName("com.mysql.jdbc.Driver").getConstructors();
			String Server = "localhost:3306";
			String database = null, user = null, password = null;
			
			database = db_name;
			user = user_name;
			password = pass;
			
			connection = DriverManager.getConnection("jdbc:mysql://" + Server
					+ "/" + database, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}



