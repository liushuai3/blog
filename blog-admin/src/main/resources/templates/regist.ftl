<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${config.siteName}后台管理系统</title>
    <link href="/assets/images/favicon.ico" rel="icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/jquery-confirm@3.3.2/dist/jquery-confirm.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/nprogress@0.2.0/nprogress.min.css" rel="stylesheet">
    <link href="/assets/css/zhyd.core.css" rel="stylesheet">
</head>

<body class="login">

<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="login_wrapper">
                    <div class="animate form login_form" style="position: relative;">
                        <section class="login_content">
                            <form action="/passport/regist" method="POST" id="regist-form">
                                <h1>注册用户</h1>
                                <#if message??>
                                    <div class="alert alert-danger" role="alert">
                                        ${message!}
                                    </div>
                                </#if>
                                <input type="hidden" name="id">
                                <div>
                                    <input type="text" class="form-control" name="username" id="username" required="required" placeholder="请输入用户名"/>
                                </div>
                                <div>
                                    <input type="password" class="form-control" id="password" name="password" required="required" placeholder="请输入密码 6位以上"/>
                                </div>
                                <div>
                                    <input type="text" class="form-control" name="nickname" id="nickname" placeholder="请输入昵称"/>
                                </div>
                                <div>
                                    <input type="text" class="form-control" name="mobile" id="mobile" placeholder="请输入手机号"/>
                                </div>
                                <div>
                                    <input type="text" class="form-control" name="email" id="email" placeholder="请输入邮箱"/>
                                </div>
                                <div>
                                    <input type="text" class="form-control" name="qq" id="qq" placeholder="请输入QQ"/>
                                </div>
                                <#if enableKaptcha?? && enableKaptcha>
                                    <div class="form-group col-xs-6" style="padding-left: 0px;">
                                        <img alt="点击获取验证码" id="img-kaptcha" src="/getKaptcha" style="cursor:pointer;height: 34px;width: 180px;">
                                    </div>
                                    <div class="form-group col-xs-6">
                                        <span><input type="text" class="form-control" placeholder="验证码" id="kaptcha" name="kaptcha"></span>
                                    </div>
                                </#if>
                                <div>
                                    <button type="button" class="btn btn-success btn-login" style="width: 100%;">注册</button>
                                </div>
                                <div class="login-loading hide">
                                    <i class="fa fa-spinner fa-pulse"></i>正在注册中...
                                </div>
                            </form>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@1.11.1/dist/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.0/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-confirm@3.3.2/dist/jquery-confirm.min.js"></script>
<script src="/assets/js/zhyd.tool.js"></script>
<script>

    $("#modal").modal('show');
    $(".btn-login").click(function () {
        $(".login-loading").removeClass("hide");
        $.ajax({
            type: "POST",
            url: "/passport/regist",
            data: $("#regist-form").serialize(),
            dataType: "json",
            success: function (json) {
                $(".login-loading").addClass("hide");
                if (json.status == 200) {
                    var historyUrl = json.data || "/";
                    window.location.href = historyUrl;
                }else{
                    $.alert.error(json.message);
                    $("#img-kaptcha").attr("src", '/getKaptcha?time=' + new Date().getTime());
                }
            }
        });
    });
    $("#img-kaptcha").click(function () {
        $(this).attr("src", '/getKaptcha?time=' + new Date().getTime());
    });
    document.onkeydown = function (event) {
        var e = event || window.event || arguments.callee.caller.arguments[0];
        if (e && e.keyCode == 13) {
            $(".btn-login").click();
        }
    };
</script>
