<%--
  Created by IntelliJ IDEA.
  User: ding
  Date: 2021/1/31
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
        <li class="layui-nav-item">
            <a href="Home?memberid=${sessionScope.member.id}">
                <i class="layui-icon">&#xe609;</i>
                我的主页
            </a>
        </li>
        <li class="layui-nav-item ${active eq 'memberCenter'?' layui-this':''}">
            <a href="memberCenter">
                <i class="layui-icon">&#xe612;</i>
                用户中心
            </a>
        </li>
        <li class="layui-nav-item  ${active eq 'memberSet'?' layui-this':''}">
            <a href="memberSet">
                <i class="layui-icon">&#xe620;</i>
                基本设置
            </a>
        </li>
        <li class="layui-nav-item ${active eq 'myFollow'?' layui-this':''}">
            <a href="myFollow">
                <i class="layui-icon">&#xe658;</i>
                我的关注
            </a>
        </li>
        <li class="layui-nav-item ${active eq 'myPingbi'?' layui-this':''}">
            <a href="myPingbi">
                <i class="layui-icon">&#x1006;</i>
                屏蔽用户
            </a>
        </li>
        <li class="layui-nav-item  ${active eq 'mysendSx'?' layui-this':''}">
            <a href="mysendSx">
                <i class="layui-icon">&#xe63a;</i>
                我的私信
            </a>
        </li>
        <li class="layui-nav-item ${active eq 'favMsg'?' layui-this':''}">
            <a href="favMsg">
                <i class="layui-icon">&#xe600;</i>
                我的收藏
            </a>
        </li>


        <li class="layui-nav-item ${active eq 'photoList'?' layui-this':''}">
            <a href="photoList">
                <i class="layui-icon">&#xe65d;</i>
                我的相册
            </a>
        </li>
    </ul>
</body>
</html>
