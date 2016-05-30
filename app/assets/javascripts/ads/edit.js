$(document).ready(function(){
	$('.datepicker').datepicker();	
	
	$('.delete_form').submit(function(){
		if(!confirm('파일을 삭제하시겠습니까?')) {
			return false;
		}
	});
	
	$("a.group").fancybox({
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'speedIn'		:	600, 
		'speedOut'		:	200, 
		'overlayShow'	:	false
	});	
});