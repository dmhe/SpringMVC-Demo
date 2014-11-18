<@override name="content">
	<!--搜索表单开始-->
	<#import "../../macro/queryForm.ftl" as form />
	<@form.queryForm formParams={"formId":"queryForm", "formAction":"${base}/admin/admin/getAdminUsers", 
			"inputs":[{"type":"text", "label":"用户名", "name":"username", "id":"", "value":username}, 
				{"type":"checkbox", "label":"是否有效", "name":"flag", "value":flag, "conditionValue":true}]} />
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
	
	<!--添加用户弹出框开始-->
	<#import "../../macro/addFormModal.ftl" as addModal />
	<@addModal.addFormModal modalParams={"modalId":"addModal", "modalTitle":"添加用户"} 
		formParams={"formId":"addUserForm", "formAction":"${base}/admin/admin/saveAdminUser", 
			"inputs":[{"type":"text", "label":"用户名", "name":"username", "id":"username", "value":""}, 
				{"type":"password", "label":"密码", "name":"password", "id":"password", "value":""}, 
				{"type":"password", "label":"确认密码", "name":"password2", "id":"password2", "value":""},
				{"type":"checkbox", "label":"角色", "name":"roleIds", "options":allRoles}]} 
		saveAction="$('#addUserForm').submit();" />
	<!--添加用户弹出框结束-->
	
	<!--修改用户弹出框开始-->
	<#if editedAdminUser??>
		<#import "../../macro/editFormModal.ftl" as editModal />
		<@editModal.editFormModal modalParams={"modalId":"editModal", "modalTitle":"修改用户"} 
			formParams={"formId":"editUserForm", "formAction":"${base}/admin/admin/editAdminUser", 
				"inputs":[{"type":"hidden", "label":"", "name":"id", "id":"", "value":editedAdminUser.id},
					{"type":"text", "label":"用户名", "name":"username", "id":"username", "value":editedAdminUser.username}, 
					{"type":"checkbox", "label":"角色", "name":"roleIds", "options":allRoles, "ownedValues":editedAdminUser.roles},
					{"type":"radio", "label":"是否有效", "name":"flag", "options":[{"val":"1", "nam":"是", "conditionKey":editedAdminUser.flag, "conditionValue":true},{"val":"0", "nam":"否", "conditionKey":editedAdminUser.flag, "conditionValue":false}]}]} 
			saveAction="$('#editUserForm').submit();" />
	</#if>
	<!--修改用户弹出框结束-->
	
	<#include "../common/message.ftl" />
</@override>
<@extends name="../base.ftl"/>

