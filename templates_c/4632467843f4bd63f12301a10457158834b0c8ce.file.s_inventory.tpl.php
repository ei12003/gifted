<?php /* Smarty version Smarty-3.1.15, created on 2015-01-04 17:50:12
         compiled from "C:\Xampp\htdocs\gifted\templates\students\s_inventory.tpl" */ ?>
<?php /*%%SmartyHeaderCode:399854a83e03a4acc4-41859394%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4632467843f4bd63f12301a10457158834b0c8ce' => 
    array (
      0 => 'C:\\Xampp\\htdocs\\gifted\\templates\\students\\s_inventory.tpl',
      1 => 1420390209,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '399854a83e03a4acc4-41859394',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_54a83e03b357c3_07414742',
  'variables' => 
  array (
    'BASE_URL' => 0,
    'itemobj' => 0,
    'AVATARCHOICES' => 0,
    'INVENTORY' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54a83e03b357c3_07414742')) {function content_54a83e03b357c3_07414742($_smarty_tpl) {?><div class="container">
    <h1>My Inventory</h1>
		
		<div>
	<br>
	<br>
<form action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/avatar.php" method=POST>
	<br><br>
					<div class="skincolor">
						 <h3>Skin Color</h3>
						<table class="table table-condensed table-bordered" style="background:white;" id="inventory">
							<tdead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>Description</th>
									<!--th>Part</th-->
									<th>Preview</th>
									<th>choose</th>
								</tr>
							</tdead>
							<tbody>
								<tr>
									<td>0</td>
									<td>Default</td>
									<td>Default</td>
									<!--td><?php echo $_smarty_tpl->tpl_vars['itemobj']->value['part'];?>
</td-->
									<td> </td>
									<td><input type="radio" name="skincolor" value=0 <?php if ($_smarty_tpl->tpl_vars['AVATARCHOICES']->value['part0']==null) {?>checked="true"<?php }?>></td>
								</tr>
								<?php  $_smarty_tpl->tpl_vars['itemobj'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['itemobj']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['INVENTORY']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['itemobj']->key => $_smarty_tpl->tpl_vars['itemobj']->value) {
$_smarty_tpl->tpl_vars['itemobj']->_loop = true;
?>
								<?php if ($_smarty_tpl->tpl_vars['itemobj']->value['part']==0) {?>
								<tr>
									<td><?php echo $_smarty_tpl->tpl_vars['itemobj']->value['id'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['itemobj']->value['name'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['itemobj']->value['description'];?>
</td>
									<!--td><?php echo $_smarty_tpl->tpl_vars['itemobj']->value['part'];?>
</td-->
									<td> <a class="popoverOption" class="btn" href="#" data-content='<img src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
img/<?php echo $_smarty_tpl->tpl_vars['itemobj']->value['img_location'];?>
" class="avatar img-circle" alt="itemImage">' rel="popover" data-original-title=<?php echo $_smarty_tpl->tpl_vars['itemobj']->value['name'];?>
><img src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
img/<?php echo $_smarty_tpl->tpl_vars['itemobj']->value['img_location'];?>
" class="avatar img-circle" alt="itemImage" height="42" widtd="42"></td></a>
									<td><input type="radio" name="skincolor" value=<?php echo $_smarty_tpl->tpl_vars['itemobj']->value['id'];?>
 <?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['itemobj']->value['id'];?>
<?php $_tmp1=ob_get_clean();?><?php if ($_smarty_tpl->tpl_vars['AVATARCHOICES']->value['part0']==$_tmp1) {?>checked="true"<?php }?>></td>
								</tr>
								<?php }?>
								<?php } ?>					
						</tbody>
						</table>
					</div>
					<br>
					<div class="shirt">
						<table class="table table-striped table-condensed table-bordered" style="background:white;"  id="inventory">
							 <h3>Shirts</h3>
							<tdead>
								<tr>
									<th>#</td>
									<th>Name</td>
									<th>Description</th>
									<!--th>Part</th-->
									<th>Preview</th>
									<th>choose</th>
								</tr>
							</tdead>
							<tbody>
								<tr>
									<td>0</td>
									<td>Default</td>
									<td>Default</td>
									<!--td><?php echo $_smarty_tpl->tpl_vars['itemobj']->value['part'];?>
</td-->
									<td> </td>
									<td><input type="radio" name="shirt" value=0 <?php if ($_smarty_tpl->tpl_vars['AVATARCHOICES']->value['part1']==null) {?>checked="true"><?php }?></td>
								</tr>
								<?php  $_smarty_tpl->tpl_vars['itemobj'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['itemobj']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['INVENTORY']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['itemobj']->key => $_smarty_tpl->tpl_vars['itemobj']->value) {
$_smarty_tpl->tpl_vars['itemobj']->_loop = true;
?>
								<?php if ($_smarty_tpl->tpl_vars['itemobj']->value['part']==1) {?>
								<tr>
									<td><?php echo $_smarty_tpl->tpl_vars['itemobj']->value['id'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['itemobj']->value['name'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['itemobj']->value['description'];?>
</td>
									<!--td><?php echo $_smarty_tpl->tpl_vars['itemobj']->value['part'];?>
</td-->
									<td> <a class="popoverOption" class="btn" href="#" data-content='<img src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
img/<?php echo $_smarty_tpl->tpl_vars['itemobj']->value['img_location'];?>
" class="avatar img-circle" alt="itemImage">' rel="popover" data-original-title=<?php echo $_smarty_tpl->tpl_vars['itemobj']->value['name'];?>
><img src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
img/<?php echo $_smarty_tpl->tpl_vars['itemobj']->value['img_location'];?>
" class="avatar img-circle" alt="itemImage" height="42" widtd="42"></td></a>
									<td><input type="radio" name="shirt" value=<?php echo $_smarty_tpl->tpl_vars['itemobj']->value['id'];?>
 <?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['itemobj']->value['id'];?>
<?php $_tmp2=ob_get_clean();?><?php if ($_smarty_tpl->tpl_vars['AVATARCHOICES']->value['part1']==$_tmp2) {?>checked="true"<?php }?>> </td>
								</tr>
								<?php }?>
								<?php } ?>					
						</tbody>
						</table>
					</div>
					<br>
					<div class="eyes">
						<table class="table table-striped table-condensed table-bordered table-responsive" style="background:white;"  id="inventory">
							 <h3>Eye Color</h3>
							<tdead>
								<tr>
									<th>#</th>
									<td>Name</th>
									<td>Description</th>
									<!--th>Part</th-->
									<th>Preview</th>
									<th>choose</th>
								</tr>
							</tdead>
							<tbody>
								<tr>
									<td>0</td>
									<td>Default</td>
									<td>Default</td>
									<!--td><?php echo $_smarty_tpl->tpl_vars['itemobj']->value['part'];?>
</td-->
									<td> </td>
									<td><input type="radio" name="eyecolor" value=0 <?php if ($_smarty_tpl->tpl_vars['AVATARCHOICES']->value['part2']==null) {?>checked="true"<?php }?>></td>
								</tr>
								<?php  $_smarty_tpl->tpl_vars['itemobj'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['itemobj']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['INVENTORY']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['itemobj']->key => $_smarty_tpl->tpl_vars['itemobj']->value) {
$_smarty_tpl->tpl_vars['itemobj']->_loop = true;
?>
								<?php if ($_smarty_tpl->tpl_vars['itemobj']->value['part']==2) {?>
								<tr>
									<td><?php echo $_smarty_tpl->tpl_vars['itemobj']->value['id'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['itemobj']->value['name'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['itemobj']->value['description'];?>
</td>
									<!--td><?php echo $_smarty_tpl->tpl_vars['itemobj']->value['part'];?>
</td-->
									<td> <a class="popoverOption" class="btn" href="#" data-content='<img src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
img/<?php echo $_smarty_tpl->tpl_vars['itemobj']->value['img_location'];?>
" class="avatar img-circle" alt="itemImage">' rel="popover" data-original-title=<?php echo $_smarty_tpl->tpl_vars['itemobj']->value['name'];?>
><img src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
img/<?php echo $_smarty_tpl->tpl_vars['itemobj']->value['img_location'];?>
" class="avatar img-circle" alt="itemImage" height="42" widtd="42"></td></a>
									<td><input type="radio" name="eyecolor" value=<?php echo $_smarty_tpl->tpl_vars['itemobj']->value['id'];?>
 <?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['itemobj']->value['id'];?>
<?php $_tmp3=ob_get_clean();?><?php if ($_smarty_tpl->tpl_vars['AVATARCHOICES']->value['part2']==$_tmp3) {?>checked="true"<?php }?>></td>
								</tr>
								<?php }?>
								<?php } ?>					
						</tbody>
						</table>
					</div>	

						
					<input type="submit" style="border-color:#333;background:#333" class="btn btn-danger" value="Change">

						</form>
					</div>
				</div>

					<script>
					</script><?php }} ?>
