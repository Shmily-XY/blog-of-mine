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
                <li data-type="mine-jie" lay-id="index" class="layui-this">我的相册</li>
            </ul>
            <div class="layui-tab-content" style="padding: 20px 0;">
                <div class="layui-tab-item layui-show">
                    <button type="button" class="layui-btn" onclick="photoadd()">创建相册</button>

                    <!--相册-->

                    <div class="layui-row">
                        <c:forEach items="${list}" var="photo">
                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md4" style="padding: 10px 20px 20px 0px;">
                                <div class="grid-demo grid-demo-bg1" style="border: 1px solid darkgrey;">
                                    <div style="border-bottom: 1px solid darkgrey">
                                        <div style="position: absolute;left: 40%;top: 40%" ><a href="imgdetailsList?photoid=${photo.id}" style="font-weight: bold;color:darkorange">进入相册</a></div>
                                        <c:choose>
                                            <c:when test="${fn:length(photo.imgdetailslist)  gt 0}">
                                                <img src="upload/${photo.imgdetailslist[0].filename}" style="width: 100%;height: 287px">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="upload/pic-none.png" style="width: 100%;height: 287px">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div>
                                        <div class="layui-row" style="color:darkgrey;">
                                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md8" style="padding: 10px;">
                                                ${photo.title}
                                            </div>
                                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md4" style="padding: 10px;border:0px solid red;display: flex">
                                                <a href="javascript:;" onclick="edit('${photo.id}')"><span class="layui-badge layui-bg-green">编辑</span></a>
                                                <a href="photoDel?id=${photo.id}"><span class="layui-badge">删除</span></a>
                                            </div>
                                        </div>
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

    function photoadd() {
        var index = layer.open({
            title: "创建相册",
            type: 2,
            area: ['600px', '500px'],
            maxmin: true,
            content: "photoadd.jsp"
        })
    }


    function edit(id) {
        var index = layer.open({
            title: "编辑相册",
            type: 2,
            area: ['600px', '500px'],
            maxmin: true,
            content: "photoShow?id="+id
        })
    }
</script>

<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script>

</body>
</html>
