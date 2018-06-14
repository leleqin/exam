<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>管理题库</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/plugins/layui/css/layui.css" media="all">
    <script type="text/javascript" src="../build/js/jquery.js"></script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>题库管理</legend>
</fieldset>
<div class="layui-form">
    <table class="layui-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>题目</th>
            <th>A选项</th>
            <th>B选项</th>
            <th>C选项</th>
            <th>D选项</th>
            <th>答案</th>
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
    layui.use(['laypage', 'layer', 'form'], function () {
        var laypage = layui.laypage
            , $ = layui.jquery
            , layer = layui.layer
            , form = layui.form;

        let currentIndex = 1;
        let limitIndex = 10;
        $.ajax({
            type:'post',
            url:'/select/testCount',
            success:function (data) {
                laypage.render({
                    elem: 'page',
                    count: data, //数据总数，从服务端得到
                    limit: 10,
                    limits: [100, 300, 500],
                    jump: function(obj, first){//obj包含了当前分页的所有参数，比如：
                        currentIndex = obj.curr;
                        limitIndex = obj.limit;
                        $.ajax({
                            type:'post',
                            url:'/select/singlePageTest',
                            data: {
                                currentIndex: currentIndex,
                                limitIndex: limitIndex
                            },
                            success:function (data) {
                                $("#context").html("");
                                for (var i = 0; i < data.length; i++) {
                                    $("#context").append(`<tr>
                                    <td>` + (i + 1) + `</td>
                                    <td>` + data[i]['tname'] + `</td>
                                    <td>` + data[i]['ta'] + `</td>
                                    <td>` + data[i]['tb'] + `</td>
                                    <td>` + data[i]['tc'] + `</td>
                                    <td>` + data[i]['td'] + `</td>
                                    <td>` + data[i]['answder'] + `</td>
                                    <td><button class="layui-btn layui-btn-sm layui-icon" onclick="editTest(` + data[i]['tid'] + `)">&#xe642;编辑</button><br>
                                        <button class="layui-btn layui-btn-sm layui-btn-danger layui-icon" onclick="deleteTest(` + data[i]['tid'] + `)">&#xe640;删除</button></td>
                                </tr>`);
                                }
                            }
                        })
                    }
                });
            }
        })

        /*监听保存按钮*/
        form.on('submit(keepTest)',function () {
            $.ajax({
                type:'post',
                url:'/select/updateTest',
                data:{tid:$("#tid").val(),tname:$("#testName").val(),ta:$("#chooseA").val(),tb:$("#chooseB").val(),tc:$("#chooseC").val(),td:$("#chooseD").val(),answder:$("#chooseAnswer").val()},
            })
            layer.msg('修改成功', {icon: 6, time: 500}, function () {
                location.reload();
            });
        })


    });

    function editTest(tid) {
        $.ajax({
            type:'post',
            url:'/select/editTest',
            data:{tid:tid},
            success:function (data) {
                $("#tid").val(data[0]['tid']);
                $("#testName").val(data[0]['tname']);
                $("#chooseA").val(data[0]['ta']);
                $("#chooseB").val(data[0]['tb']);
                $("#chooseC").val(data[0]['tc']);
                $("#chooseD").val(data[0]['td']);
                $("#chooseAnswer").val(data[0]['answder']);
                layer.open({
                    type:1,
                    title:'修改信息',
                    area:['700px','500px'],
                    skin:'layui-layer-rim',
                    offset: '15px',
                    content:$('#updateTest')
                })
            }
        })
    }

    function deleteTest(tid) {
        layer.confirm("是否删除？", {icon: 3, title: '删除'}, function (index) {
            $.ajax({
                type:'post',
                url:'/select/deleteTest',
                data:{tid:tid}
            })
            layer.msg('删除成功', {icon: 6, time: 500}, function () {
                location.reload();
            });
            layer.close(index);
        })
    }
</script>
</body>

<%--更新题目--%>
<div id="updateTest" style="display: none">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <br><br>
            <input type="hidden" id="tid">
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">请输入题目</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入题目" class="layui-textarea" id="testName"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">A选项</label>
                <div class="layui-input-block">
                    <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入A选项" class="layui-input" id="chooseA">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">B选项</label>
                <div class="layui-input-block">
                    <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入B选项" class="layui-input" id="chooseB">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">C选项</label>
                <div class="layui-input-block">
                    <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入C选项" class="layui-input" id="chooseC">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">D选项</label>
                <div class="layui-input-block">
                    <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入D选项" class="layui-input" id="chooseD">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">答案</label>
                <div class="layui-input-block">
                    <select id="chooseAnswer">
                        <option value=""></option>
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="keepTest">保存</button>
                </div>
            </div>
        </div>
    </form>
</div>
</html>

