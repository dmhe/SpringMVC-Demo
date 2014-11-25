<@override name="content">
	<!--搜索表单开始-->
	<#import "../../macro/queryForm.ftl" as form />
	<@form.queryForm formParams={"formId":"queryForm", "formAction":"${base}/admin/admin/getAuthorities", 
			"inputs":[{"type":"text", "label":"权限名称", "name":"name", "id":"", "value":name}]} />
	<!--搜索表单结束-->
	
	<!--数据列表开始-->
	<div class="panel panel-default">
		<div class="panel-heading">权限列表
			<button type="button" class="btn btn-default pull-right" data-toggle="modal" data-target="#addModal">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 添加
			</button>
		</div>
		<table class="table table-bordered">
			<thead>
				<tr>
					<td>序号</td>
					<td>权限名称</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
				<#if pagination?? && pagination.result?? && (pagination.result?size>0)>
					<#list pagination.result as authority>
						<#if authority_index%2==0><#assign trColor="active" /><#else><#assign trColor="" /></#if>
						<tr class="${trColor}">
							<td>${authority_index+1}</td>
							<td>${authority.name}</td>
							<td>
								<a class="btn btn-info btn-xs" href="${base}/admin/admin/toGrantResources?id=${authority.id}">
									<i class="glyphicon glyphicon-edit icon-white"></i> 授予权限
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
	
	<!--添加权限弹出框开始-->
	<#import "../../macro/addFormModal.ftl" as addModal />
	<@addModal.addFormModal modalParams={"modalId":"addModal", "modalTitle":"添加权限"} 
		formParams={"formId":"addAuthorityForm", "formAction":"${base}/admin/admin/saveAuthority", 
			"inputs":[{"type":"text", "label":"权限名称", "name":"name", "id":"", "value":""},
				{"type":"text", "label":"权限描述", "name":"description", "id":"", "value":""}]} 
		saveAction="$('#addAuthorityForm').submit();" />
	<!--添加权限弹出框结束-->
	
	<#include "../common/message.ftl" />
</@override>
<@extends name="../base.ftl"/>