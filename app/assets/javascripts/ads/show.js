//= require application
//= require jquery-ui
//= require jquery-ui/datepicker

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
	
	var start_time=$('<input type="text" name="ad_schedule[start_time]" class="datetimepicker input-medium" required="required" />');
	var end_time=$('<input type="text" name="ad_schedule[end_time]" class="datetimepicker input-medium" required="required" />');
	var expire_time=$('<input type="text" name="ad_schedule[expire_time]" class="datetimepicker input-medium" required="required" />');
	$("#new_ad_schedule .control-group:eq(1) .controls").empty().append(start_time);
	$("#new_ad_schedule .control-group:eq(2) .controls").empty().append(end_time);
	$("#new_ad_schedule .control-group:eq(3) .controls").empty().append(expire_time);
	
	start_time.datetimepicker();
	end_time.datetimepicker();
	expire_time.datetimepicker();
});