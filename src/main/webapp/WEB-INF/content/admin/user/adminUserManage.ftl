<@override name="content">
	<div class="breadcrumb">
		<form id="queryForm" class="form-inline" role="form" action="${base}/admin/admin/getAdminUsers" method="get">
			<div class="form-group" style="margin-right:20px;">
		    	<label class="sr-only" for="username">用户名</label>
		    	<input type="text" class="form-control" name="username" placeholder="用户名" value="<#if username??>${username}</#if>">
			</div>
			<div class="checkbox" style="margin-right:20px;">
		    	<label>
		    		<input type="checkbox" name="flag" <#if flag?? && flag>checked="checked"</#if>> 是否有效
		    	</label>
			</div>
			<input type="hidden" id="pageNo" name="pageNo" value="<#if pageNo??>${pageNo}</#if>" />
			<input type="submit" class="btn btn-default" value="查询" />
		</form>
	</div>
	<table class="table table-bordered">
		<thead>
			<tr class="info">
				<th>序号</th>
				<th>用户名</th>
				<th>创建时间</th>
				<th>是否有效</th>
				<th>角色</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<#if pagination?? && pagination.result?? && (pagination.result?size>0)>
				<#list pagination.result as adminUser>
					<#if adminUser_index%2==0><#assign trColor="" /><#else><#assign trColor="active" /></#if>
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
							<a class="btn btn-info btn-xs" href="#">
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
	<#import "../../macro/pagination.ftl" as b />
    <@b.page />
</@override>
<@extends name="../base.ftl"/>

