<?php /* Smarty version Smarty-3.1.15, created on 2014-12-08 18:58:08
         compiled from "D:\xampp\htdocs\\gifted\templates\common\home.tpl" */ ?>
<?php /*%%SmartyHeaderCode:173935485e6b07cf073-86452469%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '64baf148fd8d02673b4a54089d44f9c62ba4cd56' => 
    array (
      0 => 'D:\\xampp\\htdocs\\\\gifted\\templates\\common\\home.tpl',
      1 => 1418061178,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '173935485e6b07cf073-86452469',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5485e6b07d1b46_99790403',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5485e6b07d1b46_99790403')) {function content_5485e6b07d1b46_99790403($_smarty_tpl) {?>	<h1 style="font-size:80px; padding-top:60px;  text-align: center;" class="brand-heading">GiftEd</h1>

	<header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for Slides -->
        <div class="carousel-inner">
            <div class="item active">
                <!-- Set the first background image using inline CSS below. -->
                <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide One');"></div>
                <div class="carousel-caption">
                    <h2>Caption 1</h2>
                </div>
            </div>
            <div class="item">
                <!-- Set the second background image using inline CSS below. -->
                <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide Two');"></div>
                <div class="carousel-caption">
                    <h2>Caption 2</h2>
                </div>
            </div>
            <div class="item">
                <!-- Set the third background image using inline CSS below. -->
                <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide Three');"></div>
                <div class="carousel-caption">
                    <h2>Caption 3</h2>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>

    </header><?php }} ?>
