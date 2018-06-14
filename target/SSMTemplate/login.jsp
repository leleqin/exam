<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Eurasia DSS后台管理系统</title>
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
</head>
<body class="page-login  layout-full page-dark  " id="page_background">
<div class="page  height-full">
    <div class="page-content height-full">
        <div class="page-brand-info vertical-align animation-slide-left hidden-xs">
            <div class="page-brand vertical-align-middle">
                <div class="brand">
                    <img class="brand-img" src="login/public/images/LOGO.png" height="50" alt="Eurasia DSS">
                    <span class="logo">Eurasia</span>
                </div>
                <h3>Eurasia Decision Support System</h3>
                <ul class="list-icons">
                    <li>Eurasia Decision Support System</li>
                </ul>
                <div>
                    <a href="#" target="_blank"  target="_blank" class="btn btn-primary btn-outline">
                        <i class="fa fa-reply" aria-hidden="true"></i>&nbsp;前台链接</a>
                    <a href="#" class="btn btn-primary btn-outline margin-left-5">联系我们</a>
                </div>
            </div>
        </div>
        <div id="login" class="page-login-main animation-fade">
            <div class="vertical-align">
                <div class="vertical-align-middle">
                    <h2 class="hidden-xs" style="font-size: 24px;">老师登录</h2>
                    <p class="hidden-xs">Eurasia Decision Support System</p>
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
                        <div class="col-sm-7">
                            <button type="submit" class="btn btn-primary btn-block margin-top-10" onclick="studentLogin()">登
                                录
                            </button>
                        </div>
                        <div class="col-sm-5">
                            <button id="register_button" type="button"
                                    class="btn btn-outline btn-success btn-block margin-top-10">
                                学生登录
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="page-copyright">
                <p>© 2017
                    <a href="" target="_blank">Eurasia DSS</a>
                </p>
            </footer>
        </div>


        <div id="register" class="page-login-main animation-fade" style="display: none">
            <div class="vertical-align">
                <div class="vertical-align-middle">
                    <h2 class="hidden-xs" style="font-size: 24px;">学生登录</h2>
                    <p class="hidden-xs">Eurasia Decision Support System</p>
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
                            <button type="submit" class="btn btn-primary btn-block margin-top-10" onclick="teacherLogin()">登
                                录
                            </button>
                        </div>
                        <div class="col-sm-5">
                            <button id="login_button" type="button"
                                    class="btn btn-outline btn-success btn-block margin-top-10">
                                返回
                            </button>                        </div>
                    </div>
                </div>
            </div>
            <footer class="page-copyright">
                <p>© 2017
                    <a href="" target="_blank">Eurasia DSS</a>
                </p>
            </footer>
        </div>
    </div>
</div>
<script>
</script>
<script>
    //教师登录
    function studentLogin() {
        var user_username = $("#user_username").val();
        var user_password = $("#user_password").val();
        $.ajax({
            type: 'post',
            url: '/studentLogin',
            data: {uname: user_username, upwd: user_password,utype:0},
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
    function teacherLogin(){
        var user_username = $("#username").val();
        var user_password = $("#password").val();
        $.ajax({
            type: 'post',
            url: '/teacherLogin',
            data: {uname: user_username, upwd: user_password,utype:1},
            success: function (data) {
                if (data.success) {
                    location.href = "examine/exam.html";
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
    $("#register").hide();
    $(function () {
       $("#register_button").click(function () {
           $("#login").hide();
           $("#register").fadeIn("slow");
       });
       $("#login_button").click(function () {
           $("#register").hide();
           $("#login").fadeIn("slow");
       });
    });
</script>
</body>
</html>