<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
</head>

<body>
<jsp:include page="top.jsp"></jsp:include>


<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">

            <%--焦点图--%>


                <div class="layui-carousel" id="test10">
                    <div carousel-item="">
                        <c:forEach items="${imgadvlist}" var="imgadv">
                            <div><a href="${imgadv.url}"><img src="upload/${imgadv.filename}" style="width: 100%;height: 240px;"></a></div>
                        </c:forEach>
                    </div>
                </div>

            <%--焦点图--%>

            <div class="fly-panel">
                <div class="fly-panel-title fly-filter">
                    <a>版块列表</a>
                    <a href="#signin" class="layui-hide-sm layui-show-xs-block fly-right" id="LAY_goSignin"
                       style="color: #FF5722;">去签到</a>
                </div>
                <ul class="fly-list">

                    <c:forEach items="${ctlist}" var="ftype">
                        <li>
                            <a href="tzList?fid=${ftype.id }" class="fly-avatar">
                                <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"
                                     alt="贤心">
                            </a>
                            <h2>
                                <a class="layui-badge">版块</a>
                                <a href="tzList?fid=${ftype.id }">${ftype.typename}</a>
                            </h2>
                            <div class="fly-list-info">
                                <a href="tzList?fid=${ftype.id }&sid=0" link></a>

                                <span class="fly-list-nums">
                <i class="iconfont icon-pinglun1" title="文章"></i>${fn:length(ftype.ftypetzinfolist) }
              </span>
                            </div>
                            <div class="fly-list-badge">
                                <!--
                                <span class="layui-badge layui-bg-black">置顶</span>
                                <span class="layui-badge layui-bg-red">精帖</span>
                                -->
                            </div>
                        </li>
                    </c:forEach>

                </ul>
            </div>


        </div>
        <jsp:include page="right.jsp"></jsp:include>
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
</script>

<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script>

<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['carousel', 'form'], function(){
        var carousel = layui.carousel
            ,form = layui.form;

        //常规轮播
        carousel.render({
            elem: '#test1'
            ,arrow: 'always'
        });

        //改变下时间间隔、动画类型、高度
        carousel.render({
            elem: '#test2'
            ,interval: 1800
            ,anim: 'fade'
            ,height: '120px'
        });

        //设定各种参数
        var ins3 = carousel.render({
            elem: '#test3'
        });
        //图片轮播
        carousel.render({
            elem: '#test10'
            ,width: '100%'
            ,height: '240px'
            ,interval: 5000
        });

        //事件
        carousel.on('change(test4)', function(res){
            console.log(res)
        });

        var $ = layui.$, active = {
            set: function(othis){
                var THIS = 'layui-bg-normal'
                    ,key = othis.data('key')
                    ,options = {};

                othis.css('background-color', '#5FB878').siblings().removeAttr('style');
                options[key] = othis.data('value');
                ins3.reload(options);
            }
        };

        //监听开关
        form.on('switch(autoplay)', function(){
            ins3.reload({
                autoplay: this.checked
            });
        });

        $('.demoSet').on('keyup', function(){
            var value = this.value
                ,options = {};
            if(!/^\d+$/.test(value)) return;

            options[this.name] = value;
            ins3.reload(options);
        });

        //其它示例
        $('.demoTest .layui-btn').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });
    });
</script>
</body>
</html>
