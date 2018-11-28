<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
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
    <form action="/aaaa/insUserInfo" method="post" enctype="multipart/form-data">
    <input type="file" name="files" onchange="showPreview(this)"/>
    <img id="portrait" src="" style="display:none;width: 100px;height: 50px" />
     
       <table>
         <tr>
         <td>用户名:</td>
         <td><input type="text" name="userAccount"/></td>
         </tr>
         <tr>
         <td>密码:</td>
         <td><input type="password" name="password" onblur="pwd()"/><span id="span"></span></td>
         </tr>
         <tr>
         <td>确认密码:</td>
         <td><input type="password" id="newPassword" onblur="bidui()"/></td>
         </tr>
         <tr>
         <td>邮箱:</td>
         <td><input type="text" name="email" onblur="email()"/></td>
         </tr>
         <tr>
         <td>部门:</td>
         <td>
         <select name="deptId">
         <c:forEach items="${listDepartment}" var="dep">
           <option value="${dep.deptid}">${dep.deptname}</option>
            </c:forEach>
         </select>
         </td>
         </tr>
       </table>
       <input type="submit" value="提交"/>
    </form>
  </body>
    <script type="text/javascript" src="/aaaa/js/jquery.min.js"></script>
  <script type="text/javascript">
 
  function pwd(){
  var refpwd = /^[0-9a-zA-Z]{6,18}$/;
  var pwd = $("input[name=password]").val();
  if(!refpwd.test(pwd)){
   alert("密码格式不正确");
  }
  }
  
  function email(){
  var refemail=/^[0-9a-zA-Z]+@[0-9a-zA-Z]{2,3}.(com|cn)$/;
  var email = $("input[name=email]").val();
  alert(email)
    if(!refemail.test(email)){
        alert("邮箱格式不正确");
    }
  }
  
  function showPreview(source) {
      var file = source.files[0];
      if(window.FileReader) {
          var fr = new FileReader();
          console.log(fr);
          var portrait = document.getElementById('portrait');
          fr.onloadend = function(e) {
            portrait.src = e.target.result;
          };
          fr.readAsDataURL(file);
          portrait.style.display = 'block';
      }
    }
  function bidui(){
    var pwd = $("input[name=password]").val();
     var newpwd = $("input[id=newPassword]").val();
     if(newpwd!=pwd){
     alert("两次密码不一致");
     }
  }
  
  </script>
</html>
