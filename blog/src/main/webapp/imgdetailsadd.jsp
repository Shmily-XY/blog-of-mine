<%--
  Created by IntelliJ IDEA.
  User: ding
  Date: 2021/1/7
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="layui/css/layui.css" rel="stylesheet">

</head>
<body>
<% String photoid = request.getParameter("photoid");%>
<div style="padding: 20px;">
    <form class="layui-form" action="">

        <input type="hidden" id="photoid" value="<%=photoid%>">

        <div class="layui-form-item">
            <input name='filename' type='text' class="layui-input" id='url'  required class="layui-input" />&nbsp;<input type='button' value='上传' onClick="up('url')" style="width: 60px;height: 37px;"/>
        </div>




        <div class="layui-form-item">
                <a class="layui-btn" lay-submit lay-filter="formDemo" onclick="add()">立即提交</a>
        </div>


    </form>

</div>
<script type="text/javascript" src="layer/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>

<script type="text/javascript">
    function add(){
        var photoid = $("#photoid").val()
        var filename = $("#url").val()


        if(filename==""){
            layer.msg("请上传照片",{icon:5})
            return false;
        }
        $.ajax({
            url:"imgdetailsAdd",
            type:"post",
            data:{
                filename:filename,
                photoid:photoid,
            },
            success:function(res){
                layer.alert("操作成功",{icon:6},function(){
                    parent.location.reload(true)
                    parent.layer.closeAll()
                })
            }
        })
    }

    function up(tt)
    {
        layer.open({
            type: 2,
            title: '上传文件',
            shadeClose: true,
            shade: false,
            maxmin: true, //开启最大化最小化按钮
            area: ['450px', '200px'],
            content: 'upload.jsp?Result='+tt
        });
    }
</script>

</body>
</html>
