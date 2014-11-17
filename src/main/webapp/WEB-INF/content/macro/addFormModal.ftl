<#macro addFormModal modalParams={} formParams={} saveAction="">
	<#local modalId=modalParams['modalId']!"addModal" />
	<#local modalLabel=modalId + "Label" />
	<#local modalTitle=modalParams['modalTitle']!"添加" />
	
	<#local formId=formParams['formId']!"addForm" />
	<#local formAction=formParams['formAction']!"" />
	<#local formMethod=formParams['formMethod']!"post" />
	<#if formParams['inputs']??>
		<#local inputs=formParams['inputs'] />
	</#if>
	
	<!--添加用户弹出框开始-->
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
								<div class="form-group">
							    	<label for="${name}" class="col-sm-3 control-label">${label}</label>
								    <div class="col-sm-9">
								    	<#if input["content"]??>
								    		<#local content=input["content"] />
								    		${content}
								    	<#else>
								    		<#local id=input["id"] />
								    		<input type="${type}" class="form-control" id="${id}" name="${name}" value="" />
								    	</#if>
								    </div>
								</div>
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
	<!--添加用户弹出框结束-->
</#macro>   