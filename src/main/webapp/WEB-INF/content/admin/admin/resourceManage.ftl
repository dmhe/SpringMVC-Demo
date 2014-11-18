<@override name="content">
	<!--搜索表单开始-->
	<#import "../../macro/queryForm.ftl" as form />
	<@form.queryForm formParams={"formId":"queryForm", "formAction":"${base}/admin/admin/getResources", 
			"inputs":[{"type":"text", "label":"资源名称", "name":"name", "id":"", "value":name}, 
				{"type":"select", "label":"资源类型", "name":"type", "value":type, "options":resourceTypes}]} />
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
					<td>资源名称</td>
					<td>资源类型</td>
					<td>资源URL</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
				<#if pagination?? && pagination.result?? && (pagination.result?size>0)>
					<#list pagination.result as resource>
						<#if resource_index%2==0><#assign trColor="active" /><#else><#assign trColor="" /></#if>
						<tr class="${trColor}">
							<td>${resource_index+1}</td>
							<td>${resource.name}</td>
							<td>${resource.type.typeName}</td>
							<td>${resource.url}</td>
							<td>
								<a class="btn btn-info btn-xs" href="#">
									<i class="glyphicon glyphicon-edit icon-white"></i> 编辑
								</a>
							</td>
						</tr>
					</#list>
				<#else>
					<tr>
						<td colspan="5">无记录</td>
					</tr>
				</#if>
			</tbody>
		</table>
	</div>
	<#import "../../macro/pagination.ftl" as b />
    <@b.page />
    <!--数据列表结束-->
</@override>
<@extends name="../base.ftl"/>

