<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/plugins/layui/css/layui.css" media="all">
    <script type="text/javascript" src="../build/js/jquery.js"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>用户信息管理</legend>
</fieldset>
<blockquote class="layui-elem-quote layui-text">
    <button class="layui-btn layui-icon" onclick="addUser()">&#xe654; 添加信息</button>
</blockquote>
<div class="layui-form">
    <table class="layui-table">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="200">
            <col width="200">
            <col width="200">
        </colgroup>
        <thead>
        <tr>
            <th>ID</th>
            <th>昵称</th>
            <th>账号</th>
            <th>密码</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="context">

        </tbody>
    </table>
</div>
<div id="page"></div>
<script src="/plugins/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.use(['laypage', 'layer'], function () {
        var laypage = layui.laypage
            , $ = layui.jquery
            , layer = layui.layer;


        let currentIndex = 1;
        let limitIndex = 10;
        $.ajax({
            type: 'post',
            url: '/queryCount',
            success: function (data) {
                laypage.render({
                    elem: 'page'
                    , count: data
                    , limit: 10
                    , limits: [100, 300, 500],
                    jump: function (obj, first) {
                        currentIndex = obj.curr;
                        limitIndex = obj.limit;
                        $.ajax({
                            type: 'post',
                            url: '/queryProfession',
                            data: {
                                currentIndex: currentIndex,
                                limitIndex: limitIndex
                            },
                            success: function (data) {
                                $("#context").html("");
                                for (var i = 0; i < data.length; i++) {
                                    $("#context").append(`<tr>
            <td>` + (i + 1) + `</td>
            <td>` + data[i]['user_username'] + `</td>
            <td>` + data[i]['user_nickname'] + `</td>
            <td>` + data[i]['user_password'] + `</td>
            <td><button class="layui-btn layui-btn-sm layui-icon" onclick="updateUser()">&#xe642;编辑</button>
                <button class="layui-btn layui-btn-sm layui-btn-danger layui-icon" onclick="deleteUsder()">&#xe640;删除</button></td>
        </tr>`);
                                }
                            }
                        });
                    }
                });
            }

        });


    });

    function addUser() {
        layer.open({
            type:1,
            title:'修改信息',
            area:['360px','400px'],
            skin:'layui-layer-rim',
            content:$('#user_update')
        })
    }

    function updateUser() {
        layer.open({
            type:1,
            title:'修改信息',
            area:['360px','400px'],
            skin:'layui-layer-rim',
            content:$('#user_update')
        })
    }

    function deleteUsder() {
        layer.confirm("是否删除？", {icon: 3, title: '删除'}, function (index) {

            layer.msg('删除成功', {icon: 6, time: 500}, function () {
                location.reload();
            });
            layer.close(index);
        })
    }
</script>
</body>
<div id="user_update" style="display: none">
    <form class="layui-form" action="${pageContext.request.contextPath}/AdminServlet?method=Admin_updateInfo"
          method="post" style="padding-top: 20px">
        <div style="width: 20px;"></div>
        <div class="huan_a"></div>
        <div class="layui-form-item">
            <input type="hidden" name="s_id">
            <label class="layui-form-label">学号</label>
            <div class="layui-input-inline">
                <input style="background:#F6F6F6" name="s_studentid1" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input style="background:#F6F6F6" name="s_username1" autocomplete="off" class="layui-input">
            </div>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline">
                <input style="background:#F6F6F6" name="s_sex1" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">班级</label>
            <div class="layui-input-inline">
                <input style="background:#F6F6F6" name="s_class1" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input style="background:#F6F6F6" type="text" name="s_password1" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div style="width: 20px; "></div>
        <div class="layui-input-block huan_center">
            <button class="layui-btn" lay-submit="" type="submit">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </form>
</div>
</html>

