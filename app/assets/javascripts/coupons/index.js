//= require application

$(document).ready(function(){
	$('.datepicker').datepicker();
	
	$('.sl_toolbar .select_all').click(function(){
		$('.table tbody td input:checkbox').attr('checked','checked').parent().addClass('checked');
		return false;
	});
	
	$('.sl_toolbar .deselect_all').click(function(){
		$('.table tbody td input:checkbox').removeAttr('checked').parent().removeClass('checked');
		return false;
	});
	
	$('input[name="date_p"]').change(function(){
		if($(this).val()=='false') {
   			$('input[name="start_date"]').val('');
   			$('input[name="end_date"]').val('');
		} else {
			setDateInput($(this).val());
		}
	});
});