package com.manager;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.opensymphony.xwork2.ActionSupport;
import com.orange.db.DBManager;

public class MgClothAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	
	@Override
	public String execute() throws Exception {
		Connection conn = DBManager.instance().getConnection();
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery("select * from clothes;");
		
		while(rs.next()){
			System.out.println(rs.getString(6)+"" + rs.getString(7) + "" + rs.getString(8));
		}
		return SUCCESS;
	}
}
