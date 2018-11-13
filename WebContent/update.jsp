<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="bean.Employee"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>修改成功</title>

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
	<h3>已修改为：</h3>
	<a href="AllServlet?methodName=<%=1 %>&id=<%="" %>&name=<%="" %>" align="right"><——返回</a>
	<table width="450" border="100" cellSpacing=1
		style="font-size: 15pt; border: dashed 1pt" align="center">
		<tr>
			<td>编号</td>
			<td>姓名</td>
			<td>职位</td>
			<td>年龄</td>
			<td>入职日期</td>
			<td>描述</td>
		</tr>
		<%
     response.setCharacterEncoding("UTF-8");
     request.setCharacterEncoding("UTF-8");
       ArrayList<Employee> result=new ArrayList<Employee>();
       result=(ArrayList<Employee>)request.getAttribute("result");
       if(!result.isEmpty()){
       for(int i=0;i<result.size();i++){
    	   Employee st=result.get(i);
            out.print("<tr>");
            out.print("<td>"+st.getId()+"</td>");
            out.print("<td>"+st.getName()+"</td>");
            out.print("<td>"+st.getTypename()+"</td>");
            out.print("<td>"+st.getAge()+"</td>");
            out.print("<td>"+st.getEntrydate()+"</td>");
            out.print("<td>"+st.getStaffdesc()+"</td>"); 
            out.print("</tr>");
              }
       }
     %>
	</table>
</body>
</html>
