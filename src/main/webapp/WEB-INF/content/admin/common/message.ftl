<!--操作结果提示框开始-->
<#if success??>
<div class="modal fade" id="tipsModal" tabindex="-1" role="dialog" aria-labelledby="tipsModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:450px;margin-top:80px;">
   		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="tipsModalLabel">提示</h4>
			</div>
			<div class="modal-body">
		        <#if message??>${message}</#if>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$('#tipsModal').modal();
</script>
</#if>
<!--操作结果提示框结束-->