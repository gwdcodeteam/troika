package dbservlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Connect {
	//数据库连接方法
		public static Connection connect() throws ClassNotFoundException, SQLException{
	    	Connection conn=null; 
		    Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/employee?characterEncoding=utf-8&amp;useSSL=false"; 
		    String user="root";
			String password="mysql"; 
			conn=DriverManager.getConnection(url,user,password); 
			return conn;
		}
		//关闭数据库资源
		public static void close(Statement stat,Connection conn) throws SQLException{
			if(stat!=null){
		    	   stat.close();
		    }
		    if(conn!=null){
		    	   conn.close();
		    }
		}
}
