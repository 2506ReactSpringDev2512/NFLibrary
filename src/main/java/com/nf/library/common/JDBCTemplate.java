package com.nf.library.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCTemplate {
	private	final	String	DRIVER_NAME		= "oracle.jdbc.driver.OracleDriver";
	private	final	String	URL				= "jdbc:oracle:thin:@localhost:1521:xe"; 	// localhost -> 데이터베이스 담당 ip로 바꾸기
	private	final	String	USER			= "LIBRARY";								// 데이터베이스 담당 id로 변경
	private	final	String	PASSWORD		= "LIBRARY";								// 데이터베이스 담당 pw로 변경
	
	private	static	JDBCTemplate	instance;
	
	private JDBCTemplate() {}
	
	public	static	JDBCTemplate	getInstance() 	{
		
		if(instance == null) {
			instance = new JDBCTemplate();
		}
		return instance;
		
	}
	
	public 	Connection	getConnection()	{
		
		Connection	conn = null;
		try {
			Class.forName(DRIVER_NAME);
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return conn;
		
	}

	public 	void 	commit(Connection conn) {
		try {
			if (conn != null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public 	void 	rollback(Connection conn) {
		try {
			if (conn != null && !conn.isClosed()) {
				conn.rollback();		
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public 	void 	close(Connection conn) {
		try {
			if (conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
