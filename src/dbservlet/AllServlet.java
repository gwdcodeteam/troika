package dbservlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.Page;
import bean.Employee;
public class AllServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	 //doPost方法
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		    request.setCharacterEncoding("UTF-8");
   		    response.setCharacterEncoding("UTF-8");
			String methodName=request.getParameter("methodName");
			int method=Integer.parseInt(methodName); //将字符串解析为数字
		try {  
			switch(method)
		       {
		    	case 0:
					insert(request,response);
					break;
		        case 1:
                    difpage(request,response);
			        break;    
		    	case 2:
  				    delete(request,response);
  			        break;       
		        case 3:
  				    update(request,response);
  				    break;
		        case 4:
		        	update1(request,response);
			        break;
		        case 5:
		        	dispatch(request,response);
			        break;
		       }
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
	}
	//doGet方法
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
       doPost(request,response);
    }
	//插入方法
	public void insert(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException , IOException,ServletException
	{
    	Connection conn=null;
    	Statement stat=null;
        String name=request.getParameter("name");
        String typeid=request.getParameter("typeid");
        String age=request.getParameter("age");
        String entrydate=request.getParameter("entrydate");
        String staffdesc=request.getParameter("staffdesc");
		conn=Connect.connect();
		stat=conn.createStatement();
    	stat.execute("insert into employee(name,typeid,age,entrydate,staffdesc) values(N'"+name+"',"+typeid+","+age+",'"+entrydate+"',N'"+staffdesc+"')");
    	Connect.close(stat,conn);
    	request.getRequestDispatcher("jump.jsp").forward(request, response);
    }
    //查询方法
    public ArrayList<Employee> select(String id,String name) throws ClassNotFoundException, SQLException{
    	Connection conn=null;
    	Statement stat=null;
	    ResultSet rs=null;
	    conn=Connect.connect();
		stat=conn.createStatement();
    	ArrayList<Employee> result=new ArrayList<Employee>();
    	String s0="select e.id,e.name,e.typeid,e.age,e.entrydate,t.name typename,e.staffdesc from employee e,type t where e.typeid=t.id ";
    	if(id!=""&&name==""){
   	        s0=s0+"and e.id="+id+""; 
     	}
    	if(id==""&&name!=""){
   	        s0=s0+"and e.name like '"+name+"%'"; 
   	    }
    	if(id!=""&&name!=""){
      	    s0=s0+"and e.id="+id+" and e.name like '"+name+"%'"; 
      	}
    	rs=stat.executeQuery(s0);
    	while(rs.next())
        {
    		Employee st=new Employee();
        	st.setId(rs.getInt("id"));
        	st.setName(rs.getString("name"));
        	st.setTypeid(rs.getInt("typeid"));
        	st.setTypename(rs.getString("typename"));
        	st.setAge(rs.getInt("age"));
        	st.setEntrydate(rs.getDate("entrydate"));
        	st.setStaffdesc(rs.getString("staffdesc")); 
        	result.add(st);	
        }
	    if(rs!=null){
	    	  rs.close();
	       }
	    Connect.close(stat,conn);
    	return result;
    }
    //条件查询跳转
    public void dispatch(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException{
    	String id5=request.getParameter("id");
    	String name5=request.getParameter("name");
    	ArrayList<Employee> result=select(id5,name5);
     if(result.isEmpty()){
        	request.getRequestDispatcher("selectnothing.jsp").forward(request, response);
        }
       else{
    		request.setAttribute("result", result);
            request.getRequestDispatcher("idnameselect.jsp").forward(request, response);	
        }
    }
    //设置分页相关参数方法
	public Page setpage(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException{
		String crd=request.getParameter("currentRecord");
		//String id=request.getParameter("id");
      //  String name=request.getParameter("name");
    	ArrayList<Employee> result=select("","");
    	Page pager=new Page();
    	pager.setTotalRecord(result.size()); 
    	pager.setTotalPage(result.size(),pager.getPageSize());
    	if(crd!=null)
        {
    		int currentRecord=Integer.parseInt(crd);
            pager.setCurrentRecord(currentRecord);
            pager.setCurrentPage(currentRecord,pager.getPageSize());
        }
    	return pager;
	}
	//获得分页显示的子集
	 public void difpage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException{
		 ArrayList<Employee> result=select("",""); //返回查询的结果集
		 Page pager=new Page();
		 pager=setpage(request,response);
  	     List<Employee> subResult=null;
  	     int currentRecord=pager.getCurrentRecord();
         if(currentRecord==0){
         	if(pager.getTotalRecord()<8){
         		subResult=(List<Employee>) result.subList(0,pager.getTotalRecord());
         	}
         	else{
         		subResult=(List<Employee>) result.subList(0,pager.getPageSize());
         	}         
         }
         else if(pager.getCurrentRecord()+pager.getPageSize()<result.size())
         {
               subResult=(List<Employee>) result.subList(pager.getCurrentRecord(),pager.getCurrentRecord()+pager.getPageSize());
         }
         else
         {
              subResult=(List<Employee>) result.subList(pager.getCurrentRecord(),result.size());
         }
         request.setAttribute("pager", pager);
	     request.setAttribute("subResult", subResult);
		 request.getRequestDispatcher("layout.jsp").forward(request, response);
     }
    //信息删除方法
    public void delete(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException{
    	Connection conn=null;
    	Statement stat=null;
    	conn=Connect.connect();
 		stat=conn.createStatement();
 		String id2=request.getParameter("id");
		stat.execute("delete from employee where id="+id2+"");
		Connect.close(stat,conn);
		request.getRequestDispatcher("jump.jsp").forward(request, response);
    }
    //信息修改方法
    public void update1(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException{
    	String id4=request.getParameter("id");
	    request.setAttribute("result", select(id4,""));
        request.getRequestDispatcher("update1.jsp").forward(request, response);
    }
    //修改
    public void update(HttpServletRequest request, HttpServletResponse response) 
    throws ClassNotFoundException, SQLException, ServletException, IOException{
    	Connection conn=null;
    	Statement stat=null;
        String id3=request.getParameter("id");
        String name3=request.getParameter("name");
        String typeid3=request.getParameter("typeid");
        String age3=request.getParameter("age");
        String entrydate3=request.getParameter("entrydate");
        String staffdesc3=request.getParameter("staffdesc");
    	conn=Connect.connect();
 		stat=conn.createStatement();
		stat.execute("update employee set id="+id3+",name=N'"+name3+"',typeid="+typeid3+",age="+age3+",entrydate='"+entrydate3+"',staffdesc=N'"+staffdesc3+"' where id="+id3);
		request.setAttribute("result", select(id3,""));    
	    request.getRequestDispatcher("jump.jsp").forward(request, response); 
	    Connect.close(stat,conn);
    }
}


