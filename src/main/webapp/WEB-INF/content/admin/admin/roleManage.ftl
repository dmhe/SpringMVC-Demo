<@override name="content">
	<!--搜索表单开始-->
	<#import "../../macro/queryForm.ftl" as form />
	<@form.queryForm formParams={"formId":"queryForm", "formAction":"${base}/admin/admin/getRoles", 
			"inputs":[{"type":"text", "label":"角色名称", "name":"name", "id":"", "value":name}]} />
	<!--搜索表单结束-->
	
	<!--数据列表开始-->
	<div class="panel panel-default">
		<div class="panel-heading">角色列表
			<button type="button" class="btn btn-default pull-right" data-toggle="modal" data-target="#addModal">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 添加
			</button>
		</div>
		<table class="table table-bordered">
			<thead>
				<tr>
					<td>序号</td>
					<td>角色名称</td>
					<td>权限</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
				<#if pagination?? && pagination.result?? && (pagination.result?size>0)>
					<#list pagination.result as role>
						<#if role_index%2==0><#assign trColor="active" /><#else><#assign trColor="" /></#if>
						<tr class="${trColor}">
							<td>${role_index+1}</td>
							<td>${role.name}</td>
							<td>
								<#if role.authorities?? && (role.authorities?size>0)>
									<#list role.authorities as authority>
										${authority.name}&nbsp;&nbsp;
									</#list>
								</#if>
							</td>
							<td>
								<a class="btn btn-info btn-xs" href="${base}/admin/admin/toEditRole?id=${role.id}">
									<i class="glyphicon glyphicon-edit icon-white"></i> 修改
								</a>
							</td>
						</tr>
					</#list>
				<#else>
					<tr>
						<td colspan="4">无记录</td>
					</tr>
				</#if>
			</tbody>
		</table>
	</div>
	<#import "../../macro/pagination.ftl" as b />
    <@b.page />
    <!--数据列表结束-->
	
	<!--添加角色弹出框开始-->
	<#import "../../macro/addFormModal.ftl" as addModal />
	<@addModal.addFormModal modalParams={"modalId":"addModal", "modalTitle":"添加角色"} 
		formParams={"formId":"addRoleForm", "formAction":"${base}/admin/admin/saveRole", 
			"inputs":[{"type":"text", "label":"角色名称", "name":"name", "id":"name", "value":""}]} 
		saveAction="$('#addRoleForm').submit();" />
	<!--添加角色弹出框结束-->
	
	<!--修改角色弹出框开始-->
	<#if editedRole??>
		<#import "../../macro/editFormModal.ftl" as editModal />
		<@editModal.editFormModal modalParams={"modalId":"editModal", "modalTitle":"修改角色"} 
			formParams={"formId":"editRoleForm", "formAction":"${base}/admin/admin/editRole", 
				"inputs":[{"type":"hidden", "label":"", "name":"id", "id":"", "value":editedRole.id},
					{"type":"text", "label":"角色名称", "name":"name", "id":"", "value":editedRole.name}, 
					{"type":"checkbox", "label":"权限", "name":"authorityIds", "options":allAuthorities, "ownedValues":editedRole.authorities}]} 
			saveAction="$('#editRoleForm').submit();" />
	</#if>
	<!--修改角色弹出框结束-->
	
	<#include "../common/message.ftl" />
</@override>
<@extends name="../base.ftl"/>

