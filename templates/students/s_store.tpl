<div class="container">
	
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
				
				<!-- {foreach from=$ITEMS item=item}
					{$item.name}
					{$item.img_location} 
					{$item.description}
				{/foreach}
				
				
				
 -->
	
				<div class="text-center">
				  <ul class="pagination">
					<li><a href="#"><span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#"><span aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a></li>
				  </ul>
				</div>
 
				{$count=1}
				{$pagenum=1}
				{foreach from=$ITEMS item=item}
					
					<div class="col-sm-4 col-lg-4 col-md-4" >
						<a href="https://www.google.pt">
						<div class="thumbnail" >
							<img src="{$item.img_location}" alt="">
							<div class="caption">
								<h4 class="span5 pull-right">{$item.price} §</h4>
								<h4><a href="https://www.google.pt">{$item.name}</a>
								</h4>
								<p>{$item.description}</p>
							</div>
						</div>
						</a>
					</div>

				{/foreach}

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


<script src="{$BASE_URL}js/s_store.js"></script>