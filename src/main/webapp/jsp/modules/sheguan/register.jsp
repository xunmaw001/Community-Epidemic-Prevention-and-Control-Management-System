<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
    .error {
        color: red;
    }

    html {
        width: 100%;
        height: 100%;
    }
    body {
        background-position: center center;
        background-size: cover;
        background-repeat: no-repeat;
        overflow: hidden !important;
        width: 100%;
        height: 100%;
        background-image: url('/shequyiqingfangkongguanlixitong/img/back-img-bg.jpg') !important;
    }
    .container {
        padding: 0;
        margin: 0;
        display: flex;
        height: 100%;
        width: 100%;
        justify-content: center;
        align-items: center;
    }

    #login-wrapper {
        display: flex;
        flex-direction: column;
        position: inherit;
        height: auto;
        width: 860px;
        margin: 0;
        padding: 0;
        border-radius: 8px;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0,0,0,.3);
        background-color: rgba(255, 255, 255, 1);
        box-shadow: 3px 3px 8px rgba(11, 11, 11, 1);
    }

    #login-wrapper h1 {
        line-height: 420px;
        width: 420px;
        color: #fff;
        font-size: 24px;
        margin: -30px 0 0 40px;
        padding: auto;
        border-radius: 8px;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0,0,0,.3);
        background-color: var(--publicMainColor,orange);
        box-shadow: 0 0 6px rgba(30, 144, 255, 0);
        text-align: center;
    }

    #registerForm .form-group-l-r {
        display: flex;
        flex-wrap: wrap;
    }

    #registerForm .form-group {
        display: flex;
        align-items: center;
        flex-wrap: wrap;
        height: 50px;
        width: 600px;
        margin: 0 0 0 520px;
        padding: 0;
        border-radius: 0;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0,0,0,1);
        background-color: rgba(0,0,0,0);
        box-shadow: 0 0 6px rgba(255,0,0,0);
    }

    #registerForm .form-group .label {
        width: 80px;
        line-height: 34px;
        margin: -750px 0 0 0px;
        color: rgba(0, 0, 0, 1);
        font-size: 14px;
        padding: 0;
        border-radius: 0;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0,0,0,0);
        background-color: rgba(255, 0, 0, 0);
        box-shadow: 0 0 6px rgba(255,0,0,0);
        text-align: center;
    }

    .error{
        color:red;
        line-height: 20px;
        margin: -753px 0 0 1px;
        width: 60px;
        font-size: 14px;
        padding: 0;
        border-radius: 0;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0,0,0,0);
        background-color: rgba(255, 0, 0, 0);
        box-shadow: 0 0 6px rgba(255,0,0,0);
        text-align: center;
    }

    #registerForm .form-group .form-control-i {
        width: 200px;
        height: 34px;
        margin: -750px 0 0 0px;
        color: rgba(0, 0, 0, 1);
        font-size: 14px;
        padding: 0 10px;
        border-radius: 8px;
        border-width: 1px;
        border-style: solid;
        border-color: #ccc;
        background-color: rgba(255, 255, 255, 1);
        box-shadow: 0 0 6px rgba(30, 144, 255, 0);
        text-align: center;
    }

    #registerForm .form-group .form-control-i:focus {
        outline: 0 none;
    }

    #registerForm .emails #email {
        width: 120px;
        height: 34px;
        margin: -392px 0 0 0;
        color: #606266;
        font-size: 14px;
        padding: 0 12px;
        border-radius: 8px 0 0 8px;
        border-width: 1px;
        border-style: solid;
        border-color: rgba(204, 204, 204, 1);
        background-color: #fff;
        box-shadow: 0 0 6px rgba(0,0,0,0);
        text-align: left;
    }
    #registerForm .emails .btn {
        width: 80px;
        height: 34px;
        line-height: 34px;
        margin: -392px 0 0 0;
        color: #fff;
        font-size: 12px;
        padding: 0;
        border-radius: 0 8px 8px 0;
        border-width: 0;
        border-style: solid;
        border-color: rgba(255,0,0,0);
        background-color: #1e90ff;
        box-shadow: 0 0 6px rgba(0,0,0,0);
    }

    #registerForm button.pull-right {
        outline: none;
        width: 180px;
        height: 36px;
        margin: -370px 0 0 610px;
        color: rgba(0, 0, 0, 1);
        font-size: 16px;
        padding: 0 10px;
        border-radius: 50px;
        border-width: 0;
        border-style: solid;
        border-color: #ccc;
        background-color: var(--publicSubColor,rgba(128,64,1,1));
        box-shadow: 0 0 6px rgba(30, 144, 255, 0);
    }

    .r-login {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 140px;
        height: 28px;
        margin: -330px 0 0 630px;
        color: rgba(0, 0, 0, 1);
        font-size: 12px;
        padding: 0;
        border-radius: 8px;
        border-width: 0;
        border-style: solid;
        border-color: #ccc;
        background-color: rgba(255, 0, 0, 0);
        box-shadow: 0 0 6px rgba(255,0,0,0);
    }

    .r-login a {
        text-decoration: none;
        color: inherit;
    }
