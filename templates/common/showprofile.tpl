<div class="container" style="background: #42647F;padding:50px;border-radius: 50px;">
	<h2>Personal info</h2>
   
	<hr>	
     <div class="row">
      <div class="col-md-10 personal-info">
       
        <div class="row">
            <label class="col-md-3 control-label">First name:</label>
            <div class="col-md-9">
                  {$USERINFO.first_name}
            </div>
         </div>
         <div class="row">
            <label class="col-md-3 control-label">Last name:</label>
            <div class="col-md-9">
                   {$USERINFO.last_name}
            </div>
          </div>
           <div class="row">
            <label class="col-md-3 control-label">Email:</label>
            <div class="col-md-9">
                    {$USERINFO.email}
            </div>
             </div>
       
 
         <div class="row">
            <label class="col-md-3 control-label">Username:</label>
            <div class="col-md-9">
                     {$USERINFO.username}
            </div>
          </div>
      </div>
    </div> 
     
            
        <hr>
        <h3><u><i>Events</i></u></h3>
        {if $EVENTS|@count == 0}
		 No events to be shown.
        {else}
         {foreach from=$EVENTS item=event}
         {$event.description}<br>
         {/foreach}
         {/if}
</div>
<hr>