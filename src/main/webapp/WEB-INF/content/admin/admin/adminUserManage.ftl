<@override name="content">
	<script type="text/javascript">
		function submitForm() {
			$("#pageNo").val("");
			$("#queryForm").submit();
		}
	</script>
	<!--搜索表单开始-->
	<div class="breadcrumb">
		<form id="queryForm" class="form-inline" role="form" action="${base}/admin/admin/getAdminUsers" method="post">
			<div class="form-group" style="margin-right:20px;">
		    	<label class="sr-only" for="username">用户名</label>
		    	<input type="text" class="form-control" name="username" placeholder="用户名" value="<#if username??>${username}</#if>">
			</div>
			<div class="checkbox" style="margin-right:20px;">
		    	<label>
		    		<input type="checkbox" name="flag" <#if flag?? && flag>checked="checked"</#if>> 是否有效
		    	</label>
			</div>
			<input type="hidden" id="pageNo" name="pageNo" value="" />
			<input type="button" class="btn btn-default" value="查询" onclick="submitForm();" />
		</form>
	</div>
	<!--搜索表单结束-->
	<!--数据列表开始-->
	<div class="panel panel-default">
		<div class="panel-heading">用户列表
			<button type="button" class="btn btn-default pull-right" data-toggle="modal" data-target="#addModal">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 添加
			</button>
		</div>
		<table class="table table-bordered">
			<thead>
				<tr>
					<td>序号</td>
					<td>用户名</td>
					<td>创建时间</td>
					<td>是否有效</td>
					<td>角色</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
				<#if pagination?? && pagination.result?? && (pagination.result?size>0)>
					<#list pagination.result as adminUser>
						<#if adminUser_index%2==0><#assign trColor="active" /><#else><#assign trColor="" /></#if>
						<tr class="${trColor}">
							<td>${adminUser_index+1}</td>
							<td>${adminUser.username}</td>
							<td>${adminUser.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
							<td><#if adminUser.flag?? && adminUser.flag>是<#else>否</#if></td>
							<td>
								<#if adminUser.roles?? && (adminUser.roles?size>0)>
									<#list adminUser.roles as role>
										${role.name}&nbsp;&nbsp;
									</#list>
								</#if>
							</td>
							<td>
								<a class="btn btn-info btn-xs" href="${base}/admin/admin/toEditAdminUser?id=${adminUser.id}">
									<i class="glyphicon glyphicon-edit icon-white"></i> 编辑
								</a>
							</td>
						</tr>
					</#list>
				<#else>
					<tr>
						<td colspan="6">无记录</td>
					</tr>
				</#if>
			</tbody>
		</table>
    </div>
    <#import "../../macro/pagination.ftl" as b />
	<@b.page />
	<!--数据列表结束-->
	<#import "../../macro/addFormModal.ftl" as addModal />
	<@addModal.addFormModal modalParams={"modalId":"addModal", "modalTitle":"添加用户"} 
		formParams={"formId":"addUserForm", "formAction":"${base}/admin/admin/saveAdminUser", 
			"inputs":[{"type":"text", "label":"用户名", "name":"username", "id":"username", "value":""}, 
				{"type":"password", "label":"密码", "name":"password", "id":"password", "value":""}, 
				{"type":"password", "label":"确认密码", "name":"password2", "id":"password2", "value":""},
				{"type":"checkbox", "label":"角色", "name":"roles", "content":'11'}]} 
		saveAction="$('#addUserForm').submit();" />
	<#--
	
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:450px;margin-top:80px;">
    		<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title" id="addModalLabel">添加用户</h4>
				</div>
				<div class="modal-body">
			        <form class="form-horizontal" role="form" id="addUserForm" action="${base}/admin/admin/saveAdminUser" method="post">
						<div class="form-group">
					    	<label for="username" class="col-sm-3 control-label">用户名</label>
						    <div class="col-sm-9">
						    	<input type="text" class="form-control" id="username" name="username" value="" />
						    </div>
						</div>
						<div class="form-group">
						    <label for="password" class="col-sm-3 control-label">密码</label>
						    <div class="col-sm-9">
						    	<input type="password" class="form-control" id="password" name="password" value="" />
						    </div>
						</div>
						<div class="form-group">
						    <label for="password2" class="col-sm-3 control-label">确认密码</label>
						    <div class="col-sm-9">
						    	<input type="password" class="form-control" id="password2" name="password2" value="" />
						    </div>
						</div>
						<div class="form-group">
							<label for="roles" class="col-sm-3 control-label">角色</label>
						    <div class="col-sm-9">
						    	<div class="checkbox">
						    		<#if allRoles?? && (allRoles?size>0)>
						    		<#list allRoles as role>
						      		<label>
						      			<input type="checkbox" name="roles[${role_index}].id" value="${role.id}"> ${role.name}
						        	</label>
						        	</#list>
						        	</#if>
						      	</div>
						    </div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <button type="button" class="btn btn-primary" onclick="$('#addUserForm').submit();">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	-->
	<!--修改用户弹出框开始-->
	<#if editedAdminUser??>
	<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:450px;margin-top:80px;">
    		<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title" id="editModalLabel">修改用户</h4>
				</div>
				<div class="modal-body">
			        <form class="form-horizontal" role="form" id="editUserForm" action="${base}/admin/admin/editAdminUser" method="post">
						<input type="hidden" name="id" value="<#if editedAdminUser.id??>${editedAdminUser.id}</#if>" />
						<div class="form-group">
					    	<label for="username" class="col-sm-3 control-label">用户名</label>
						    <div class="col-sm-9">
						    	<input type="text" class="form-control" id="username" name="username" value="<#if editedAdminUser.username??>${editedAdminUser.username}</#if>" />
						    </div>
						</div>
						<div class="form-group">
							<label for="roles" class="col-sm-3 control-label">角色</label>
						    <div class="col-sm-9">
						    	<div class="checkbox">
						    		<#if allRoles?? && (allRoles?size>0)>
						    		<#list allRoles as role>
						      		<label>
						      			<input type="checkbox" name="roles[${role_index}].id" value="${role.id}" 
						      				<#if editedAdminUser.roles??>
						      					<#list editedAdminUser.roles as ownedRole>
						      						<#if ownedRole.id==role.id>checked="checked"</#if>
						      					</#list>
						      				</#if>
						      			> ${role.name}
						        	</label>
						        	</#list>
						        	</#if>
						      	</div>
						    </div>
						</div>
						<div class="form-group">
							<label for="flag" class="col-sm-3 control-label">是否有效</label>
						    <div class="col-sm-9">
						    	<label class="radio-inline">
									<input type="radio" name="flag" value="1" <#if editedAdminUser.flag?? && editedAdminUser.flag>checked="checked"</#if>> 是
								</label>
								<label class="radio-inline">
									<input type="radio" name="flag" value="0" <#if !editedAdminUser.flag?? || !editedAdminUser.flag>checked="checked"</#if>> 否
								</label>
						    </div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <button type="button" class="btn btn-primary" onclick="$('#editUserForm').submit();">保存</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('#editModal').modal();
	</script>
	</#if>
	<!--修改用户弹出框结束-->
	
	<#include "../common/message.ftl" />
</@override>
<@extends name="../base.ftl"/>

