<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

    <link rel="stylesheet" href="../themes/default/default.css" />
    <link rel="stylesheet" href="../plugins/code/prettify.css" />
    <script charset="utf-8" src="../plugins/code/prettify.js"></script>
    <script charset="utf-8" src="/blog/kindeditor/kindeditor-all.js"></script>
    <script charset="utf-8" src="/blog/kindeditor/lang/zh-CN.js"></script>
    <script>
        KindEditor.ready(function(K) {
            window.editor = K.create('#editor_id');
        });
    </script>
    <script>
        KindEditor.ready(function(K) {
            K.create('textarea[name="content"]', {
                uploadJson : '/blog/kindeditor/jsp/upload_json.jsp',
                fileManagerJson : '/blog/kindeditor/jsp/file_manager_json.jsp',
                allowFileManager : true,
                allowImageUpload : true,
                autoHeightMode : true,
                afterCreate : function() {this.loadPlugin('autoheight');},
                afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息
            });
        });
    </script>


</head>

<body>
<jsp:include page="top.jsp"></jsp:include>
<input type="hidden" name="hiddenmemberid" id="hiddenmemberid" value="${sessionScope.member}">


<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8 content detail">
            <div class="fly-panel detail-box">
                <h1>${tzinfo.title}</h1>






                <div class="fly-detail-info">

                    <c:if test="${tzinfo.istop eq 'yes'}">
                        <span class="layui-badge layui-bg-black">置顶</span>
                    </c:if>
                    <c:if test="${tzinfo.isjh eq 'yes'}">
                        <span class="layui-badge layui-bg-red">精帖</span>
                    </c:if>

                    <div class="fly-admin-box" data-id="123">
                        <span style="font-size: 12px;">分类:</span>
                        <span class="layui-badge layui-bg-orange">${tzinfo.stype.typename}</span>
                        <c:if test="${fn:length(tzinfo.lablist) gt 0}">
                            <span style="font-size: 12px;">标签:</span>
                            <c:forEach items="${tzinfo.lablist}" var="labid">
                                <span class="layui-badge">${labid.name}</span>
                            </c:forEach>
                        </c:if>
                        <!-- 分享 -->
                        <!-- 分享 -->
                    </div>
                    <span class="fly-list-nums">
            <i class="iconfont" title="跟帖">&#xe60c;</i> ${fn:length(tzhtlist) }
            <i class="iconfont" title="人气">&#xe60b;</i> ${tzinfo.looknum }
            <a href="javascript:;" onclick="dz('${tzinfo.id}')"><i class="layui-icon" title="点赞">&#xe6c6;</i></a> <span id="dznum">${tzinfo.dznum}</span>

          </span>
                </div>
                <div class="detail-about" style="margin-top: 20px;">
                    <a class="fly-avatar" href="Home?memberid=${tzinfo.member.id}">
                        <img src="<%=path %>/upload/${tzinfo.member.filename}" alt="${tzinfo.member.tname}">
                    </a>
                    <div class="fly-detail-user">
                        <a href="Home?memberid=${tzinfo.member.id}" class="fly-link">
                            <cite>${tzinfo.member.tname}</cite>
                            <i class="iconfont icon-renzheng" title="实名认证"></i>
                        </a>
                        <span>${tzinfo.savetime }</span>
                    </div>
                    <div class="detail-hits" id="LAY_jieAdmin" data-id="123">
                        <c:if test="${sessionScope.member ne null}">
                            <c:choose>
                                <c:when test="${fn:length(fvlist)==0}">
                                    <span class="layui-btn layui-btn-xs jie-admin" type="set" field="status" rank="1" onclick="addfav('${tzinfo.id}','${sessionScope.member.id}')">收藏文章</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="layui-btn layui-btn-xs jie-admin" type="set" field="status" rank="1" onclick="scfav('${tzinfo.id}','${sessionScope.member.id}')">取消收藏</span>
                                </c:otherwise>
                            </c:choose>
                            <span >&nbsp;</span>
                        </c:if>
                        <c:if test="${tzinfo.member.id eq sessionScope.member.id}">
                            <span class="layui-btn layui-btn-xs jie-admin" type="edit"><a href="tzinfoShow?id=${tzinfo.id }">编辑文章</a></span>
                        </c:if>
                        <span  type="edit">&nbsp;</span>
                    </div>
                </div>
                <div class="detail-body photos">
                    <c:if test="${tzinfo.filename ne null and tzinfo.filename ne ''}">
                        <img src="upload/${tzinfo.filename}" style="width: 100%">
                    </c:if>
                    <p>${tzinfo.note}</p>
                </div>

                <div class="fly-panel detail-box" id="flyReply">
                    <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
                        <c:choose>
                            <c:when test="${tzinfo.canht eq 'yes'}">
                                <legend>评论</legend>
                            </c:when>
                            <c:otherwise>
                                <legend>文章已设置不能评论</legend>
                            </c:otherwise>
                        </c:choose>
                    </fieldset>


                    <c:if test="${tzinfo.canht ne 'no'}">
                        <ul class="jieda" id="jieda">
                            <c:forEach items="${tzhtlist}" var="tzhtinfo">
                                <li data-id="111" class="jieda-daan">
                                    <a name="item-1111111111"></a>
                                    <div class="detail-about detail-about-reply">
                                        <a class="fly-avatar" href="">
                                            <img src="<%=path %>/upload/${tzhtinfo.htmember.filename}" alt=" ">
                                        </a>
                                        <div class="fly-detail-user">
                                            <a href="Home?memberid=${tzhtinfo.htmember.id}" class="fly-link">
                                                <cite>${tzhtinfo.htmember.tname}</cite>
                                                <i class="iconfont icon-renzheng" title="认证信息：XXX"></i>


                                            </a>
                                            <span>${tzhtinfo.author eq tzinfo.id ?'(楼主)':''}</span>
                                            <c:if test="${tzhtinfo.htmember.isjy eq 'yes'}">
                                                <span style="color:#999">（该号已被禁言）</span>
                                            </c:if>
                                        </div>
                                            <div class="detail-hits">
                                                <span>${tzhtinfo.savetime }&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            </div>
                                    </div>
                                    <div class="detail-body jieda-body photos">
                                        <p>${tzhtinfo.note}</p>
                                    </div>


                                    <!-- 跟帖-->

                                    <!-- 跟帖-->


                                    <div class="jieda-reply">

                                          <span class="jieda-zan zanok" type="zan" >
                                          </span>


                                        <c:if test="${sessionScope.member ne null and sessionScope.member.id eq tzinfo.author and tzhtinfo.isds eq 'no'}">
                                            <div class="jieda-admin">
                                                <a href="javascript:;" onclick="rewardadd('${tzhtinfo.id}')"><span class="jieda-accept" type="accept">采纳</span></a>
                                            </div>
                                        </c:if>
                                    </div>
                                </li>
                            </c:forEach>

                            <!-- 无数据时 -->
                            <!-- <li class="fly-none">消灭零回复</li> -->
                        </ul>
                        <div id="LAY_page">${page.info }</div>
                        <div class="layui-form layui-form-pane">
                            <div class="layui-form-item layui-form-text">
                                <a name="comment"></a>
                                <div class="layui-input-block">
                                    <textarea id="editor_id" name="note"  class="layui-textarea "  style="height: 150px;" ></textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <input type="hidden" id="tzid" name="tzid" value="${tzinfo.id }">
                                <button class="layui-btn" onclick="checksub()">提交回复</button>
                            </div>
                        </div>
                    </c:if>

                </div>

            </div>

        </div>
        <jsp:include page="rightph.jsp"></jsp:include>
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
</script>

