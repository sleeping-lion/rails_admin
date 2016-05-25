//= require application

$(document).ready(function(){
	$(".btn-minimize").toggle(function(){
			$(this).parent().find('i:first').removeAttr('class').addClass('icon-chevron-down');
			$(this).parent().parent().parent().find('.box-content').slideUp();
			return false;
	},function(){
			$(this).parent().find('i:first').removeAttr('class').addClass('icon-chevron-up');
			$(this).parent().parent().parent().find('.box-content').slideDown();
			return false;
	});
	
	$('#ad_target_address_address_id').attr('id','read_only_address_id').attr('readonly','readonly').focus(function(){
    $('#ad_target_address_address_id').click();
	});		
	
	$(".btn-close").click(function(){
		$(this).parent().parent().parent().remove();
		return false;
	});	
});