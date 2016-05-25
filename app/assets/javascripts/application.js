// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.



//= require jquery
//= require jquery_ujs
//=require bootstrap.min

//I18n.defaultLocale = "zh-CN";

$(document).ready(function(){
	$('.modal_link').click(function(event){
		event.preventDefault();
		$('#myModal').removeData("modal");
 		
	
		if($(this).attr('title')) {
			$('#myModal .modal-header h3').text($(this).attr('title'));
		} else {
			$('#myModal .modal-header h3').text('사용자정보');
		}
	
		$('#myModal').modal({'remote':$(this).attr('href')+'?no_layout=true'});
	});

			
	/* ---------- Acivate Functions ---------- 
	$("#overlay").delay(250).fadeOut(500); */
	/* ---------- Submenu  ---------- */
	
	$('.dropmenu').click(function(e){
		if(!$(this).parent().find('ul:first').hasClass('d_show')) {
			$(this).parent().parent().find('.d_show').removeClass('d_show').slideToggle();
			$(this).parent().find('ul').addClass('d_show').slideToggle(function(){
				$("#content").css("min-height",$('aside').height()+40);
			});

		}		
	});
	
	/* ---------- Uniform ---------- */
	//$("input:checkbox, input:radio, input:file").not('[data-no-uniform="true"],#uniform-is-ajax').uniform();
});	
