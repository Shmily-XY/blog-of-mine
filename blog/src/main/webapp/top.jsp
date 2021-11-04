<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
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
  <!--背景音乐-->
  <jsp:include page="musicaudio.jsp"></jsp:include>
  <%--<audio  id="myaudio"  loop="loop" preload="none">--%>
      <%--<source src="upload/1616210087163.mp3"/>--%>
  <%--</audio>--%>
  <!--背景音乐-->


	    <div class="fly-header layui-bg-black">
	  <div class="layui-container">
	    <a class="fly-logo" href="index">
		    <h2><font color="white">博客系统</font></h2>
	    </a>

	    <ul class="layui-nav fly-nav-user">
	      <!-- 未登入的状态 -->
	      <c:if test="${sessionScope.member == null}">
	      <li class="layui-nav-item">
	        <a class="iconfont icon-touxiang layui-hide-xs" href="login.jsp"></a>
	      </li>
	      <li class="layui-nav-item">
	        <a href="login.jsp">登入</a>
	      </li>
	      <li class="layui-nav-item">
	        <a href="reg.jsp">注册</a>
	      </li>
	      </c:if>


	      <!-- 登入后的状态 -->
	      <c:if test="${sessionScope.member !=null}">
	      <li class="layui-nav-item">
	        <a class="fly-nav-avatar" href="javascript:;">
	          <cite class="layui-hide-xs">${sessionScope.member.tname}</cite>
	          <i class="iconfont icon-renzheng layui-hide-xs" title="实名认证"></i>
	          <!--<i class="layui-badge fly-badge-vip layui-hide-xs">VIP3</i>-->
	          <img src="<%=path %>/upload/${sessionScope.member.filename}">
	        </a>
	        <dl class="layui-nav-child">
	          <dd><a href="memberCenter"><i class="layui-icon" style="margin-left: 2px; font-size: 22px;">&#xe68e;</i>用户中心</a></dd>
	          <dd><a href="memberSet"><i class="layui-icon">&#xe620;</i>基本设置</a></dd>
	          <!--  <dd><a href="../user/message.html"><i class="iconfont icon-tongzhi" style="top: 4px;"></i>我的消息</a></dd>
	          <dd><a href="../user/home.html"><i class="layui-icon" style="margin-left: 2px; font-size: 22px;">&#xe68e;</i>我的主页</a></dd>-->
	          <hr style="margin: 5px 0;">
	          <dd><a href="javascript:logout()" style="text-align: center;">安全退出</a></dd>
	        </dl>
	      </li>
	      </c:if>
	      
	      
	    </ul>
	  </div>
	</div>
	
	<div class="fly-panel fly-column">
	  <div class="layui-container">
	    <ul class="layui-clear ">
	      <li class="layui-hide-xs layui-this"><a href="index">首页</a></li>
	      
	      <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><span class="fly-mid"></span></li> 
	      <!-- 用户登入后显示 -->
	      <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="memberCenter">我发表的文章</a></li>
	      <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="chatList">意见建议</a></li>
	    </ul> 
	    
	    <div class="fly-column-right layui-hide-xs"> 
	      <span class="fly-search"><i class="layui-icon">&#xe615;</i></span>
	      <a href="tzShowmember" class="layui-btn">发表文章</a>
            <a href="javascript:;" onclick="cutmusic()" class="layui-btn">背景音乐切换</a>
            <a href="javascript:;" onclick="closemusic()" class="layui-btn">关闭</a>
	    </div>

	    <div class="layui-hide-sm layui-show-xs-block" style="margin-top: -10px; padding-bottom: 10px; text-align: center;"> 
	      <a href="tzShowmember" class="layui-btn">发表文章</a>
	    </div>


	  </div>
	</div>

	<script src="/blog/res/layui/layui.js"></script>
	<script src="/blog/js/jquery-2.1.0.min.js"></script>
	<script>
		layui.cache.page = 'user';
		layui.cache.user = {
		  username: '游客'
		  ,uid: -1
		  ,avatar: '/blog/res/images/avatar/00.jpg'
		  ,experience: 83
		  ,sex: '男'
		};

		
		function logout(){
				$.ajax({  
				        type: "POST",      
				        url: "memberExit", //servlet的名字
				        data: "a=1", 
				        success: function(msg){  
						    if(msg==0){     
						    	location.href="index";
						    }    
				 		}     
				}); 
		}


        function cutmusic(){
		    $.ajax({
                url:"randommusic",
                type:"post",
                data:{},
                success:function(res){
                    if(res.data==200){
                        var player = $("#myaudio")[0]; /*jquery对象转换成js对象*/
                        player.setAttribute("src", "upload/"+res.music.filename);
                        player.play()
                    }
                }
            })
        }

        function closemusic(){
            var player = $("#myaudio")[0]; /*jquery对象转换成js对象*/
             player.pause();/*暂停*/
            //player.setAttribute("src", "upload/"+res.music.filename);
        }






        // function myFunction()
        // {
        //     var x = document.createElement("AUDIO");
        //     x.setAttribute("src", "upload/1616210087163.mp3");
        //     x.setAttribute("controls", "controls");
        //     document.body.appendChild(x);
        //     document.getElementById("demo").innerHTML = "<b>注释：</b>IE 和 Safari 不支持 .ogg 文件格式。这只是一个例子。如需使其在所有浏览器中运行，您应该在 audio 元素中使用 source 元素。";
        // }
</script>
  </body>

</html>
