package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import bean.*;
import dbservlet.Connect;

public class typelist {
	
    public  static ArrayList<type> selecttype() throws ClassNotFoundException, SQLException{
    	Connection conn=null;
    	Statement stat=null;
	    ResultSet rs=null;
	    conn=Connect.connect();
		stat=conn.createStatement();
    	ArrayList<type> typeresult=new ArrayList<type>();
		rs=stat.executeQuery("select * from type"); 
		while(rs.next())
        {
    		type ty=new type();
        	ty.setId(rs.getInt("id"));
        	ty.setName(rs.getString("name"));
        	typeresult.add(ty);	
        }
		Connect.close(stat,conn);
    	return typeresult;
    }
}
