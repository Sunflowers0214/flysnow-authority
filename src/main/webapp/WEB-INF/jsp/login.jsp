<%@ page language="java" import="java.util.*,java.net.*" pageEncoding="UTF-8" %>
<%
    InetAddress addr = InetAddress.getLocalHost();
    String ipAddress = addr.getHostAddress().toString();//获得本机IP
%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/jsp/commons/common.jsp" %>
<html>
<head>
    <title>登录页面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <meta name="copyright" content="Copyright 2018"/>
    <link type="text/css" rel="stylesheet" href="css/login.css"/>
    <script language="javascript">
        var ipAddress = "<%=ipAddress%>"

        function doEnterKey() {
            if (event.keyCode == 13) {
                doLogin();
            }
        }

        function doLogin() {
            var uname = $("#userAccount");
            var pwd = $("#password");

            if ($.trim(uname.val()) == "") {
                $("#passwordspan").html("");
                $("#msg_span").html("用户名不能为空！");
                uname.focus();
            } else if ($.trim(pwd.val()) == "") {
                $("#userspan").html("");
                $("#msg_span").html("密码不能为空！");
                pwd.focus();
            } else {
                $("#msg_span").html("");
                $.ajax({
                    url: '${baseurl}ajaxLogin',// 跳转到 action
                    data: {
                        userAccount: uname.val(),
                        password: pwd.val(),
                        ipAddress: ipAddress
                    },
                    type: 'post',
                    cache: false,
                    dataType: 'json',
                    success: function (data) {
                        if (data.code != "success") {
                            $("#msg_span").html(data.msg);
                        } else {
                            location.href = "${baseurl}home";
                        }
                    },
                    error: function () {
                        alert("异常！");
                    }
                });
            }
        }
    </script>
</head>
<body onkeypress="doEnterKey();" id="userlogin_body">
<form id="thefrom" name="thefrom" action="user/action/login_action.php" method="post">
    <input type="hidden" value="login" name="action"/>
    <input type="hidden" id="logintype" name="logintype"/>
    <div id="panSiteFactory">
        <div id="siteFactoryLogin">
            <div id="user_login">
                <dl>
                    <dd id="user_top">
                        <ul>
                            <li class="user_top_l"></LI>
                            <li class="user_top_c"></LI>
                            <li class="user_top_r"></LI>
                        </ul>
                    <dd id="user_main">
                        <ul>
                            <li class="user_main_l"></li>
                            <li class="user_main_c topD">
                                <ul class="login">
                                    <li>
                                        <span class="left">用户名：</span>
                                        <span>
										<input type="text" class="txt" id="userAccount" placeholder="用户名" maxLength="30"
                                               value="admin" autocomplete="off" validate="{required:true}"/>
									</span>
                                    </li>
                                    <li>
                                        <span class="left">密 码：</span>
                                        <span>
										<input type="password" class="txt" id="password" placeholder="密码" value="111111"
                                               autocomplete="off" validate="{required:true}"/>
									</span>
                                    </li>
                                    <li>
                                        <span id="msg_span" style="padding-bottom:7px;"></span>
                                    </li>
                                </ul>
                            </li>
                            <li class="user_main_r">
                                <img style="border-top-width: 0px; border-left-width: 0px; border-bottom-width: 0px; border-right-width: 0px"
                                     onclick=doLogin(); src="image/login/user_botton.gif">
                            </li>
                        </ul>
                    <dd id="user_bottom">
                        <ul>
                            <li class="user_bottom_l"></li>
                            <li class="user_bottom_c"></li>
                            <li class="user_bottom_r"></li>
                        </ul>
                </dl>
            </div>
        </div>
    </div>
</form>
</body>
</html>