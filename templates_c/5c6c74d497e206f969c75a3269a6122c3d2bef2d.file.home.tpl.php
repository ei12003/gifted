<?php /* Smarty version Smarty-3.1.15, created on 2015-01-03 20:12:36
         compiled from "C:\Xampp\htdocs\gifted\templates\common\home.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2785654a83f24aa2705-87147270%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '5c6c74d497e206f969c75a3269a6122c3d2bef2d' => 
    array (
      0 => 'C:\\Xampp\\htdocs\\gifted\\templates\\common\\home.tpl',
      1 => 1420242276,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2785654a83f24aa2705-87147270',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_54a83f24ab1c90_78279572',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54a83f24ab1c90_78279572')) {function content_54a83f24ab1c90_78279572($_smarty_tpl) {?>	<h1 style="font-size:80px; padding-top:60px;  text-align: center;" class="brand-heading">GiftEd</h1>

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
