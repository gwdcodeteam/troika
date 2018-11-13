<%@ page import="java.util.ArrayList"%>
<%@ page import="bean.*"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>员工信息输入</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/demo.css"/>
    <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <!--Framework-->
    <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui.js" type="text/javascript"></script>
    <!--End Framework-->
     <script src="js/jquery.ffform.js" type="text/javascript"></script>
<script type="text/javascript">
    function validate()
    {
	    var name=document.forms[0].name.value;
	    var age=document.forms[0].age.value;
	    var entrydate=document.forms[0].entrydate.value;
	    var staffdesc=document.forms[0].staffdesc.value;
	    if(name==""||age==""||entrydate==""||staffdesc==""){
	    	alert("有空值!");
	    	return false;
	    }
		if(!checkRate(age)||age<0||age>100)
			{
				alert("年龄不合法!");
				return false;
			}
		if(!isDate(entrydate))
			return false;
    	return true;
    }
    function isDate(dateString)
    {
    	  if(dateString.trim()=="")
    		  return true;
    	  var r=dateString.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
    	  if(r==null){
    	   alert("请输入格式正确的日期\n\r日期格式：yyyy-mm-dd");
    	  return false;
    	  }
    	  var d=new Date(r[1],r[3]-1,r[4]);  
    	  var num = (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
    	  if(num==0){
    	   alert("请输入格式正确的日期\n\r日期格式：yyyy-mm-dd\n\r例  如：2008-08-08\n\r");
    	  }
    	  return (num!=0);
    } 
    function checkRate(input)
    {
	    var re = /^[1-9]+[0-9]*]*$/;
	    if (!re.test(input))
		    return false;
	    else
	    	return true;
    }
    </script>
</head>
<body>
	<br>
	<center>
		<h2>员工信息输入</h2>
		<hr>
		<form action="AllServlet" method="post" id="form"
			onSubmit="return validate()">
			<input type="hidden" name="methodName" value="0" />
			<table>
				<tr>
					<td>姓名：</td>
					<td><input type="text" name="name" title="姓名不能为空" placeholder = "例如：郭富城"  class="ctrl"  value="<%=Math.round(Math.random()*9001)+999 %>"/><td>
				</tr>
				<tr>
					<td>职位：</td><td><select name="typeid">
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
					</select><td>
				</tr>
				<tr>
					<td>年龄：</td><td><input type="text" name="age" title="年龄必须为数字" value="<%=Math.round(Math.random()*42)+18 %>"/><td>
				</tr>
				<tr>
					<td>入职日期：</td><td><input type="text" name="entrydate" value=
					"<%=Math.round(Math.random()*10)+2008 %>-<%=
					Math.round(Math.random()*11)+1 %>-<%=
					Math.round(Math.random()*27)+1 %>"
					/><td>
				</tr>
				<tr>
					<td>描述：</td><td><input type="text" name="staffdesc" value="无"/><td>
				</tr>
			</table>
			<input type="submit" value="提交" style="margin-left: 30px"  class="submit"/> <input
				type="button" value="取消" style="margin-left: 30px"
				onclick="javascript:window.location.href='AllServlet?methodName=<%=1 %>&id=<%="" %>&name=<%="" %>';"   class="submit"/>
			<!-- web容器接受Allservlet 然后判断 -->
		</form>
		<br>
		<!--  
  <a href="AllServlet?methodName=<%=1 %>&id=<%="" %>&name=<%="" %>">查看已输入信息</a>
  -->
	</center>
</body>
</html>