<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="bean.Employee"%>
<%@ page import="bean.*"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/demo.css"/>
<base href="<%=basePath%>">

<title>员工信息修改</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<span>
	<a href="AllServlet?methodName=<%=1 %>&id=<%="" %>&name=<%="" %>">&lt——返回</a>
	修改员工信息
	</span>
	<hr>
	<table width="496" border="100" cellSpacing=1
		style="border: 1pt dashed; font-size: 15pt;" height="31">
		<tr>
			<td>编号</td>
			<td>姓名</td>
			<td>职位</td>
			<td>年龄</td>
			<td>入职时间</td>
			<td>描述</td>
		</tr>
		<%
    	int id=0;
		String nam=null;
		int age=0;
		Date entrydate=null;
		String staffdesc=null;
       ArrayList<Employee> result=new ArrayList<Employee>();
        result=(ArrayList<Employee>)request.getAttribute("result");
       if(!result.isEmpty())
       {
	       for(int i=0;i<result.size();i++)
	       {
	    	   Employee st=result.get(i);
	            id=st.getId();
	            nam=st.getName();
	            age=st.getAge();
	            entrydate=st.getEntrydate();
	            staffdesc=st.getStaffdesc();
	            out.print("<tr>");
	            out.print("<td>"+id+"</td>");
	            out.print("<td>"+nam+"</td>");
	            out.print("<td>"+st.getTypename()+"</td>");
	            out.print("<td>"+age+"</td>");
	            out.print("<td>"+entrydate+"</td>");
	            out.print("<td>"+staffdesc+"</td>"); 
	            out.print("</tr>");
	        }
       }
     %>
	</table>
	<h3>将员工信息更改为：</h3>
	<form action="AllServlet" method="post">
	<input type="submit" value="保存" />
		<input type="hidden" name="methodName" value="3" />
		<h4>
			编号：<input type="text" name="id" value="<%=id %>" readOnly="true"
				title="编号不能改变"></input>（编号不可修改）<br>
		</h4>
		<h4>
			姓名：<input type="text" name="name" value="<%=nam %>" title="姓名不能为空"></input><br>
		</h4>
		<h4>
			职位：<select name="typeid">
				<%ArrayList<type> st=typelist.selecttype();
				if (!st.isEmpty()) 
				{
					for (int i = 0; i < st.size(); i++) 
					{
						type ty = st.get(i);
						out.print("<option value="+ty.getId()+">" + ty.getName() + "</option>");
					}
				}
			%>
			</select><br>
		</h4>
		<h4>
			年龄：<input type="text" name="age" value="<%=age %>" title="年龄不能为空"></input><br>
		</h4>
		<h4>
			入职时间：<input type="text" name="entrydate" value="<%=entrydate %>"></input><br>
		</h4>
		<h4>
			描述：<input type="text" name="staffdesc" value="<%=staffdesc %>"></input><br>
		</h4>
	</form>
</body>
</html>