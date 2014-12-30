<div class="container">

	{assign var="fa" value = "false"}
          	
   
  <h1>
    Exercise - {if $ANSWERED == $fa}Not done{else}Done{/if}
  </h1>
  <br>
  <h2>Class: {$CLASSID}</h2>
  
  <div id="setPanelGroup" class="panel-group">
    
    <div id="{$SET.id}" class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a  data-toggle="collapse" href="#content_{$SET.id}">
            {$SET.id}. {$SET.name}
            <i style="font-size:80%;">
              <br>
              <span id="setCount_{$SET.id}">
                {$SET.numEx}
              </span>
              Exercise(s)
            </i>
          </a>
        </h4>
      </div>
      <div id="content_{$SET.id}" class="panel-collapse collapse">
        <div class="panel-body">
          <div id="exercisePanelGroup{$SET.id}" class="panel-group">
          	
          	
          	<!-- IF NOT ANSWERED -->
          	{if $ANSWERED == $fa}

          		 <form class="form-horizontal" action="../../actions/answerSet.php" method="GET" role="form" id="answer_form" onsubmit = "">
          		 <input type="hidden" value="{$SET.id}" name="setid" />
          		 <input type="hidden" value="{$CLASSID}" name="classid" />


	            {foreach from=$SET.exercises item=ex}
	            <div id="ex{$ex.id}" class="panel panel-default">
	              <div class="panel-heading">
	                <h4 class="panel-title">
	                  <a data-toggle="collapse" href="#ex_content_{$ex.id}">
	                    {$ex.name}
	                  </a>
	                </h4>
	              </div>
	              <div id="ex_content_{$ex.id}" class="panel-collapse collapse">
	                <div class="panel-body">
	                  
	                  {$c = 0}
	                  <div class="form-group">
	                  	<input required  type="radio" name="exid_{$ex.id}" value="-1" style="display:none;" checked="true">
	                  {foreach from=$ex.ops item=opt}
	                   {if $c>0}<br>{/if}
	                  {$c = $c +1}
	                  <span style="color:black;">
	                  	<label style="margin-left:1em;">
              			<input required  type="radio" name="exid_{$ex.id}" value="{$opt.optid}">  {$opt.description} 
            			</label>
	                      {/foreach}
	                  </div>
	                    </div>
	                  </div>
	                </div>
	                {/foreach}
	               <br>
	         <input type="submit" class="btn btn-lg btn-default" value="Submit">
	        <!-- IF ANSWERED -->
          	{else}
	            {foreach from=$SET.exercises item=ex}
		            {foreach from=$STUDENT_ANSWERS item=answer}
		                    	{if $answer.exerciseId == $ex.id}
		                    		{assign var="useropt" value = $answer.optionId}
		                    		{if $answer.optionId == $ex.correct}
		                    		{assign var="check" value = 1}
		                    		{else}
		                    		{assign var="check" value = 0}
		                    		{/if}
		                    	{/if}
		               {/foreach}
	            <div id="ex{$ex.id}" class="panel panel-default">
	              <div class="panel-heading">
	                <h4 class="panel-title">
	                  <a data-toggle="collapse"{if $check==0} style="background-color:#CD5555;"{else}style="background-color:#AADD00;"{/if}href="#ex_content_{$ex.id}">
	                    {$ex.name}
	                  </a>
	                </h4>
	              </div>
	              <div id="ex_content_{$ex.id}" class="panel-collapse collapse">
	                <div class="panel-body">
	                  
	                  {$c = 0}
	                  {foreach from=$ex.ops item=opt}
	                  {$c = $c +1}
	                  <span style="color:black;">
	                    {$c}.  {$opt.description}

	                    <span>
						
						{if $opt.optid == $useropt} 
						<span class="glyphicon glyphicon-user"></span>
						{/if}
	                      {if $opt.optid == $ex.correct} 
	                      <span class="glyphicon glyphicon-ok">
	                      </span>
	                      {/if}
	                      <br>
	                      {/foreach}
	                    </div>
	                  </div>
	                </div>
	                {/foreach}
                {/if}



              </div>
              
            </div>
          </div>
          
        </div>
		
              </div>
              
              
              
              
          </div>

  
  
  <script src="{$BASE_URL}js/s_exercise.js">
  </script>
  