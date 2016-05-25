//= require application

$(document).ready(function(){
	
	$(".btn-minimize").click(function(){
		var i=$(this).parent().find('i:first');
		if(i.hasClass('icon-chevron-down')) {
			i.removeAttr('class').addClass('icon-chevron-up');
			$(this).parent().parent().parent().find('.box-content').slideDown();
		} else {
			i.removeAttr('class').addClass('icon-chevron-down');
			$(this).parent().parent().parent().find('.box-content').slideUp();
		}
		return false;
	});
	
	$(".btn-close").click(function(){
		$(this).parent().parent().parent().remove();
		return false;
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
    
 function setDateInput(obj) {
  if (obj != undefined) {
   var datediff = -(parseInt(obj));
   var newDate = new Date();
   var now = new Date();
   newDate.setDate(now.getDate()+datediff);
   var newYear = newDate.getFullYear();
   var newMonth = newDate.getMonth()+1;
   if (newMonth.toString().length == 1) newMonth = "0" + newMonth;
   
   endMonth=now.getMonth() +1;
   if (endMonth.toString().length == 1) endMonth = "0" + endMonth;
   
   var newDay = newDate.getDate();
   if (newDay.toString().length == 1) newDay = "0" + newDay;
   var txtSDate = newMonth + "/" + newDay +'/'+newYear;
   endDay=now.getDate();
   if (endDay.length == 1) endDay = "0" + endDay;
   var txtEDate = endMonth + "/" + endDay + '/' + now.getFullYear();
   $('input[name="start_date"]').val(txtSDate);
   $('input[name="end_date"]').val(txtEDate);
  } else {alert("잠시 후 이용해 주시기 바랍니다."); return false;}
 }
});