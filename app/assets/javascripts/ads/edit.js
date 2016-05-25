$(document).ready(function(){ 
	$('.cleditor').cleditor();
	$('.datepicker').datepicker();	
	
	$('.delete_form').submit(function(){
		if(!confirm('파일을 삭제하시겠습니까?')) {
			return false;
		}
	});
	
	$('.btn-minimize').toggle(function(){
		$(this).parent().parent().parent().find('.box-content').slideUp();
		$(this).find('i').removeAttr('class').addClass('icon-chevron-down');
		return false;
	},function(){
		$(this).parent().parent().parent().find('.box-content').slideDown();
		$(this).find('i').removeAttr('class').addClass('icon-chevron-up');		
		return false;
	});
	
	$("a.group").fancybox({
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'speedIn'		:	600, 
		'speedOut'		:	200, 
		'overlayShow'	:	false
	});	
});