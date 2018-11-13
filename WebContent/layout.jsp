<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="bean.Employee"%>
<%@ page import="bean.Page"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>员工信息</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/demo.css"/>
<script type="text/javascript">
    function confirmdialog(){
       if(window.confirm("您确定要删除此条信息？")){
       return true;
       }
       else{
    	   return false;
       }      
    }
 </script>
</head>
<body>
	<div id="container">
		<div id="header">
			<h1>员工信息
			<a href=""javascript:window.location.href='putin.jsp';""><button align="right" id="button1">添加员工信息</button></a>
			</h1>
		</div>
		<div id="menu">
			<table width="90%" border="0" cellSpacing=0 align="center">
				<tr><td>编号</td><td>姓名</td><td>年龄</td>
					<td>入职日期</td><td>职位</td><td>描述</td><td>操作</td></tr>
				<%
						response.setCharacterEncoding("UTF-8");
						request.setCharacterEncoding("UTF-8");
						Page pager = (Page) request.getAttribute("pager");
						List<Employee> subResult = (List<Employee>) request
								.getAttribute("subResult");
						if (!subResult.isEmpty()) {
							for (int i = 0; i < subResult.size(); i++) {
								Employee st = subResult.get(i);
								out.print("<tr>");
								out.print("<td><a href=AllServlet?id="+st.getId()+"&name="+"&methodName=4>"+ st.getId() + "</a></td>");
								out.print("<td>" + st.getName() + "</td>");
								out.print("<td>" + st.getAge() + "</td>");
								out.print("<td>" + st.getEntrydate() + "</td>");
								out.print("<td>" + st.getTypename() + "</td>");
								out.print("<td>" + st.getStaffdesc() + "</td>");
					%>
				<td align="center" weight="50"><a href="AllServlet?id=<%=st.getId()%>&methodName=<%=2%>"
					onclick="return confirmdialog()"><button>删除</button></a></td>
				<%
						out.print("</tr>");
							}
						}
					%>
			</table>
			<div  id="footer">
			<font size="5">总<%=pager.getTotalRecord()%>条记录|总<%=pager.getTotalPage()%>页
					|当前<%=pager.getCurrentPage() + 1%>页|每页<%=pager.getPageSize()%>条| <%
					int last = pager.getCurrentRecord() - pager.getPageSize();
					int next = pager.getCurrentRecord() + pager.getPageSize();
					int currentRecord;
					if (last < 0) {
						out.println("已是首页|");
					} else {
						out.print("<a href='AllServlet?currentRecord=" + last
								+ "&methodName=1'>上一页</a>|");
					}
					if (next >= pager.getTotalRecord()) {
						out.println("已是尾页|");
					} else {
						out.print("<a href='AllServlet?currentRecord=" + next
								+ "&methodName=1'>下一页</a>|");
					}
				%>
			</font>
			</div>
			<br>
		</div>
		<div>
			<form action="AllServlet" method="post" align="center">
				<input type="hidden" name="methodName" value="5" />
				<h3 align="center">按编号姓名查询:</h3>
			<table style="font-size: 15pt;" height="100" align="center">
				<tr><td>编号：</td><td> <input type="text" name="id" value="" title="编号必须为数字"></input></td></tr>
				<tr><td>姓名或姓：</td><td> <input type="text" name="name" value="" title=""></input></td></tr>
			</table>
			<div align="center"><input type="submit" value="查询" id="button"/></div>
			</form>
		</div>
		<br>
	</div>
</body>
</html>