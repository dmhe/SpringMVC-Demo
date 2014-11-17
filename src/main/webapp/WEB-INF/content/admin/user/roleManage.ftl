<@override name="content">
	<div class="breadcrumb">
		<form id="queryForm" class="form-inline" role="form" action="${base}/admin/admin/getRoles" method="post">
			<div class="form-group" style="margin-right:20px;">
		    	<label class="sr-only" for="name">角色名</label>
		    	<input type="text" class="form-control" name="name" placeholder="角色名" value="<#if name??>${name}</#if>">
			</div>
			<input type="hidden" id="pageNo" name="pageNo" value="<#if pageNo??>${pageNo}</#if>" />
			<input type="submit" class="btn btn-default" value="查询" />
		</form>
	</div>
	<table class="table table-bordered">
		<thead>
			<tr class="info">
				<th>序号</th>
				<th>角色名</th>
				<th>资源</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<#if pagination?? && pagination.result?? && (pagination.result?size>0)>
				<#list pagination.result as role>
					<#if role_index%2==0><#assign trColor="" /><#else><#assign trColor="active" /></#if>
					<tr class="${trColor}">
						<td>${role_index+1}</td>
						<td>${role.name}</td>
						<td>
							<#if role.resources?? && (role.resources?size>0)>
								<#list role.resources as resource>
									${resource.name}&nbsp;&nbsp;
								</#list>
							</#if>
						</td>
						<td>
							<a class="btn btn-info btn-xs" href="#">
								<i class="glyphicon glyphicon-edit icon-white"></i> 编辑
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
	<#import "../../macro/pagination.ftl" as b />
    <@b.page />
</@override>
<@extends name="../base.ftl"/>

