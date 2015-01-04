<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>GiftEd</title>

    <!-- Bootstrap Core CSS -->
    <link href="{$BASE_URL}css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="{$BASE_URL}css/grayscale.css" rel="stylesheet">
	<link href="{$BASE_URL}css/select2.css" rel="stylesheet">
	<link href="{$BASE_URL}css/select2-bootstrap.css"  rel="stylesheet">
	<link href="{$BASE_URL}css/styles.css" rel="stylesheet">
	

    <!-- Custom Fonts -->
    <link href="{$BASE_URL}font-awesome-4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	
	
	<!-- jQuery -->
	<script src="{$BASE_URL}js/jquery.js"></script>
	<script src="{$BASE_URL}js/jquery.easing.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="{$BASE_URL}js/bootstrap.min.js"></script>
	
	<!-- Custom Theme JavaScript -->
	<script src="{$BASE_URL}js/grayscale.js"></script>
	
	<!-- Bootbox Plugin JavaScript -->
	<script src="{$BASE_URL}js/bootbox.min.js"></script>

	<!-- JQEURY JavaScript -->
	<script src="{$BASE_URL}js/select2.js"></script>
    
    {if isset($INVENTORY)}
    <!-- Inventory -->
    <script src="{$BASE_URL}js/s_inventory.js"></script>
    {/if}
	
	<style>
	
	body {
		background: url({$BASE_URL}img/bg.jpg) fixed 50% / cover;
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
                <a class="navbar-brand page-scroll" href="{$BASE_URL}">
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

					{if $USERNAME}
						{include file='common/navbar_logged_in.tpl'}
					{else}
						{include file='common/navbar_logged_out.tpl'}
					{/if}
					
                </ul>
            </div>
        </div>
    </nav>