<#macro editFormModal modalParams={} formParams={} saveAction="">
	<#local modalId=modalParams['modalId']!"editModal" />
	<#local modalLabel=modalId + "Label" />
	<#local modalTitle=modalParams['modalTitle']!"修改" />
	
	<#local formId=formParams['formId']!"editForm" />
	<#local formAction=formParams['formAction']!"" />
	<#local formMethod=formParams['formMethod']!"post" />
	<#if formParams['inputs']??>
		<#local inputs=formParams['inputs'] />
	</#if>
	
	<div class="modal fade" id="<#if modalId??>${modalId}</#if>" tabindex="-1" role="dialog" aria-labelledby="<#if modalLabel??>${modalLabel}</#if>" aria-hidden="true">
		<div class="modal-dialog" style="width:450px;margin-top:80px;">
    		<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title" id="<#if modalLabel??>${modalLabel}</#if>"><#if modalTitle??>${modalTitle}</#if></h4>
				</div>
				<div class="modal-body">
			        <form class="form-horizontal" role="form" id="<#if formId??>${formId}</#if>" action="<#if formAction??>${formAction}</#if>" method="<#if formMethod??>${formMethod}</#if>">
						<#list inputs as input>
							<#if input["type"]??>
								<#local type=input["type"] />
								<#local label=input["label"]!'' />
								<#local name=input["name"]!'' />
								<#local value=input["value"]!'' />
								<#if type=="hidden">
									<input type="hidden" name="${name}" value="<#if value??>${value}</#if>" />
								<#else>
									<div class="form-group">
								    	<label for="${name}" class="col-sm-3 control-label">${label}</label>
									    <div class="col-sm-9">
									    	<#if type=="checkbox">
									    		<#local options=input["options"] />
									    		<#local ownedValues=input["ownedValues"] />
									    		<div class="checkbox">
										    		<#if options?? && (options?size>0)>
										    		<#list options as option>
										      		<label>
										      			<input type="checkbox" name="${name}" value="${option.id}"
										      				<#if ownedValues??>
										      					<#list ownedValues as ownedValue>
										      						<#if ownedValue.id==option.id>checked="checked"</#if>
										      					</#list>
										      				</#if>
										      				> ${option.name}
										        	</label>
										        	</#list>
										        	</#if>
										      	</div>
										    <#elseif type="radio">
										    	<#local options=input["options"] />
										    	<#if options?? && (options?size>0)>
										    		<#list options as option>
										    		<#local val=option["val"]!''>
										    		<#local nam=option["nam"]!''>
										    		<#local conditionKey=option["conditionKey"]>
										    		<#local conditionValue=option["conditionValue"]>
										      		<label class="radio-inline">
										      			<input type="radio" name="${name}" value="${val}" <#if conditionKey?? && conditionKey==conditionValue>checked="checked"</#if>> ${nam}
										        	</label>
										        	</#list>
										        </#if>
									    	<#else>
									    		<#local id=input["id"] />
									    		<input type="${type}" class="form-control" id="${id}" name="${name}" value="<#if value??>${value}</#if>" />
									    	</#if>
									    </div>
									</div>
								</#if>
							</#if>
						</#list>
					</form>
				</div>
				<div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <button type="button" class="btn btn-primary" onclick="<#if saveAction??>${saveAction}</#if>">保存</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('#${modalId}').modal();
	</script>
</#macro>   