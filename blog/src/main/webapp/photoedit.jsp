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
<div style="padding: 20px;">
    <form class="layui-form" action="">

        <input type="hidden" id="id" value="${photo.id}">

        <div class="layui-form-item">
                <input type="text" name="title" id="title" value="${photo.title}" required  lay-verify="required" placeholder="主题" autocomplete="off" class="layui-input">
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
        var title = $("#title").val()
        var id = $("#id").val()


        if(title==""){
            layer.msg("主题不能为空",{icon:5})
            return false;
        }
        $.ajax({
            url:"photoEdit",
            type:"post",
            data:{
                title:title,
                id:id,
            },
            success:function(res){
                layer.alert("编辑成功",{icon:6},function(){
                    parent.location.reload(true)
                    parent.layer.closeAll()
                })
            }
        })
    }
</script>

</body>
</html>
