//= require application

$(document).ready(function() {
	$(".btn-minimize").toggle(function(){
			$(this).parent().find('i:first').removeAttr('class').addClass('icon-chevron-down');
			$(this).parent().parent().parent().find('.box-content').slideUp();
			return false;			
	},function(){
			$(this).parent().find('i:first').removeAttr('class').addClass('icon-chevron-up');
			$(this).parent().parent().parent().find('.box-content').slideDown();
			return false;					
	});	
});