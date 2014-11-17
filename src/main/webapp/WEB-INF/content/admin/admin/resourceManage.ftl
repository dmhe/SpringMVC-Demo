<@override name="content">
	<script type="text/javascript">
		function submitForm() {
			$("#pageNo").val("");
			$("#queryForm").submit();
		}
	</script>
	<div class="breadcrumb">
		<form id="queryForm" class="form-inline" role="form" action="${base}/admin/admin/getResources" method="post">
			<div class="form-group" style="margin-right:20px;">
		    	<label class="sr-only" for="name">资源名称</label>
		    	<input type="text" class="form-control" name="name" placeholder="资源名称" value="<#if name??>${name}</#if>">
			</div>
			<div class="form-group" style="margin-right:20px;">
				<label class="sr-only" for="type">资源类型</label>
				<select class="form-control" name="type">
					<option value="">资源类型</option>
					<#if resourceTypes??>
						<#list resourceTypes as resourceType>
							<option value="${resourceType}" <#if type?? && type==resourceType>selected="selected"</#if>>${resourceType.typeName}</option>
						</#list>
					</#if>
				</select>
			</div>
			<input type="hidden" id="pageNo" name="pageNo" value="" />
			<input type="button" class="btn btn-default" value="查询" onclick="submitForm();" />
		</form>
	</div>
	<table class="table table-bordered">
		<thead>
			<tr class="info">
				<th>序号</th>
				<th>资源名称</th>
				<th>资源类型</th>
				<th>资源URL</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<#if pagination?? && pagination.result?? && (pagination.result?size>0)>
				<#list pagination.result as resource>
					<#if resource_index%2==0><#assign trColor="" /><#else><#assign trColor="active" /></#if>
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
	<#import "../../macro/pagination.ftl" as b />
    <@b.page />
</@override>
<@extends name="../base.ftl"/>

