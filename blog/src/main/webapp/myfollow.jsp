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
    <base href="<%=basePath%>">
    <title>博客系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="/blog/res/layui/css/layui.css">
  	<link rel="stylesheet" href="/blog/res/css/global.css">
  </head>
  
  <body>
    <jsp:include page="top.jsp"></jsp:include>
	<div class="layui-container fly-marginTop fly-user-main">
        <jsp:include page="left.jsp"></jsp:include>
	
	  <div class="site-tree-mobile layui-hide">
	    <i class="layui-icon">&#xe602;</i>
	  </div>
	  <div class="site-mobile-shade"></div>
	  
	  <div class="site-tree-mobile layui-hide">
	    <i class="layui-icon">&#xe602;</i>
	  </div>
	  <div class="site-mobile-shade"></div>
	  
	  
	  <div class="fly-panel fly-panel-user" pad20>
	    <!--
	    <div class="fly-msg" style="margin-top: 15px;">
	      您的邮箱尚未验证，这比较影响您的帐号安全，<a href="activate.html">立即去激活？</a>
	    </div>
	    -->
	    <div class="layui-tab layui-tab-brief" lay-filter="user">
	      <ul class="layui-tab-title" id="LAY_mine">
	        <li data-type="mine-jie" lay-id="index" class="layui-this">我的关注</li>
	      </ul>
	      <div class="layui-tab-content" style="padding: 20px 0;">
	        <div class="layui-tab-item layui-show">
	          <ul class="mine-view jie-row">
	          <c:forEach items="${list}" var="fans">
	            <li>
	              <a class="fly-nav-avatar" href="javascript:;">
	         
	          <!--<i class="layui-badge fly-badge-vip layui-hide-xs">VIP3</i>-->
	          <img src="<%=path %>/upload/${fans.gzmember.filename}">
	        </a>
	              <a class="jie-title" href="Home?memberid=${fans.gzmember.id}">${fans.gzmember.tname}</a>
	              <a class="mine-edit" href="javascript:qxgz('${fans.id}')">取消关注</a>
	            </li>
	            </c:forEach>
	          </ul>
	          <div id="LAY_page">${page.info }</div>
	        </div>
	        <div class="layui-tab-item">
	          <div id="LAY_page1"></div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>

      


<jsp:include page="foot.jsp"></jsp:include>
 
<script src="/blog/res/layui/layui.js"></script>
<script>
layui.cache.page = '';
layui.cache.user = {
  username: '游客'
  ,uid: -1
  ,avatar: '/blog/res/images/avatar/00.jpg'
  ,experience: 83
  ,sex: '男'
};
layui.config({
  version: "3.0.0"
  ,base: '/blog/res/mods/' //这里实际使用时，建议改成绝对路径
}).extend({
  fly: 'index'
}).use('fly');

function qxgz(id){
					var index = layer.load(1, {
					  shade: [0.1,'#fff'] //0.1透明度的白色背景
					});
					$.ajax({  
				        type: "POST",      
				        url: "fsDel", //servlet的名字
				        data: "id="+id, 
				        success: function(data){   
				        	layer.closeAll();
				        	if(data==0){
				        		layer.msg('取消关注成功!');
				        		location.href="myFollow";
				        	}
				        	
				 		}     
					});
}
</script>

<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script>

  </body>
</html>
