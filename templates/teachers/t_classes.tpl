 <div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">My Classes</div>
      
      <!-- Table -->
      <table class="table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Classes</th>
            <th>N. Of Students</th>
          </tr>
        </thead>
 
        <tbody>
          {foreach from=$CLASSES item=class}
          <tr>
            <td class="classid">{$class.id}</td>
            <td class="classid"><a href="{$BASE_URL}pages/class.php?classid={$class.id}">{$class.name}</a></td>
            <td class="classid">{$class.numStd}</td>
          </tr>
          {/foreach}
        </tbody>
      </table>
 
  </div>
