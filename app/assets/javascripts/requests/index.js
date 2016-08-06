//= require application
//= require jquery-ui
//= require jquery-ui/datepicker

$(document).ready(function(){	
	$('.datepicker').datepicker();
	
	$("#request_update_form").submit(function(){
		if(!$(this).find('input:checked').length) {
			alert('업데이트할 항목을 선택해주세요');
			return false;
		}
	});
	
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