<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>成绩分析</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/plugins/layui/css/layui.css" media="all">
    <script type="text/javascript" src="../build/js/jquery.js"></script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>成绩分析</legend>
</fieldset>
<div class="layui-form">
    <table class="layui-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>学生</th>
            <th>学号</th>
            <th>成绩</th>
        </tr>
        </thead>
        <tbody id="context">

        </tbody>
    </table>
</div>
<div id="page"></div>
<script src="/plugins/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.use(['laypage', 'layer', 'form'], function () {
        var laypage = layui.laypage
            , $ = layui.jquery
            , layer = layui.layer
            , form = layui.form;

        let currentIndex = 1;
        let limitIndex = 10;
        $.ajax({
            type: 'post',
            url: '/score/scoreCount',
            success: function (data) {
                laypage.render({
                    elem: 'page',
                    count: data, //数据总数，从服务端得到
                    limit: 10,
                    limits: [100, 300, 500],
                    jump: function (obj, first) {//obj包含了当前分页的所有参数，比如：
                        currentIndex = obj.curr;
                        limitIndex = obj.limit;
                        $.ajax({
                            type: 'post',
                            url: '/score/selectAllScore',
                            data: {
                                currentIndex: currentIndex,
                                limitIndex: limitIndex
                            },
                            success: function (data) {
                                $("#context").html("");
                                for (var i = 0; i < data.length; i++) {
                                    $("#context").append(`<tr>
                                    <td>` + (i + 1) + `</td>
                                    <td>` + data[i]['uname'] + `</td>
                                    <td>` + data[i]['unum'] + `</td>
                                    <td>` + data[i]['score'] + `</td>
                                  `);
                                }
                            }
                        })
                    }
                });
            }
        })




    });
</script>
</body>
</html>

