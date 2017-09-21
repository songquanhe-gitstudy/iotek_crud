<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title>登录</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<% 
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<script src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"</link>
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

	<style type="text/css">
	body{
	   background: url(images/a.jpg)repeat;
	}
	#login-box {
		border:1px solid #798A8F;
		padding: 35px;
		border-radius:15px;
		background: #56666B;
		color: #fff;
	}

	</style>
</head>
<body>

	<!-- 注册模态框 -->
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">注册</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" method="post">
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="userName" id="model_add_name" placeholder="请填写用户名">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">工号</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="jobNumber" id="model_add_name" placeholder="请填写工号">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">密码</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="password" id="model_add_name" placeholder="请填写密码">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">学历</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="education" id="model_add_name" placeholder="请填写学历">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
			    <div class="col-sm-10">
			      <input type="email" class="form-control" name="email" id="model_add_email" placeholder="请输入邮箱">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">性别</label>
			    <div class="col-sm-10">
				  <label class="radio-inline">
				    <input type="radio" name="gender" id="model_add_gender1" checked="checked" value="M"> 男
				  </label>
				    <label class="radio-inline">
				  	<input type="radio" name="gender" id="model_add_gender2" value="F"> 女
				   </label>
				</div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="btn_add_user">增加</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 登录提交的表单 -->
	<div class="container" id="top">
		<div class="row" style="margin-top: 150px; ">
			<div class="col-md-4"></div>
			<div class="col-md-4" id="login-box">
				<form class="form-horizontal" role="form" action="${APP_PATH}/login.do" id="from1" method="post">
				  <div class="form-group">
				    <label for="firstname" class="col-sm-3 control-label">工号</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="userID" placeholder="请输入工号" name="jobNumber">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-3 control-label">密码</label>
				    <div class="col-sm-9">
				      <input type="password" class="form-control" id="password" placeholder="请输入密码" name="password">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-3 col-sm-10">
				      <div class="checkbox">
				        <label class="radio-inline">
						  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked="checked"> 管理员
						</label>
						<label class="radio-inline">
						  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 学生
						</label>
						<label class="radio-inline">
						  <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> 老师
						</label>
				      </div>
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-md-offset-6 col-md-10">
				      <button type="submit" class="btn btn-default btn-info" id="btn_login">登录</button>
				      <button type="button" class="btn btn-info" id="btn_register" >注册</button>
				    </div>
				  </div>
				</form>
			</div>
			<div class="col-md-4"></div>
		</div>		
	</div>
	
	<script type="text/javascript">
		$(function() {
			login_pre();
		});	
		
		function login_pre() {
			
		}
		
		$("#btn_register").click(function() {
			//弹出模态框
			$("#registerModal").modal({
				backdrop:"static"
			});
		}); 
		
		//提交注册表单
		$("#btn_add_user").click(function() {
			$.ajax({
				url : "${APP_PATH}/register",
				type : "POST",
				data : $("#registerModal form").serialize(),
				success : function(e) {
					if(e) {
						alert("注册成功")
						//关闭模态框
						$("#registerModal").modal('hide')
					}
				}
			});
		});
	
	</script>
</body>
</html>