</style>
<body>
    <!-- Preloader -->
    <div id="preloader">
        <div id="status">&nbsp;</div>
    </div>

    <div class="container" style="position: relative;">

        <div class="" id="login-wrapper">
            <h1>注册</h1>
                <form id="registerForm" action="" method="post">
                <input id="updateId" name="id" type="hidden">
               <div class="form-group">
                   <label class="label">账户</label>
                   <input id="username" name="username" class="form-control-i"
                          placeholder="账户">
               </div>
               <div class="form-group">
                   <label class="label">密码</label>
                   <input type="password" id="password" name="password" class="form-control-i"
                          placeholder="密码">
               </div>
               <div class="form-group">
                   <label class="label">重复密码</label>
                   <input type="password" id="password1" name="password1" class="form-control-i"
                          placeholder="重复密码">
               </div>
               <div class="form-group">
                   <label class="label">用户姓名</label>
                   <input id="sheguanName" name="sheguanName" class="form-control-i"
                          placeholder="用户姓名">
               </div>
               <div class="form-group">
                   <label class="label">用户手机号</label>
                   <input id="sheguanPhone" name="sheguanPhone" class="form-control-i"
                          onchange="phoneChickValue(this)"  placeholder="用户手机号">
               </div>
               <div class="form-group">
                   <label class="label">用户身份证号</label>
                   <input id="sheguanIdNumber" name="sheguanIdNumber" class="form-control-i"
                          onchange="idNumberChickValue(this)"  placeholder="用户身份证号">
               </div>
               <div class="form-group">
                   <label class="label">性别</label>
                   <select id="sexTypesSelect" name="sexTypes" class="form-control-i">
                   </select>
               </div>
               <div class="form-group">
                   <label class="label">用户邮箱</label>
                   <input id="sheguanEmail" name="sheguanEmail" class="form-control-i"
                          placeholder="用户邮箱">
               </div>
              <div class="form-group-l-r">
                  <button id="submitBtn" class="btn btn-primary pull-right" type="button">注 册</button>
              </div>
              <div class="r-login">
                  <a href="javascript:window.location.href='../../login.jsp'">已有账号，直接登录</a>
              </div>
            </form>
        </div>
    </div>
    <%@ include file="../../static/foot.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
    <script>
        <%@ include file="../../utils/menu.jsp"%>
        <%@ include file="../../static/utils.js"%>
        <%@ include file="../../utils/baseUrl.jsp"%>

        var tableName = "sheguan";
        var pageType = "register";
        var updateId = "";
        var crossTableId = -1;
        var crossTableName = '';
        var ruleForm = {};
        var crossRuleForm = {};

        // 下拉框数组
        <!-- 当前表的下拉框数组 -->
        var sexTypesOptions = [];

        var ruleForm = {};


        // 文件上传
        function upload() {
        <!-- 当前表的文件上传 -->

        $('#sheguanPhotoupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                var photoUrl= 'file/download?fileName=' + data.result.file;
                document.getElementById('sheguanPhotoImg').setAttribute('src',baseUrl+photoUrl);
                document.getElementById('sheguanPhoto-input').setAttribute('value',photoUrl);
            }
        });

        }

        // 表单提交
        function submit() {

            if (validform() == true) {
                let data = {};
                getContent();
                if( $("#password").val() == null || $("#password").val() == "" ){
                    layui.layer.msg("密码不能为空", {time: 2000,icon: 5});
                    return false;
                }else if( $("#password").val() != $("#password1").val() ){
                    layui.layer.msg("两次密码不一致", {time: 2000,icon: 5});
                    return false;
                }
                let value = $('#registerForm').serializeArray();
                $.each(value, function (index, item) {
                    data[item.name] = item.value;
                });
                httpJson("sheguan/register", "POST", data, (res) => {
                    if(res.code == 0){
                        layui.layer.msg("注册成功", {time: 2000,icon: 6});
                        if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                            window.sessionStorage.removeItem('onlyme');
                            window.location.href="../../login.jsp";
                        } else {
                            window.location.href ="../../login.jsp";
                        }
                    }
                });
            } else {
                layui.layer.msg("表单未填完整或有错误", {time: 2000,icon: 5});
            }
        }

        <!-- 查询当前表的所有列表 -->
        function sexTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=sex_types", "GET", {}, (res) => {
                if(res.code == 0){
                    sexTypesOptions = res.data.list;
                }
            });
        }

        //初始化下拉框
        <!-- 初始化当前表的下拉框 -->
        function initializationSextypesSelect(){
            var sexTypesSelect = document.getElementById('sexTypesSelect');
            if(sexTypesSelect != null && sexTypesOptions != null  && sexTypesOptions.length > 0 ){
                for (var i = 0; i < sexTypesOptions.length; i++) {
                        sexTypesSelect.add(new Option(sexTypesOptions[i].indexName,sexTypesOptions[i].codeIndex));
                }
            }
        }




        // 获取富文本框内容
        function getContent() {

            <!-- 获取当前表的富文本框内容 -->
        }

        function exit() {
            window.location.href = "../../login.jsp";
        }
        // 表单校验
        function validform() {
            return $("#registerForm").validate({
                rules: {
                        username: "required",
                        password: "required",
                        sheguanName: "required",
                        sheguanPhone: "required",
                        sheguanIdNumber: "required",
                        sheguanPhoto: "required",
                        sexTypes: "required",
                        sheguanEmail: "required",
                },
                messages: {
                        username: "账户不能为空",
                        password: "密码不能为空",
                        sheguanName: "用户姓名不能为空",
                        sheguanPhone: "用户手机号不能为空",
                        sheguanIdNumber: "用户身份证号不能为空",
                        sheguanPhoto: "用户头像不能为空",
                        sexTypes: "性别不能为空",
                        sheguanEmail: "用户邮箱不能为空",
                }
            }).form();
        }

        $(document).ready(function () {
            $('#exitBtn').on('click', function (e) {
                e.preventDefault();
                exit();
            });
            //查询所有下拉框
        <!--  当前表的下拉框  -->
            sexTypesSelect();

            // 初始化下拉框
        <!--  初始化当前表的下拉框  -->
            initializationSextypesSelect();
            //注册表单验证
            $(validform());
            //初始化上传按钮
            upload();
        <%@ include file="../../static/myInfo.js"%>
                    $('#submitBtn').on('click', function (e) {
                        e.preventDefault();
                        //console.log("点击了...提交按钮");
                        submit();
                    });
        });
        layui.use(['layer' , 'jquery'], function() {
            var layer = layui.layer;
            var jquery = layui.jquery;
            // layui.layer.msg("输入不合法", {time: 2000,icon: 5});
            //    5失败 6成功
        });


        // 用户登出
        <%@ include file="../../static/logout.jsp"%>
    </script>
</body>

</html>