<#macro page paramMap={}>
	<#local formId=paramMap['formId']!"queryForm" />
	
	<#local totalCount=pagination.totalCount!0 />
	<#if totalCount lt 0>
		<#local totalCount=0 />
	</#if>
	
	<#local pageNo=pagination.pageNo!1 />
	<#if pageNo lte 0>
		<#local pageNo=1 />
	</#if>
	
	<#local totalPages=pagination.totalCount!1 />
	<#if totalPages lte 0>
		<#local totalPages=1 />
	<#else>
		<#local totalPages=(pagination.totalCount/pagination.pageSize)?ceiling>
	</#if>
	
	<#if pageNo gt 1>
		<#local prevPageNo=(pageNo-1) />
	<#else>
		<#local prevPageNo=1 />
	</#if>
	
	<#if pageNo == totalPages>
		<#local nextPageNo=pageNo />
	<#else>
		<#local nextPageNo=pageNo+1 />
	</#if>
	
	<script type="text/javascript">
		function fn_turnPage(pageNo){
			$("#pageNo").val(pageNo);
			$('${"#"+formId}').submit();
		}
	</script>	
	
	<nav>
		<ul class="pagination">
			<li><a onclick="fn_turnPage(1);">首页</a></li>
			<li><a onclick="fn_turnPage(${prevPageNo});">上一页</a></li>
			<li><a onclick="fn_turnPage(${nextPageNo});">下一页</a></li>
			<li><a onclick="fn_turnPage(${totalPages});">尾页</a></li>
			<li><div style="display:inline-block;padding:6px 20px;">记录${pagination.totalCount}条   共${(pagination.totalCount/pagination.pageSize)?ceiling}页   第${pagination.pageNo}页</div></li>
		</ul>
	</nav>
</#macro>   