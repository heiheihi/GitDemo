<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
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
     <div id="img"></div>
     <span>${massage}</span>
    <form action="login" method="post">
      <input type="text" name="userAccount" onblur="Verifying()"/><span id="span"></span><br>
       <input type="text" name="password"/><br>
        <input type="submit" value="提交"/>
        <a href="/aaaa/selDepartment">注册</a>
    </form>
  </body>
  <script type="text/javascript" src="/aaaa/js/jquery.min.js"></script>
  <script type="text/javascript">
     function Verifying(){
       var name = $("input[name=userAccount]").val();
       $.post("Verifying","userAccount="+name,function(data){
         if(data!=""){
             $("#img").html("<img src='/aaaa/upload/"+data+"'/>");
             $("#span").html("");
         }else{
            $("#span").html("账号不存在");
            $("#img").html("")
         }
       })
     }
  </script>
</html>
