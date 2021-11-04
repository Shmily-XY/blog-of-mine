<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
    <link rel="stylesheet" href="css/page.css">

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
                <li data-type="mine-jie" lay-id="index" class="layui-this">${photo.title}</li>
            </ul>
            <div class="layui-tab-content" style="padding: 20px 0;">
                <div class="layui-tab-item layui-show">
                    <button type="button" class="layui-btn" onclick="imgdetailsadd('${photoid}')">新增照片</button>
                    <button type="button" class="layui-btn" onclick="goback()">返回</button>
                    <!--相册-->
                    <div class="layui-row">
                        <c:forEach items="${pageInfo.list}" var="imgdetials">
                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md4" style="padding: 10px 20px 20px 0px;cursor: pointer" onclick="del('${imgdetials.id}','${photo.id}')">
                                <div class="grid-demo grid-demo-bg1" style="border: 1px solid darkgrey;">
                                    <div class="imgdetaisldiv" style="border-bottom: 1px solid darkgrey">
                                                <img src="upload/${imgdetials.filename}" style="width: 100%;height: 287px">
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <!--相册-->


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
        , uid: -1
        , avatar: '/blog/res/images/avatar/00.jpg'
        , experience: 83
        , sex: '男'
    };
    layui.config({
        version: "3.0.0"
        , base: '/blog/res/mods/' //这里实际使用时，建议改成绝对路径
    }).extend({
        fly: 'index'
    }).use('fly');

    function imgdetailsadd(photoid) {
        var index = layer.open({
            title: "新增照片",
            type: 2,
            area: ['600px', '500px'],
            maxmin: true,
            content: "imgdetailsadd.jsp?photoid="+photoid
        })
    }


    function del(id,photoid) {
        layer.confirm('是否确认删除照片？', {
            btn: ['是','否'] //按钮
        }, function(){
            location.replace("imgdetailsDel?id="+id+"&photoid="+photoid)
        }, function(){
        });
    }

    function goback(){
        window.history.go(-1)
    }
</script>

<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script>

</body>
</html>
