<?php /* Smarty version Smarty-3.1.15, created on 2015-01-03 20:11:38
         compiled from "C:\Xampp\htdocs\gifted\templates\students\s_store.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2006854a83eea7f1516-99729898%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '32e64a9615880616fb71f337d2b00cfb098bcbba' => 
    array (
      0 => 'C:\\Xampp\\htdocs\\gifted\\templates\\students\\s_store.tpl',
      1 => 1420309425,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2006854a83eea7f1516-99729898',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'ITEMS' => 0,
    'item' => 0,
    'BASE_URL' => 0,
    'NUM_PAG' => 0,
    'i' => 0,
    'pagnum' => 0,
    'ITEM_PER_PAGE' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_54a83eeaa00068_76050480',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54a83eeaa00068_76050480')) {function content_54a83eeaa00068_76050480($_smarty_tpl) {?><div class="container">
	<style>
	a { cursor: pointer;}
	</style>
	<div class="row">
	<h1>Store</h1>

			<!-- <div class="row carousel-holder">

				<div class="col-md-12">
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img class="slide-image" src="http://placehold.it/800x300" alt="">
							</div>
							<div class="item">
								<img class="slide-image" src="http://placehold.it/800x300" alt="">
							</div>
							<div class="item">
								<img class="slide-image" src="http://placehold.it/800x300" alt="">
							</div>
						</div>
						<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
						<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div>
				</div>

			</div> -->

			<div class="row">
				
				<!-- <?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['ITEMS']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value) {
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
					<?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>

					<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
img/<?php echo $_smarty_tpl->tpl_vars['item']->value['img_location'];?>
 
					<?php echo $_smarty_tpl->tpl_vars['item']->value['description'];?>

				<?php } ?>
				
				
				
 -->
	
				<div class="text-center">
				  <ul class="pagination">
				  	<span style="display:none;" max="<?php echo $_smarty_tpl->tpl_vars['NUM_PAG']->value;?>
" current="1" class="pag_data"></span>
					<li style = "display: none;" class="pg_prev"><a href="#"><span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>
					<?php $_smarty_tpl->tpl_vars['i'] = new Smarty_Variable;$_smarty_tpl->tpl_vars['i']->step = 1;$_smarty_tpl->tpl_vars['i']->total = (int) ceil(($_smarty_tpl->tpl_vars['i']->step > 0 ? $_smarty_tpl->tpl_vars['NUM_PAG']->value+1 - (1) : 1-($_smarty_tpl->tpl_vars['NUM_PAG']->value)+1)/abs($_smarty_tpl->tpl_vars['i']->step));
if ($_smarty_tpl->tpl_vars['i']->total > 0) {
for ($_smarty_tpl->tpl_vars['i']->value = 1, $_smarty_tpl->tpl_vars['i']->iteration = 1;$_smarty_tpl->tpl_vars['i']->iteration <= $_smarty_tpl->tpl_vars['i']->total;$_smarty_tpl->tpl_vars['i']->value += $_smarty_tpl->tpl_vars['i']->step, $_smarty_tpl->tpl_vars['i']->iteration++) {
$_smarty_tpl->tpl_vars['i']->first = $_smarty_tpl->tpl_vars['i']->iteration == 1;$_smarty_tpl->tpl_vars['i']->last = $_smarty_tpl->tpl_vars['i']->iteration == $_smarty_tpl->tpl_vars['i']->total;?>
					    <li><a  style = "<?php if ($_smarty_tpl->tpl_vars['i']->value>3) {?>display: none;<?php } elseif ($_smarty_tpl->tpl_vars['i']->value==1) {?> font-weight: bold; font-size: 17px;<?php }?>"  id=<?php echo $_smarty_tpl->tpl_vars['i']->value;?>
 class="pag_btn"><?php echo $_smarty_tpl->tpl_vars['i']->value;?>
</a></li>
					<?php }} ?>
					<li class="pg_next"><a href="#"><span aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a></li>
				  </ul>
				</div>
				<?php $_smarty_tpl->tpl_vars['i'] = new Smarty_variable(1, null, 0);?>
				<?php $_smarty_tpl->tpl_vars['pagnum'] = new Smarty_variable(1, null, 0);?>
				<div id="items_list">
					<?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['ITEMS']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value) {
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
						
						<div <?php if ($_smarty_tpl->tpl_vars['pagnum']->value!=1) {?> style = "display: none;"<?php }?> id="<?php echo $_smarty_tpl->tpl_vars['pagnum']->value;?>
" class="col-sm-4 col-lg-4 col-md-4 pgn"  >
						
							<div class="thumbnail" >
								<img src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
img/<?php echo $_smarty_tpl->tpl_vars['item']->value['img_location'];?>
" alt="" style="width:100px;height:100px;">
								<div class="caption">
									<h4 class="span5 pull-right"><?php echo $_smarty_tpl->tpl_vars['item']->value['price'];?>
 §</h4>
									<h4><a class="buy-item" id="<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
</a>
									</h4>
									<p style="font-size:100%;"><?php echo $_smarty_tpl->tpl_vars['item']->value['description'];?>
</p>
								</div>
							</div>
							
						</div>

						<?php if ($_smarty_tpl->tpl_vars['i']->value==$_smarty_tpl->tpl_vars['ITEM_PER_PAGE']->value) {?>
							<?php echo $_smarty_tpl->tpl_vars['i']->value==1;?>

							<?php $_smarty_tpl->tpl_vars['pagnum'] = new Smarty_variable($_smarty_tpl->tpl_vars['pagnum']->value+1, null, 0);?>
							<?php $_smarty_tpl->tpl_vars['i'] = new Smarty_variable(1, null, 0);?>
						<?php } else { ?>
							<?php $_smarty_tpl->tpl_vars['i'] = new Smarty_variable($_smarty_tpl->tpl_vars['i']->value+1, null, 0);?>
						<?php }?>

					<?php } ?>
				</div>

				<!-- <div class="col-sm-4 col-lg-4 col-md-4">
					<div class="thumbnail">
						<img src="http://placehold.it/320x150" alt="">
						<div class="caption">
							<h4 class="pull-right">$64.99</h4>
							<h4><a href="#">Second</a>
							</h4>
							<p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</div>
					</div>
				</div>

				<div class="col-sm-4 col-lg-4 col-md-4">
					<div class="thumbnail">
						<img src="http://placehold.it/320x150" alt="">
						<div class="caption">
							<h4 class="pull-right">$74.99</h4>
							<h4><a href="#">Third</a>
							</h4>
							<p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</div>
					</div>
				</div>

				<div class="col-sm-4 col-lg-4 col-md-4">
					<div class="thumbnail">
						<img src="http://placehold.it/320x150" alt="">
						<div class="caption">
							<h4 class="pull-right">$84.99</h4>
							<h4><a href="#">Fourth</a>
							</h4>
							<p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</div>
					</div>
				</div>

				<div class="col-sm-4 col-lg-4 col-md-4">
					<div class="thumbnail">
						<img src="http://placehold.it/320x150" alt="">
						<div class="caption">
							<h4 class="pull-right">$94.99</h4>
							<h4><a href="#">Fifth</a>
							</h4>
							<p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</div>
					</div>
				</div> -->

			</div>
	</div>

</div>


<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
js/s_store.js"></script><?php }} ?>
