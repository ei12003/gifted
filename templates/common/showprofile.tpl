<div class="container">
    <h1>Edit Profile</h1>
  	<hr>
	<div class="row">
      <!-- left column -->
      <div class="col-md-3">
        <div class="text-center">
          <img src="//placehold.it/100" class="avatar img-circle" alt="avatar">
          <h6>Upload a different photo...</h6>
        </div>
      </div>
      
     <div class="row">
      <div class="col-md-10 personal-info">
        <h3>Personal info</h3>
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
    </div>        
 
         <div class="row">
            <label class="col-md-3 control-label">Username:</label>
            <div class="col-md-8">
                     {$USERINFO.username}
            </div>
          </div>
      </div>
     
            
          
        Events
        {if $EVENTS|@count == 0}
        <hr>No events to be shown.</hr>
        {else}
         {foreach from=$EVENTS item=event}
          <hr>{$event.description}</hr>
         {/foreach}
         {/if}
  </div>
</div>
<hr>