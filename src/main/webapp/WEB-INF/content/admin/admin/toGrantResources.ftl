<@override name="content">
	<div>
	    <ul class="breadcrumb">
	        <li>
	            <a href="#">权限管理</a>
	        </li>
	        <li>
	            <a href="#">授权资源</a>
	        </li>
	    </ul>
	</div>
	<form id="queryForm" action="${base}/admin/admin/toGrantResources" method="post">
		<input type="hidden" name="id" value="<#if grantedAuthority??>${grantedAuthority.id}</#if>" />
		<input type="hidden" id="pageNo" name="pageNo" value="" />
	</form>
	<!--数据列表开始-->
	<form id="grantForm" action="${base}/admin/admin/saveAuthority" method="post">
		<div class="panel panel-default">
			<div class="panel-heading">权限-<#if grantedAuthority??>${grantedAuthority.name}</#if>
				<button type="button" class="btn btn-default pull-right" onclick="$('#grantForm').submit();">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 授权
				</button>
			</div>
			<input type="hidden" name="id" value="<#if grantedAuthority??>${grantedAuthority.id}</#if>" />
			<input type="hidden" name="name" value="<#if grantedAuthority??>${grantedAuthority.name}</#if>" />
			<table class="table table-bordered">
				<thead>
					<tr>
						<td>
							<label style="margin-bottom:0;">
								<input type="checkbox" onclick="">
							</label>
						</td>
						<td>资源名称</td>
						<td>资源类型</td>
						<td>资源URL</td>
					</tr>
				</thead>
				<tbody>
					<#if pagination?? && pagination.result?? && (pagination.result?size>0)>
						<#list pagination.result as resource>
							<#assign grantFlag=false />
							<#assign trColor="" />
							<#if grantedRole?? && grantedRole.resources?? && (grantedRole.resources?size>0)>
								<#list (grantedRole.resources) as grantedResource>
									<#if grantedResource.id==resource.id>
										<#assign grantFlag=true />
										<#assign trColor="info" />
									</#if>
								</#list>
							</#if>
							<tr class="${trColor}">
								<td>
									<label style="margin-bottom:0;">
										<input type="checkbox" name="resourceIds" value="${resource.id}" <#if grantFlag>checked="checked"</#if>>
									</label>
								</td>
								<td>${resource.name}</td>
								<td>${resource.type.typeName}</td>
								<td>${resource.url}</td>
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
	</form>
	<#import "../../macro/pagination.ftl" as b />
	<@b.page />
    <!--数据列表结束-->
</@override>
<@extends name="../base.ftl"/>

