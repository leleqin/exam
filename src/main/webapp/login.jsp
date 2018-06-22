<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Corpse DSS后台管理系统</title>
    <link rel="shortcut icon" href="login/public/images/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="login/public/css/site.css" id="siteStyle">
    <link rel="stylesheet" href="login/public/css/login.css">
    <link rel="stylesheet" href="login/public/css/web-icons.css">
    <link rel="stylesheet" href="login/public/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="login/public/plugins/layui/css/layui.css"/>
    <script type="text/javascript" src="login/public/js/jquery.min.js"></script>
    <script type="text/javascript" src="login/public/js/jquery.js"></script>
    <!-- JS -->
    <script src="login/public/plugins/layui/layui.js"></script>
    <script src="login/public/js/bootstrap.js"></script>
    <script src="login/public/js/bootstrap-select.min.js"></script>
    <script src="login/public/js/formValidation.min.js" data-name="formValidation"></script>
    <script src="login/public/js/bootstrap.min.js" data-deps="formValidation"></script>

    <style>
        .code {
            width: 400px;
            margin: 0 auto;
        }
        .input-val {
            width: 247px;
            background: #ffffff;
            height: 3.8rem;
            padding: 0 2%;
            border-radius: 5px;
            border: none;
            border: 1px solid rgba(0,0,0,.2);
            font-size: 1.0625rem;
        }
        #canvas {
            float: right;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body class="page-login  layout-full page-dark  " id="page_background">
<div class="page  height-full">
    <div class="page-content height-full">
        <div class="page-brand-info vertical-align animation-slide-left hidden-xs">
            <div class="page-brand vertical-align-middle">
                <div class="brand">
                    <img class="brand-img" src="login/public/images/LOGO.png" height="50" alt="Eurasia DSS">
                    <span class="logo">Corpse</span>
                </div>
                <h3>Corpse Decision Support System</h3>
                <ul class="list-icons">
                    <li>Corpse Decision Support System</li>
                </ul>
                <div>
                    <a href="#" target="_blank"  target="_blank" class="btn btn-primary btn-outline">
                        <i class="fa fa-reply" aria-hidden="true"></i>&nbsp;前台链接</a>
                    <a href="#" class="btn btn-primary btn-outline margin-left-5">联系我们</a>
                </div>
            </div>
        </div>

        <div id="teacher_login" class="page-login-main animation-fade">
            <div class="vertical-align">
                <div class="vertical-align-middle">
                    <h2 class="hidden-xs" style="font-size: 24px;">老师登录</h2>
                    <p class="hidden-xs">Corpse Decision Support System</p>
                    <div class="login-form fv-form fv-form-bootstrap" id="loginForm" novalidate="novalidate">
                        <button type="submit" class="fv-hidden-submit"
                                style="display: none; width: 0px; height: 0px;"></button>

                        <div class="form-group has-feedback">
                            <label class="sr-only" for="user_username">用户名</label>
                            <input type="text" class="form-control" id="user_username" name="username" placeholder="请输入ID"
                                   data-fv-field="loginName">
                            <i class="form-control-feedback" data-fv-icon-for="loginName" style="display: none;"></i>
                            <small class="help-block" data-fv-validator="notEmpty" data-fv-for="loginName"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">用户名不能为空
                            </small>
                        </div>
                        <div class="form-group has-feedback">
                            <label class="sr-only" for="user_password">密码</label>
                            <input type="password" class="form-control" id="user_password" name="password"
                                   placeholder="请输入密码" data-fv-field="password">
                            <i class="form-control-feedback" data-fv-icon-for="password" style="display: none;"></i>
                            <small class="help-block" data-fv-validator="notEmpty" data-fv-for="password"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">密码不能为空
                        </small>
                        </div>
                        <%--验证码--%>
                        <div class="code">
                            <input type="text" value="" placeholder="请输入验证码（不区分大小写）" class="input-val">
                            <canvas id="canvas" width="100" height="43"></canvas>
                        </div>

                        <div class="col-sm-7">
                            <button type="submit" class="btn btn-primary btn-block margin-top-10" onclick="teacherLogin()">登
                                录
                            </button>
                        </div>
                        <div class="col-sm-5">
                            <button id="student_bt" type="button"
                                    class="btn btn-outline btn-success btn-block margin-top-10">
                                学生登录
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="page-copyright">
                <p>© 2018
                    <a href="" target="_blank">Corpse DSS</a>
                </p>
            </footer>
        </div>


        <div id="student_login" class="page-login-main animation-fade" style="display: none">
            <div class="vertical-align">
                <div class="vertical-align-middle">
                    <h2 class="hidden-xs" style="font-size: 24px;">学生登录</h2>
                    <p class="hidden-xs">Corpse Decision Support System</p>
                    <div class="login-form fv-form fv-form-bootstrap" id="registers" novalidate="novalidate">
                        <button type="submit" class="fv-hidden-submit"
                                style="display: none; width: 0px; height: 0px;"></button>

                        <div class="form-group has-feedback">
                            <label class="sr-only" for="username">用户名</label>
                            <input type="text" class="form-control" id="username" name="username" placeholder="请输入ID"
                                   data-fv-field="loginName">
                            <i class="form-control-feedback" data-fv-icon-for="loginName" style="display: none;"></i>
                            <small class="help-block" data-fv-validator="notEmpty" data-fv-for="loginName"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">用户名不能为空
                            </small>
                        </div>
                        <div class="form-group has-feedback">
                            <label class="sr-only" for="password">密码</label>
                            <input type="password" class="form-control" id="password" name="password"
                                   placeholder="请输入密码" data-fv-field="password">
                            <i class="form-control-feedback" data-fv-icon-for="password" style="display: none;"></i>
                            <small class="help-block" data-fv-validator="notEmpty" data-fv-for="password"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">密码不能为空
                            </small>
                        </div>
                        <div class="col-sm-7">
                            <button type="submit" class="btn btn-primary btn-block margin-top-10" onclick="studentLogin()">登
                                录
                            </button>
                        </div>
                        <div class="col-sm-5">
                            <button id="teacher_bt" type="button"
                                    class="btn btn-outline btn-success btn-block margin-top-10">
                                返回
                            </button>                        </div>
                    </div>
                </div>
            </div>
            <footer class="page-copyright">
                <p>© 2018
                    <a href="" target="_blank">Corpse DSS</a>
                </p>
            </footer>
        </div>
    </div>
