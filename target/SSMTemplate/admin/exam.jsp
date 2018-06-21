<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>考试界面</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!--layui-->
    <link rel="stylesheet" href="/plugins/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../plugins/layui/css/style.css">

    <script src="../plugins/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../plugins/layui/js/jquery-3.2.1.min.js"></script>

</head>
<body>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<!-- particles.js container -->
<div id="particles-js"></div>


<div class="layui-row"  style="padding: 20px 280px 0px 280px;">
    <div class="layui-col-xs6 layui-col-md12">
        <div class="grid-demo grid-demo-bg2">
            <div class="layui-tab">
                <ul class="layui-tab-title">
                    <li class="layui-this">考试系统</li>
                    <li>Java</li>
                    <li>C语言</li>
                    <li>数据结构</li>
                    <li style="float: right">欢迎 ${userInfo} 同学！</li>
                </ul>
                <div class="layui-tab-content">
                    <!--考试时间线-->
                    <div class="layui-tab-item layui-show">

                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                            <legend>考试时间线</legend>
                        </fieldset>
                        <ul class="layui-timeline">
                            <li class="layui-timeline-item">
                                <i class="layui-icon layui-timeline-axis"></i>
                                <div class="layui-timeline-content layui-text">
                                    <h3 class="layui-timeline-title">8月18日 Java</h3>
                                    <p style="color: #0C0C0C">Java考试大纲</p>
                                    <ul style="color: #0C0C0C">
                                        <li>Java基础知识</li>
                                        <li>Java基础编程</li>
                                    </ul>
                                </div>
                            </li>
                            <li class="layui-timeline-item">
                                <i class="layui-icon layui-timeline-axis"></i>
                                <div class="layui-timeline-content layui-text">
                                    <h3 class="layui-timeline-title">8月16日 C语言</h3>
                                    <p style="color: #0C0C0C">C语言考试大纲</p>
                                    <ul style="color: #0C0C0C">
                                        <li>基础知识</li>
                                        <li>编程</li>
                                    </ul>
                                </div>
                            </li>
                            <li class="layui-timeline-item">
                                <i class="layui-icon layui-timeline-axis"></i>
                                <div class="layui-timeline-content layui-text">
                                    <h3 class="layui-timeline-title">8月15日 数据结构</h3>
                                    <p style="color: #0C0C0C">
                                        中国人民抗日战争胜利日
                                        <br>常常在想，尽管对这个国家有这样那样的抱怨，但我们的确生在了最好的时代
                                        <br>铭记、感恩
                                        <br>所有为中华民族浴血奋战的英雄将士
                                        <br>永垂不朽
                                    </p>
                                </div>
                            </li>
                            <li class="layui-timeline-item">
                                <i class="layui-icon layui-timeline-axis"></i>
                                <div class="layui-timeline-content layui-text">
                                    <div class="layui-timeline-title">过去</div>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <!--Java-->
                    <div class="layui-tab-item">
                        <button class="layui-btn layui-btn-primary layui-btn-lg" lay-submit="" lay-filter="startExam" id="startExamJava">开始考试</button>
                        <button class="layui-btn" lay-submit="" lay-filter="submissionJava" style="float: right" id="submitJava">提交</button>
                        <div style="background-color:rgba(0,0,0,0.2); text-indent: 1cm; height: 568px; overflow:scroll; line-height: 30px" class="test-1" id="testList">
                            <br>
                            <p style="font-size: large">选择题。(每题10分，共100)</p>
                            <hr>
                            <div id="examContent" style="font-size: 14px"></div>
                        </div>
                        <p id="examOver">考试结束</p>
                        </div>


                    <!--C语言-->
                    <div class="layui-tab-item">
                        <button class="layui-btn layui-btn-primary layui-btn-lg" lay-submit="" lay-filter="startExamC">开始考试</button>
                    </div>


                    <!--数据结构-->
                    <div class="layui-tab-item">
                        <button class="layui-btn layui-btn-primary layui-btn-lg" lay-submit="" lay-filter="startExamData">开始考试</button>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $("#testList").css("display","none");
    $("#submitJava").css("display","none");
    $("#examOver").css("display","none");


</script>

<script>

    //一般直接写在一个js文件中
    layui.use(['layer', 'form','element'], function () {
        var layer = layui.layer
            , form = layui.form
            , element = layui.element;
        var $ = layui.$;

        var answer = [];
        form.on('submit(startExam)',function () {
            $.ajax({
                type:'post',
                url:'/select/randomTest',
                success:function (data) {
                    $("#testList").css("display","block");
                    $("#submitJava").css("display","block");
                    $("#startExamJava").css("display","none");

                    $("#examContent").html("");
                    for (var i = 0; i < data.length; i++) {
                        $("#examContent").append( `<h3>`+(i+1)+`. `+data[i]['tname']
                            +`<p>
                                    <input name="`+(i+1)+`" type="radio" value="A"/>
                                    A:`+data[i]['ta']+`</p>
                                <p>
                                    <input name="`+(i+1)+`" type="radio" value="B" />
                                    B:`+data[i]['tb']+`</p>
                                <p>
                                    <input name="`+(i+1)+`" type="radio" value="C" />
                                    C:`+data[i]['tc']+`</p>
                                <p>
                                    <input name="`+(i+1)+`" type="radio" value="D" />
                                    D:`+data[i]['td']+`</p>`);
                        answer.push(data[i]['answder']);
                    }
                }
            })
        })

        form.on('submit(submissionJava)',function () {
            console.log(answer);
            let selectRadio = [];
            let notSelect = [];
            //获得 单选选按钮name集合
            for (var j = 1;j <= 10;j++){
            var radios = document.getElementsByName(j);
            //根据 name集合长度 遍历name集合
            for(var i=0;i<radios.length;i++)
            {
                //判断那个单选按钮为选中状态
                if(radios[i].checked)
                {
                    //弹出选中单选按钮的值
                    selectRadio.push(radios[i].value);
                }else {
                    notSelect.push("");
                }
            }
            }
            if (notSelect.length > 30){
                layer.alert("请完整答题")
            }else {
                let right = [];
                let error = [];
                answer.every((element,index) => selectRadio[index] === element ? right.push(element) : error.push(element));
                var score = right.length * 10;
                layer.alert("您的本次答题分数是 "+score+" 分");
                $("#testList").css("display","none");
                $("#submitJava").css("display","none");
                $("#startExamJava").css("display","none");
                $("#examOver").css("display","block");
                $.ajax({
                    type:'post',
                    url:'/score/updateScore',
                    data:{score:score,cid:1}
                })
            }
        })


    });

</script>
</body>

<!--一个好看的动画背景-->
<script src="../plugins/layui/js/particles.js"></script>
<script src="../plugins/layui/js/app.js"></script>
</html>