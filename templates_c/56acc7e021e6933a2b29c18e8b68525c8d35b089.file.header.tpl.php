<?php /* Smarty version Smarty-3.1.15, created on 2014-12-09 18:30:09
         compiled from "D:\xampp\htdocs\\gifted\templates\common\header.tpl" */ ?>
<?php /*%%SmartyHeaderCode:300755485e6b06718f2-15278269%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '56acc7e021e6933a2b29c18e8b68525c8d35b089' => 
    array (
      0 => 'D:\\xampp\\htdocs\\\\gifted\\templates\\common\\header.tpl',
      1 => 1418146206,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '300755485e6b06718f2-15278269',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5485e6b0789e68_86189732',
  'variables' => 
  array (
    'BASE_URL' => 0,
    'USERNAME' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5485e6b0789e68_86189732')) {function content_5485e6b0789e68_86189732($_smarty_tpl) {?><!DOCTYPE html>
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
css/styles.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
font-awesome-4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

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
