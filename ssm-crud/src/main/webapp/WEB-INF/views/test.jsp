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
<link rel="stylesheet" href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" 
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
</head>
<body>
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
				<button class="btn btn-info">
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
				<table class="table table-hover">
					<tr>
						<th>#</th>
						<th>名字</th>
						<th>性别</th>
						<th>邮箱</th>
						<th>部门</th>
						<th>操作</th>
					</tr>
					<s:forEach items="${pageInfo.list }" var="currentItem">
						<tr>
							<td>${currentItem.id }</td>
							<td>${currentItem.empName }</td>
							<td>${currentItem.empGender=="男"?"男":"女" }</td>
							<td>${currentItem.email }</td>
							<td>${currentItem.departmentEntity.deptName }</td>
							<td>
								<button type="button" class="btn btn-info btn-sm">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>修改
								</button>
								<button type="button" class="btn btn-danger btn-sm">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
								</button>
							</td>
						</tr>
					</s:forEach>
				</table>
			</div>
		</div>
		
		<!-- 分页 -->
		<div class="row">
			<div class="col-md-6">
				<strong>当前是第${pageInfo.pageNum }页,共${pageInfo.pages }页,共${pageInfo.total }条记录</strong>
			</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				  	<s:if test="${pageInfo.pageNum != 1}">
				  		<li><a href="${APP_PATH }/emps?pn=1">首页</a></li>
				  	</s:if>
				  	<s:if test="${pageInfo.hasPreviousPage == true }">
					    <li>
					      <a href="${APP_PATH }/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
				    </s:if>
				    <s:forEach items="${pageInfo.navigatepageNums }" var="pageNav">
				    	<s:if test="${pageInfo.pageNum==pageNav}">
				    		<li class="active"><a href="${APP_PATH }/emps?pn=${pageNav}">${pageNav}</a></li>
				    	</s:if>
				    	<s:if test="${pageInfo.pageNum!=pageNav}">
					    	<li><a href="${APP_PATH }/emps?pn=${pageNav}">${pageNav}</a></li>
					    </s:if>
				    </s:forEach>
				    <s:if test="${pageInfo.hasNextPage == true }">
					    <li>
					      <a href="${APP_PATH }/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				    </s:if>
				    <s:if test="${pageInfo.pageNum != pageInfo.pages}">
				    <li><a href="${APP_PATH }/emps?pn=${pageInfo.pages }">尾页</a></li>
				    </s:if>
				  </ul>
				</nav>	
			</div>
		</div>
	</div>


</body>
</html>