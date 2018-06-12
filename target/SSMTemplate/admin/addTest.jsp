<%--
  Created by IntelliJ IDEA.
  User: leleqin
  Date: 2018/6/11
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>题目管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/plugins/layui/css/layui.css" media="all">
</head>

<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>添加题库</legend>
</fieldset>

<form class="layui-form" action="">
    <div class="layui-form-item">
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">请输入题目</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入题目" class="layui-textarea" id="tname"></textarea>
        </div>
    </div>
        <div class="layui-form-item">
            <label class="layui-form-label">A选项</label>
            <div class="layui-input-block">
                <input type="text" id="ta" name="title" lay-verify="title" autocomplete="off" placeholder="请输入A选项" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">B选项</label>
            <div class="layui-input-block">
                <input type="text" id="tb" name="title" lay-verify="title" autocomplete="off" placeholder="请输入B选项" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">C选项</label>
            <div class="layui-input-block">
                <input type="text" id="tc" name="title" lay-verify="title" autocomplete="off" placeholder="请输入C选项" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">D选项</label>
            <div class="layui-input-block">
                <input type="text" id="td" name="title" lay-verify="title" autocomplete="off" placeholder="请输入D选项" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">答案</label>
            <div class="layui-input-inline">
                <select id="answder" lay-verify="required">
                    <option value=""></option>
                    <option value="1">A</option>
                    <option value="2">B</option>
                    <option value="3">C</option>
                    <option value="4">D</option>
                </select>
            </div>
        </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addTest">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
    </div>
</form>

<script src="/plugins/layui/layui.js"></script>

<script>
    layui.use(['form', 'layedit', 'laydate'], function() {
        var form = layui.form,
            $ = layui.jquery,
            layer = layui.layer;

        //自定义验证规则
        form.verify({
            title: function(value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            },
        });

        //监听提交
        form.on('submit(addTest)', function(data) {
            $.ajax({
                type:'post',
                url:'/select/addTest',
                data:{tname:$("#tname").val(),ta:$("#ta").val(),tb:$("#tb").val(),tc:$("#tc").val(),td:$("#td").val(),answder:$("#answder").val()},
            })
            layer.msg('添加成功', {icon: 6, time: 500}, function () {
                location.reload();
            });
        });


    });
</script>

</body>

</html>
