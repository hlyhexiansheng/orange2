package com.orange.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DBManager {
	
	private  static DBManager _instance;
	
	private final ComboPooledDataSource pool;
	
	public static DBManager instance(){
		
		if(_instance == null){
			_instance = new DBManager();
		}
		return _instance;
	}
	
	public DBManager(){
		pool = createConnectionPool();
	}
	
	public Connection getConnection(){
		try {
			return pool.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
    public static void releaseDbResource(ResultSet rs, Statement stmt, Connection conn){
        try{
            if(rs != null){
                rs.close();
                rs = null;
            }
        }
        catch(SQLException ex){
        	ex.printStackTrace();
        }
        try{
            if(stmt != null){
                stmt.close();
                stmt = null;
            }
        }
        catch(SQLException ex){
        	ex.printStackTrace();
        }
        try{
            if(conn != null){
                conn.close();
                conn = null;
            }
        }catch(SQLException ex){
        	ex.printStackTrace();
        }
    }
    
    @SuppressWarnings("unused")
	public ArrayList executeQuery_ObjectList(String cmd, Object params[], ResultObjectBuilder builder){
        Connection conn;
        PreparedStatement stmt;
        ResultSet rs;
        ArrayList objectList;
        conn = null;
        stmt = null;
        rs = null;
        objectList = null;
        try{
            conn = this.getConnection();
            stmt = prepareStatement(conn, cmd, params);
            rs = stmt.executeQuery();
            objectList = getObjectListFromResultSet(rs, builder);
        }
        catch(Exception e){
            
        }finally{
        	releaseDbResource(rs, stmt, conn);	
        }
        return objectList;
    }
    
    
    
    public PreparedStatement prepareStatement(Connection conn, String cmd, Object params[])
    throws SQLException{
	    PreparedStatement stmt = conn.prepareStatement(cmd);
	    if(params != null)
	        setParams(stmt, params);
	    return stmt;
	}
    
    private void setParams(PreparedStatement stmt, Object params[])
    throws SQLException{
    for(int i = 0; i < params.length; i++)
    {
        Object o = params[i];
        if(o instanceof Integer)
            stmt.setInt(i + 1, ((Integer)o).intValue());
        else
        if(o instanceof Short)
            stmt.setShort(i + 1, ((Short)o).shortValue());
        else
        if(o instanceof Long)
            stmt.setLong(i + 1, ((Long)o).longValue());
        else
        if(o instanceof String)
            stmt.setString(i + 1, (String)o);
        else
        if(o instanceof Date)
            stmt.setObject(i + 1, o);
        else
        if(o instanceof Boolean)
            stmt.setBoolean(i + 1, ((Boolean)o).booleanValue());
        else
        if(o instanceof byte[])
            stmt.setBytes(i + 1, (byte[])o);
        else
        if(o instanceof Double)
            stmt.setDouble(i + 1, ((Double)o).doubleValue());
        else
        if(o instanceof Float)
            stmt.setFloat(i + 1, ((Float)o).floatValue());
        else
        if(o == null)
            stmt.setNull(i + 1, 1111);
        else
            throw new SQLException("Not allowed dataBase data type");
    }

}
    
    @SuppressWarnings("unchecked")
	static ArrayList getObjectListFromResultSet(ResultSet rs, ResultObjectBuilder builder)
    {
        if(rs != null)
        {
            ArrayList objectList = null;
            try
            {
                objectList = new ArrayList();
                for(; rs.next(); objectList.add(builder.build(rs)));
            }
            catch(SQLException e){
                
            }
            return objectList;
        } else
        {
            return null;
        }
    }

	
	
    private static ComboPooledDataSource createConnectionPool(){
        ComboPooledDataSource ds = new ComboPooledDataSource();
        try {
        	ds.setDriverClass("com.mysql.jdbc.Driver");	
		} catch (Exception e) {
			e.printStackTrace();
		}
        ds.setJdbcUrl("jdbc:mysql://192.168.2.104/tshirt?" +
		"user=demo&password=demo");
        ds.setInitialPoolSize(2);
        ds.setMinPoolSize(10);
        ds.setMaxPoolSize(50);
        ds.setMaxStatements(100);
        ds.setIdleConnectionTestPeriod(5);
        ds.setMaxIdleTime(1000);
        return ds;
    }
}
