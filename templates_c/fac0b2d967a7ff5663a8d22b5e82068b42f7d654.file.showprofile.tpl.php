<?php /* Smarty version Smarty-3.1.15, created on 2015-01-04 17:48:36
         compiled from "C:\Xampp\htdocs\gifted\templates\common\showprofile.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2981454a83e9d99ab99-43349396%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'fac0b2d967a7ff5663a8d22b5e82068b42f7d654' => 
    array (
      0 => 'C:\\Xampp\\htdocs\\gifted\\templates\\common\\showprofile.tpl',
      1 => 1420388992,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2981454a83e9d99ab99-43349396',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_54a83e9da1bc21_37851413',
  'variables' => 
  array (
    'USERINFO' => 0,
    'EVENTS' => 0,
    'event' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54a83e9da1bc21_37851413')) {function content_54a83e9da1bc21_37851413($_smarty_tpl) {?><div class="container" style="background: #42647F;padding:50px;border-radius: 50px;">
	<h2>Personal info</h2>
   
	<hr>	
     <div class="row">
      <div class="col-md-10 personal-info">
       
        <div class="row">
            <label class="col-md-3 control-label">First name:</label>
            <div class="col-md-9">
                  <?php echo $_smarty_tpl->tpl_vars['USERINFO']->value['first_name'];?>

            </div>
         </div>
         <div class="row">
            <label class="col-md-3 control-label">Last name:</label>
            <div class="col-md-9">
                   <?php echo $_smarty_tpl->tpl_vars['USERINFO']->value['last_name'];?>

            </div>
          </div>
           <div class="row">
            <label class="col-md-3 control-label">Email:</label>
            <div class="col-md-9">
                    <?php echo $_smarty_tpl->tpl_vars['USERINFO']->value['email'];?>

            </div>
             </div>
       
 
         <div class="row">
            <label class="col-md-3 control-label">Username:</label>
            <div class="col-md-9">
                     <?php echo $_smarty_tpl->tpl_vars['USERINFO']->value['username'];?>

            </div>
          </div>
      </div>
    </div> 
     
            
        <hr>
        <h3><u><i>Events</i></u></h3>
        <?php if (count($_smarty_tpl->tpl_vars['EVENTS']->value)==0) {?>
		 No events to be shown.
        <?php } else { ?>
         <?php  $_smarty_tpl->tpl_vars['event'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['event']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['EVENTS']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['event']->key => $_smarty_tpl->tpl_vars['event']->value) {
$_smarty_tpl->tpl_vars['event']->_loop = true;
?>
         <?php echo $_smarty_tpl->tpl_vars['event']->value['description'];?>
<br>
         <?php } ?>
         <?php }?>
</div>
<hr><?php }} ?>
