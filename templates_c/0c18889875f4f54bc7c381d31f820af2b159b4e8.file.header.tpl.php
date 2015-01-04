<?php /* Smarty version Smarty-3.1.15, created on 2015-01-04 17:43:57
         compiled from "C:\Xampp\htdocs\gifted\templates\common\header.tpl" */ ?>
<?php /*%%SmartyHeaderCode:387554a83e03655302-81387095%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '0c18889875f4f54bc7c381d31f820af2b159b4e8' => 
    array (
      0 => 'C:\\Xampp\\htdocs\\gifted\\templates\\common\\header.tpl',
      1 => 1420388992,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '387554a83e03655302-81387095',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_54a83e03771f03_78644120',
  'variables' => 
  array (
    'BASE_URL' => 0,
    'INVENTORY' => 0,
    'USERNAME' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54a83e03771f03_78644120')) {function content_54a83e03771f03_78644120($_smarty_tpl) {?><!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>GiftEd</title>

    <!-- Bootstrap Core CSS -->
    <link href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
css/grayscale.css" rel="stylesheet">
	<link href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
css/select2.css" rel="stylesheet">
	<link href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
css/select2-bootstrap.css"  rel="stylesheet">
	<link href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
css/styles.css" rel="stylesheet">
	

    <!-- Custom Fonts -->
    <link href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
font-awesome-4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	
	
	<!-- jQuery -->
	<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
js/jquery.js"></script>
	<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
js/jquery.easing.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
js/bootstrap.min.js"></script>
	
	<!-- Custom Theme JavaScript -->
	<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
js/grayscale.js"></script>
	
	<!-- Bootbox Plugin JavaScript -->
	<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
js/bootbox.min.js"></script>

	<!-- JQEURY JavaScript -->
	<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
js/select2.js"></script>
    
    <?php if (isset($_smarty_tpl->tpl_vars['INVENTORY']->value)) {?>
    <!-- Inventory -->
    <script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
js/s_inventory.js"></script>
    <?php }?>
	
	<style>
	
	body {
		background: url(<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
img/bg.jpg) fixed 50% / cover;
	}
	
	</style>
	
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

	<div id="scroll_bar_fix">

    <!-- Navigation -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
">
                    <span class="glyphicon glyphicon-home" aria-hidden="true"></span> <span class="light">GiftEd</span>
                </a>
            </div>

            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden"><a href="#page-top"></a></li>
                    <!-- 
					<li> <a class="page-scroll" href="#about">About</a></li>
                    <li> <a class="page-scroll" href="#contact">Contact</a></li> 
					-->
					
					<li class="divider-vertical"></li>

					<?php if ($_smarty_tpl->tpl_vars['USERNAME']->value) {?>
						<?php echo $_smarty_tpl->getSubTemplate ('common/navbar_logged_in.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

					<?php } else { ?>
						<?php echo $_smarty_tpl->getSubTemplate ('common/navbar_logged_out.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

					<?php }?>
					
                </ul>
            </div>
        </div>
    </nav><?php }} ?>
