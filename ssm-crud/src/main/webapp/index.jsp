<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>员工列表</title>
<% 
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<script src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"</link>
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 修改员工信息模态框 -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">员共信息修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">名字</label>
			    <div class="col-sm-10">
			      <p class="form-control-static" name="empName" id="emp_update_name"></p>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
			    <div class="col-sm-10">
			      <input type="email" class="form-control" name="email" id="model_update_email" placeholder="请输入邮箱">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">性别</label>
			    <div class="col-sm-10">
				  <label class="radio-inline">
				    <input type="radio" name="empGender" id="model_update_gender1" checked="checked" value="男"> 男
				  </label>
				    <label class="radio-inline">
				  	<input type="radio" name="empGender" id="model_update_gender2" value="女"> 女
				   </label>
				</div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">部门</label>
			    <div class="col-sm-3">
			      <select class="form-control" name="dId" id="depts_update_select">
			      </select>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="btn_update_emp">更新</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 增加员工模态框 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">名字</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="empName" id="model_add_name" placeholder="请输入姓名">
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
				    <input type="radio" name="empGender" id="model_add_gender1" checked="checked" value="男"> 男
				  </label>
				    <label class="radio-inline">
				  	<input type="radio" name="empGender" id="model_add_gender2" value="option2"> 女
				   </label>
				</div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">部门</label>
			    <div class="col-sm-3">
			      <select class="form-control" name="dId" id="depts_select">
			      </select>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="btn_add_emp">增加</button>
	      </div>
	    </div>
	  </div>
	</div>

	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<dir class="col-md-4">
				<h1>SSM-CRUD</h1>
			</dir>
		</div>
		
		<!-- 增和删按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-info" id="btn_add_emps">
					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>增加
				</button>
				<button type="button" class="btn btn-danger">
					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
				</button>
			</div>
		</div>
		
		<!-- 表格 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="table_emps">
					<thead>
						<tr>
							<th>#</th>
							<th>名字</th>
							<th>性别</th>
							<th>邮箱</th>
							<th>部门</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
		</div>
		
		<!-- 分页 -->
		<div class="row">
			<div class="col-md-6" id="page_id">
				
			</div>
			<div class="col-md-6" id="nav_id">
				<nav aria-label="Page navigation">
				</nav>
			</div>
		</div>
		
	</div>
	<script type="text/javascript">
	var totalPages;
	var currentPage;
		/* 请求数据 */
		$(function(){
			to_page(1);
		});
		
		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/emps",
				data : "pn="+pn,
				type : "GET",
				success : function(e) {
					if(e) {
						//填充表格
						table_data(e);
						//填充分页信息
						pager_data(e);
						//填充分页导航信息
						nav_data(e);
					}
				}
			});
		}
	
		/* 填充表格数据 */
		function table_data(e) {
			//每次进入清空表格信息
			$("#table_emps tbody").empty();
			var data = e.map.pageInfo.list;
			$.each(data, function(index, item) {
				var idTd = $("<td></td>").append(item.id);
				var empNameTd = $("<td></td>").append(item.empName);
				var empGenderTd = $("<td></td>").append(item.empGender=="男"?"男":"女");
				var emailTd = $("<td></td>").append(item.email);
				var deptNameTd = $("<td></td>").append(item.departmentEntity.deptName);
				
				//编辑按钮
				var btn_updata = $("<button></button>").addClass("btn btn-primary btn-sm btn_edit")
				.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑 ");
				btn_updata.attr("emp_id", item.id);
				//删除按钮
				var btn_delete = $("<button></button>").addClass("btn btn-danger btn-sm btn_delete")
				.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除 ");
				
				var btnTd = $("<td></td>").append(btn_updata).append(" ").append(btn_delete);
				
				/* 加到表格下的<tbody>里面  */
				$("<tr></tr>").append(idTd).append(empNameTd).append(empGenderTd)
				.append(emailTd).append(deptNameTd)
				.append(btnTd)
				.appendTo("#table_emps tbody")
			});
			
		}
		
		/* 填充分页信息 */
		function pager_data(e) {
			//清空分页信息
			$("#page_id").empty();
			$("#page_id").append($("<strong></strong>")
			  .append("当前是第"+e.map.pageInfo.pageNum+"页,共"+e.map.pageInfo.pages
					  +"页,共"+e.map.pageInfo.total+"条记录"));
			
			totalPages =  e.map.pageInfo.pages;
			currentPage = e.map.pageInfo.pageNum;
		}
		
		/* 填充分页导航内容  */
		function nav_data(e) {
			//nav_id
			$("#nav_id nav").empty();
			var ul = $("<ul></ul>").addClass("pagination"); 
			
			var headLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
			var previousLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
			
			if(e.map.pageInfo.pageNum != 1) {
				ul.append(headLi);
				ul.append(previousLi);
				headLi.click(function() {
					to_page(1);
				});
				previousLi.click(function() {
					to_page(e.map.pageInfo.pageNum - 1);
				});
			}
			
			var nextLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
			var footLi = $("<li></li>").append($("<a></a>").append("尾页"));
			
			$.each(e.map.pageInfo.navigatepageNums, function(index, item) {
				var pageLi = $("<li></li>").append($("<a></a>").append(item));
				ul.append(pageLi);
				if(e.map.pageInfo.pageNum == item) {
					pageLi.addClass("active");
				}
				pageLi.click(function() {
					to_page(item);
				});
				
			});
			if(e.map.pageInfo.pageNum != e.map.pageInfo.pages) {
				ul.append(nextLi);
				ul.append(footLi);
				nextLi.click(function() {
					to_page(e.map.pageInfo.pageNum + 1);
				});
				footLi.click(function() {
					to_page(e.map.pageInfo.pages);
				});
			}
			ul.appendTo("#nav_id nav")
		}
		
		$("#btn_add_emps").click(function() {
			//1.先请求带出所有部门
			emps_depts("#depts_select");
			
			$("#empAddModal").modal({
				backdrop:"static"
			});
		});
		
		function emps_depts(element) {
			$(element).empty();
			$.ajax({
				url : "${APP_PATH}/depts",				
				type : "GET",
				success : function(e) {
					if(e) {
						$.each(e.map.list, function(index, item) {
							var deptsOption = $("<option></option>").append(item.deptName).attr("value", item.id);
							deptsOption.appendTo(element);
						});
					}
				}
			});
		}
		
		//添加员工
		$("#btn_add_emp").click(function() {
			$.ajax({
				url : "${APP_PATH}/addEmp",
				type : "POST",
				data : $("#empAddModal form").serialize(),
				success : function(e) {
					if(e) {
						//1.关闭模态框
						$("#empAddModal").modal('hide')
						//2.跳转到最后一页
						to_page(totalPages+1);
					}
				}
			});
		});
		
		//点击编辑按钮emp_id
		$(document).on("click",".btn_edit" , function() {
			//1.显示部门信息
			emps_depts("#depts_update_select");
			//2.查询员工信息
			getEmpById($(this).attr("emp_id"));
			
			$("#btn_update_emp").attr("emp-id", $(this).attr("emp_id"));
			//3.弹出模态框
			$("#empUpdateModal").modal({
				backdrop:"static"
			});
		});
		
		function getEmpById(id) {
			$.ajax({
				url : "${APP_PATH}/getEmpById/" + id,
				type : "GET",
				success : function(e) {
					if(e) {
						console.log(e)
						$("#emp_update_name").text(e.map.entity.empName);
						$("#model_update_email").val(e.map.entity.email);
						$("#empUpdateModal input[name=empGender]").val([e.map.entity.empGender]);
						$("#empUpdateModal select").val([e.map.entity.did]);
					}
				}
			});
		}
		
		//点击模态框中更新按钮
		$("#btn_update_emp").click(function() {
			$.ajax({
				url : "${APP_PATH}/updateEmp/"+$(this).attr("emp-id"),
				data : $("#empUpdateModal form").serialize(),
				type : "POST",
				success : function(e) {
					if(e) {
						//1.关闭模态框
						$("#empUpdateModal").modal('hide')
						//2.跳转到当前页面
						to_page(currentPage);
					}
				}
			});
		});
		
	</script>

</body>
</html>