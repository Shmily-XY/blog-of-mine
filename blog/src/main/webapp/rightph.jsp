<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'right.jsp' starting page</title>
    
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
    <div class="layui-col-md4">

      <div class="fly-panel">
        <h3 class="fly-panel-title">阅读量排行</h3>
        <ul class="fly-panel-main fly-list-static">
        <c:forEach items="${looknumlist}" var="looknumtz" begin="0" end="9">
          <li style="list-style: none;">
            <a href="javascript:;" onclick="tzdetails('${looknumtz.id}')"  style="color:#333333">${looknumtz.title}</a>
          </li>
        </c:forEach>
        </ul>
      </div>


        <div class="fly-panel">
            <h3 class="fly-panel-title">点赞排行</h3>
            <ul class="fly-panel-main fly-list-static">
                <c:forEach items="${dznumlist}" var="dznumdz" begin="0" end="9">
                    <li style="list-style: none;">
                        <a href="javascript:;" onclick="tzdetails('${dznumdz.id}')"   style="color:#333333">${dznumdz.title}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>


        <div class="fly-panel">
            <h3 class="fly-panel-title">评论排行</h3>
            <ul class="fly-panel-main fly-list-static">
                <c:forEach items="${plnumlist}" var="plnumtz" begin="0" end="9">
                    <li style="list-style: none;">
                        <a href="javascript:;" onclick="tzdetails('${plnumtz.id}')"   style="color:#333333">${plnumtz.title}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
      



      
      

    </div>
  <script type="text/javascript">
          function tzdetails(id) {
                          location.replace("tzDetail?id=" + id)
          }
  </script>
  </body>

</html>
