<#macro queryForm formParams={}>
	<#local formId=formParams['formId']!"queryForm" />
	<#local formAction=formParams['formAction']!"" />
	<#local formMethod=formParams['formMethod']!"post" />
	<#if formParams['inputs']??>
		<#local inputs=formParams['inputs'] />
	</#if>
	
	<script type="text/javascript">
		function submitForm() {
			$("#pageNo").val("");
			$("#${formId}").submit();
		}
	</script>
	<div class="breadcrumb">
		<form id="${formId}" class="form-inline" role="form" action="${formAction}" method="${formMethod}">
			<#list inputs as input>
				<#if input["type"]??>
					<#local type=input["type"] />
					<#local label=input["label"]!'' />
					<#local name=input["name"]!'' />
					<#local id=input["id"]!'' />
					<#local value=input["value"] />
					<#if type=="hidden">
						<input type="hidden" name="${name}" id="${id}" value="<#if value??>${value}</#if>" />
					<#elseif type=="text">
						<div class="form-group" style="margin-right:20px;">
					    	<label class="sr-only" for="${name}">${label}</label>
					    	<input type="text" class="form-control" name="${name}" placeholder="${label}" value="<#if value??>${value}</#if>">
						</div>
					<#elseif type=="checkbox">
						<#local conditionValue=input["conditionValue"]>
						<div class="checkbox" style="margin-right:20px;">
					    	<label>
					    		<input type="checkbox" name="${name}" <#if value?? && value==conditionValue>checked="checked"</#if>> ${label}
					    	</label>
						</div>
					<#elseif type=="select">
						<#local options=input["options"] />
						<div class="form-group" style="margin-right:20px;">
							<label class="sr-only" for="${name}">${label}</label>
							<select class="form-control" name="${name}">
								<option value="">${label}</option>
								<#if options??>
									<#list options as option>
										<option value="${option}" <#if value?? && value==option>selected="selected"</#if>>${option.typeName}</option>
									</#list>
								</#if>
							</select>
						</div>
					<#elseif type=="button">
						<#local btnAction=input["btnAction"]>
						<input type="button" class="btn btn-default" value="${value}" onclick="${btnAction}" />
					</#if>
				</#if>
			</#list>
			<input type="hidden" id="pageNo" name="pageNo" value="" />
			<input type="button" class="btn btn-default" value="查询" onclick="submitForm();" />
		</form>
	</div>
</#macro>   