<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/includes/ctx.jsp" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台登录系统</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css" />
	<style type="text/css">
		body{height:100%;background:#16a085;overflow:hidden;}
		canvas{z-index:-1;position:absolute;}
		#message{font-size:18px;color:#FCFCFC}
	</style>
</head>
<body>
	<dl class="admin_login">
 		<dt>
  			<strong>站点后台管理系统</strong>
  			<em>Management System</em>
 		</dt>
 		<dd class="user_icon">
 			<input type="text" placeholder="账号" id="username" class="login_txtbx"/>
 		</dd>
 		<dd class="pwd_icon">
 			<input type="password" placeholder="密码" id="password" class="login_txtbx"/>
 		</dd>
 		<dd class="val_icon">
 			<div class="checkcode">
    			<input type="text" id="J_codetext" placeholder="验证码" maxlength="4" class="login_txtbx">
    			<canvas class="J_codeimg" id="myCanvas">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
  			</div>
  			<input type="button" value="更换验证码" class="ver_btn" onClick="createCode();">
 		</dd>
 		<dd>
			<input type="button" value="立即登陆" id="loginbtn" class="submit_btn"/>
		</dd>
		<dd>
			<p id="message"></p>
		</dd> 
	</dl>

	<script src="${ctx}/js/jquery-1.11.2.js"></script>
	<script src="${ctx}/js/Particleground.js"></script>
	<script src="${ctx}/js/verificationNumbers.js"></script>
	<script>
		$(document).ready(function() {
		  	//粒子背景特效
			$('body').particleground({
		    	dotColor: '#5cbdaa',
				lineColor: '#5cbdaa'
			});
			//验证码
			createCode();
			
			$("#loginbtn").click(function(){
				//  系统生成的验证码
				var codeToUp = code.toUpperCase();
				//  用户登录的验证码
				var incode = $("#J_codetext").val().toUpperCase();
				//  用户登录用户名
				var username = $("#username").val();
				//  用户登录密码
				var password = $("#password").val();
				
				var msgdom = $("#message");
				if(codeToUp!=incode){
					alert(codeToUp +"---"+incode);
					msgdom.html("验证码输入错误;");
					createCode();
					return ;
				}else if(username==""){
					msgdom.html("请输入用户名;");
					createCode();
					return ;
				}else if(password==""){
					msgdom.html("请输入密码;");
					createCode();
					return ;
				}
				
				$.ajax({
					type:"post",
					url:"${ctx}/login.html",
					dataType:"json",
					data:{username:username,password:password},
					success:function(data){
						var obj = eval(data);
						if(obj.code==0){
							$("#J_codetext").val("");
							$("#username").val("");
							$("#password").val("");
							msgdom.html(obj.message);
							createCode();
							return ;
						}else{
							window.location.href = "index.jsp";
						}
						
					},
					error:function(e){
						msgdom.html(e.message);
					}
				});
			});
		});
	</script>
</body>
</html>