<script>


    function checksub(){
        var tzid = document.getElementById("tzid").value;
        editor.sync();
        var note = $('#editor_id').val();
        if(note.length<140){
location.replace("tzhtinfoAdd?tzid="+tzid+"&note="+note);
        }else{
            layer.msg("字符过长",{icon:5,offset:['400px','400px']})
        }
    }

    function dz(tzid){
        $.ajax({
            type: "POST",
            url: "voteAdd", //servlet的名字
            data:{
                tzid:tzid,
            },
            success: function(data){
                if(data.data==500){
                    location.replace("login.jsp")
                }else if(data.data==300){
                    layer.msg("不能点赞自己的文章",{icon:5})
                }else if(data.data==400){
                    layer.msg("已赞过了",{icon:5})
                }else{
                    layer.msg("点赞加1",{icon:6})
                    $("#dznum").text(data.dznum)
                }
            }
        });
    }

    function del(id,ppid){
        var index = layer.load(1, {
            shade: [0.1,'#fff'] //0.1透明度的白色背景
        });
        $.ajax({
            type: "POST",
            url: "tzdel.action", //servlet的名字
            data: "id="+id,
            success: function(data){
                layer.closeAll();
                location.href="tzlist.jsp?ppid="+ppid;
            }
        });
    }
    function tzzd(id){
        var index = layer.load(1, {
            shade: [0.1,'#fff'] //0.1透明度的白色背景
        });
        $.ajax({
            type: "POST",
            url: "tzzd", //servlet的名字
            data: "id="+id,
            success: function(data){
                layer.msg('置顶成功!');
                location.href="tzDetail?id="+id;
            }
        });
    }

    function tzjj(id){
        var index = layer.load(1, {
            shade: [0.1,'#fff'] //0.1透明度的白色背景
        });
        $.ajax({
            type: "POST",
            url: "tzjj", //servlet的名字
            data: "id="+id,
            success: function(data){
                location.href="tzDetail?id="+id;
            }
        });
    }

    function tzzdqx(id){
        var index = layer.load(1, {
            shade: [0.1,'#fff'] //0.1透明度的白色背景
        });
        $.ajax({
            type: "POST",
            url: "tzzd", //servlet的名字
            data: "id="+id,
            success: function(data){
                layer.msg('取消置顶成功!');
                location.href="tzDetail?id="+id;
            }
        });
    }

    function tzjjqx(id){
        var index = layer.load(1, {
            shade: [0.1,'#fff'] //0.1透明度的白色背景
        });
        $.ajax({
            type: "POST",
            url: "tzjj", //servlet的名字
            data: "id="+id,
            success: function(data){
                layer.msg('取消加精成功!');
                location.href="tzDetail?id="+id;
            }
        });
    }

    function delht(id,htid){
        var index = layer.load(1, {
            shade: [0.1,'#fff'] //0.1透明度的白色背景
        });
        $.ajax({
            type: "POST",
            url: "delHt", //servlet的名字
            data: "id="+htid,
            success: function(data){
                layer.closeAll();
                layer.msg('删除成功!');
                location.href="tzDetail?id="+id;
            }
        });
    }
    function addfav(id,memberid){
        var index = layer.load(1, {
            shade: [0.1,'#fff'] //0.1透明度的白色背景
        });
        $.ajax({
            type: "POST",
            url: "favAdd", //servlet的名字
            data: "tzid="+id+"&memberid="+memberid,
            success: function(data){
                layer.closeAll();
                if(data=='1'){
                    layer.msg('收藏成功!');
                    location.href="tzDetail?id="+id;
                }else{
                    layer.msg('文章已经被你收藏过!');
                    location.href="tzDetail?id="+id;
                }

            }
        });
    }
    function scfav(id,memberid){
        var index = layer.load(1, {
            shade: [0.1,'#fff'] //0.1透明度的白色背景
        });
        $.ajax({
            type: "POST",
            url: "favSc", //servlet的名字
            data: "tzid="+id+"&memberid="+memberid,
            success: function(data){
                layer.closeAll();
                location.href="tzDetail?id="+id;
            }
        });
    }

    function delTzinfo(id){
        $.ajax({
            type: "POST",
            url: "admin/tzinfoDel", //servlet的名字
            data: "id="+id,
            success: function(data){
                layer.closeAll();
                alert("删除成功");
                location.href="index";
            }
        });
    }


    function pinlunhf(htid){
        var index = layer.open({
            title:"回复",
            type:2,
            area:['600px','400px'],
            maxmin:true,
            offset: ['200px', '450px'],
            content:"tzhthf.jsp?htid="+htid,

        })
    }


    function rewardadd(tzhtid){


        var hiddenmemberid = $("#hiddenmemberid").val();
        if(hiddenmemberid==""){
            location.replace("login.jsp")
            return false;
        }


        var index = layer.open({
            title:"打赏",
            type:2,
            area:['300px','200px'],
            maxmin:true,
            offset: ['200px', '450px'],
            content:"rewardadd.jsp?tzhtid="+tzhtid,

        })
    }

</script>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script>

</body>
</html>
