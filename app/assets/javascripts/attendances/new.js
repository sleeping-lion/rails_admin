//= require application

$(document).ready(function(){
	$('#attendance_user_id').attr('id','read_only_user_id').attr('readonly','readonly').focus(function(){
    $('#myModal').modal({'remote':'/users/user_id_select?no_layout=true'});
	});
});