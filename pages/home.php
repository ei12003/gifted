<?php
	include_once('../config/init.php');
    //include_once('');
	
	 /* 
    $HIGHLIGHTED_MOVIES = getHighlightedMovies();
    $RECENT_MOVIES = getRecentMovies();
    $CATEGORIES = getCategories();

    for($index=0; $index < count($RECENT_MOVIES); $index++) {
        $RECENT_MOVIES[$index]['categories']=getMovieCategories($RECENT_MOVIES[$index]['movie_id']);
    }

    $smarty->assign('HIGHLIGHTED_MOVIES',$HIGHLIGHTED_MOVIES);
    $smarty->assign('RECENT_MOVIES', $RECENT_MOVIES);
    $smarty->assign('CURRENT_PAGE',$CURRENT_PAGE);
    $smarty->assign('CATEGORIES',$CATEGORIES); 
	*/
	
	$CURRENT_PAGE = 'home';
	
	$smarty->display('common/header.tpl');
	$smarty->display('common/home.tpl');
	$smarty->display('common/footer.tpl');
	
	
	/* 	
	$smarty->display('common/category_list.tpl');
	$smarty->display('movies/highlighted_films.tpl');
	$smarty->display('common/footer.tpl'); 
	*/
?>