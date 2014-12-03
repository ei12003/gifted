 <div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading" >My Classes</div>
      
     <div id="OrderPackages">
    <table id="tableSearchResults" class="table table-hover  table-striped table-condensed">
        <thead>
            <tr>
                <th>Class ID</th>
                <th>Class Name</th>
				<th>N. of Students</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
			{foreach from=$CLASSES item=class}
				<tr class="accordion-toggle" data-toggle="collapse" data-parent="#OrderPackages" data-target=".{$class.id}">
					<td>{$class.id}</td>
					<td>{$class.name}</td>
					<td><i class="indicator glyphicon glyphicon-chevron-up pull-right"></i>

					</td>
				</tr>
				<tr>
					<td colspan="{$class.name}" class="hiddenRow">
						<div class="accordion-body collapse {$class.id}" id="accordion1">
							<table>
								<tr>
									<td>Ze Manel</td>
								</tr>
								<tr>
									<td>Rui</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			{/foreach}
        </tbody>
    </table>
</div>
 
  </div>
  
