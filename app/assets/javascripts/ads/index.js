//= require application
//= require jquery-ui
//= require jquery-ui/datepicker

$(document).ready(function(){ 
	
	$('#type_search_form input[type="submit"]').click(function(){
		if($.trim($('#type_search_form input[name="search_value"]').val())=='') {
			alert('검색조건을 입력하세요');
			$('#type_search_form input[name="search_value"]').focus();
			return false;
		}			
	});
	 
	$('#type_search_form select:first').change(function(){
		$('#type_search_form').submit();
	});
});