</div>
<%--验证码--%>
<script>

    $(function(){
        var show_num = [];
        draw(show_num);

        $("#canvas").on('click',function(){
            draw(show_num);
        })
        $(".btn").on('click',function(){
            var val = $(".input-val").val().toLowerCase();
            var num = show_num.join("");
            if(val==''){

            }else if(val == num){
                $(".input-val").val('');
                draw(show_num);

            }else{
                alert('验证码错误！请重新输入！');
                $(".input-val").val('');
                draw(show_num);
            }
        })
    })

    function draw(show_num) {
        var canvas_width=$('#canvas').width();
        var canvas_height=$('#canvas').height();
        var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
        var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
        canvas.width = canvas_width;
        canvas.height = canvas_height;
        var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
        var aCode = sCode.split(",");
        var aLength = aCode.length;//获取到数组的长度

        for (var i = 0; i <= 3; i++) {
            var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
            var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
            var txt = aCode[j];//得到随机的一个内容
            show_num[i] = txt.toLowerCase();
            var x = 10 + i * 20;//文字在canvas上的x坐标
            var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
            context.font = "bold 23px 微软雅黑";

            context.translate(x, y);
            context.rotate(deg);

            context.fillStyle = randomColor();
            context.fillText(txt, 0, 0);

            context.rotate(-deg);
            context.translate(-x, -y);
        }
        for (var i = 0; i <= 5; i++) { //验证码上显示线条
            context.strokeStyle = randomColor();
            context.beginPath();
            context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.stroke();
        }
        for (var i = 0; i <= 30; i++) { //验证码上显示小点
            context.strokeStyle = randomColor();
            context.beginPath();
            var x = Math.random() * canvas_width;
            var y = Math.random() * canvas_height;
            context.moveTo(x, y);
            context.lineTo(x + 1, y + 1);
            context.stroke();
        }
    }

    function randomColor() {//得到随机的颜色值
        var r = Math.floor(Math.random() * 256);
        var g = Math.floor(Math.random() * 256);
        var b = Math.floor(Math.random() * 256);
        return "rgb(" + r + "," + g + "," + b + ")";
    }
</script>
<script>
    //教师登录
    function teacherLogin() {
        var user_username = $("#user_username").val();
        var user_password = $("#user_password").val();
        $.ajax({
            type: 'post',
            url: '/teacherLogin',
            data: {unum: user_username, upwd: user_password,utype:0},
            success: function (data) {
                if (data.success) {
                    location.href = "/index";
                } else {
                    layui.use('layer', function () {
                        var layer = layui.layer;
                        layer.msg('登录失败:用户名或密码错误',{icon: 2});
                    });
                }
            }
        });
    }

    //学生登录
    function studentLogin(){
        var user_username = $("#username").val();
        var user_password = $("#password").val();
        $.ajax({
            type: 'post',
            url: '/studentLogin',
            data: {unum: user_username, upwd: user_password,utype:1},
            success: function (data) {
                if (data.success) {
                    location.href = "admin/exam.jsp";
                } else {
                    layui.use('layer', function () {
                        var layer = layui.layer;
                        layer.msg('登录失败:用户名或密码错误',{icon: 2});
                    });
                }
            }
        });
    }

    //切换登录和注册
    $("#student_login").hide();
    $(function () {
       $("#student_bt").click(function () {
           $("#teacher_login").hide();
           $("#student_login").fadeIn("slow");
       });
       $("#teacher_bt").click(function () {
           $("#student_login").hide();
           $("#teacher_login").fadeIn("slow");
       });
    });
</script>
</body>
</html>