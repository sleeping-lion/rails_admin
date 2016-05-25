//= require application

$(document).ready(function(){
	$('#point_user_id').attr('id','read_only_user_id').attr('readonly','readonly').focus(function(){
    $('#user_id_select').click();
	});
});