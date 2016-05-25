$(document).ready(function(){

	$("#ad_id_search_form").submit(function(){
		getList();
		return false;
	});
	
	$("#perpage").change(function(){
		$("#pagination").empty();		
		getList();
		$(this).blur();
		return true;
	 });
	 
	$("#p_deselect_button").click(function(){
		$("#ad_ids_layer").empty();
		$("#read_only_ad_ids").val('');
		$("#ad_id_list input:checkbox").removeAttr('checked');
		$("#m_clear_check_list").hide();
		$(this).attr('disabled','disabled');
	});	 
	 
	if(!$("#ad_ids_layer input").length) {
	 	$("#p_deselect_button").attr('disabled','disabled');
	 }
	 
	getList();	
	 
	function getList(current_page, jq) {
		if(!current_page)
				current_page = 0;
		
		var perPage =$("#perpage").val();
		var pageID=current_page+1;
		var action=$('#ad_id_search_form').attr('action');
		var find_method=$('#ad_id_search_form select[name="find_method"]').val();
		var search=$('#ad_id_search_form input[name="search"]').val();
		var ad_type_id=$('#f_ad_type_id').val();
		
		$.getJSON(action,{'format':'json','ad_type_id':ad_type_id,'find_method':find_method,'search':search,'per_page':perPage,'page':pageID},function(data) {
			$('#ad_id_list').empty();
			
			if(data.count) {
				$.each(data.list,function(index,value){
					var exist=false;
					$("#ad_ids_layer input").each(function(){
						if(value.id==$(this).val())
							exist=true;
					});
					
					if(exist) {
						var li=$('<li style="cursor:pointer"><input type="checkbox" id="ad_'+index+'" title="'+value.title+'" value="'+value.id+'" checked="checked" /><label for="ad_'+index+'" class="sl_popup_label">'+value.title+'</label></li>');
					} else {
						var li=$('<li style="cursor:pointer"><input type="checkbox" id="ad_'+index+'" title="'+value.title+'" value="'+value.id+'" /><label for="ad_'+index+'" class="sl_popup_label">'+value.title+'</label></li>');
					}
					
					li.appendTo('#ad_id_list');
					li.find('input').change(function(){
						if(this.checked) {
							if($("#ad_ids_layer input").length+1>6) {
								alert(I18n.t('maxium_select_6'));
								$(this).attr('checked',false);
								return false;
							}
							
							$("#ad_ids_layer").append('<input type="hidden" id="ad_'+$(this).val()+'" title="'+$(this).attr('title')+'" name="ad_id[]" value="'+$(this).val()+'" />');
						} else {
							$("#ad_ids_layer").find('#ad_'+$(this).val()).remove();
						}
						
						var tt=[];
						
						$("#ad_ids_layer input").each(function(){
							tt.push($(this).attr('title'));	
						});
						$("#read_only_ad_ids").val(tt.join(','));
						
						
						if($("#ad_ids_layer input").length) {
							$("#p_deselect_button").removeAttr('disabled');
							$("#m_clear_check_list").show();						
						} else {
							$("#p_deselect_button").attr('disabled','disabled');
							$("#m_clear_check_list").hide();
						}
					});
				});
			
				$("#pagination").removeData("load");
				
   		if(Number(data.count)>Number($("#perpage").val()))
   			initPagination(data.count,$("#perpage").val(),current_page);				
			} else {
					var li=$('<li><span>'+I18n.t('no_data')+'</span></li>');
					li.appendTo('#ad_id_list');
					
				$("#pagination").removeData("load");
				
   			initPagination(data.count,$("#perpage").val(),current_page);							
			} 
				

		
			});
		}
	
	
	function pageselectCallback(page_index, jq) {
		if ($(jq).data("load") == true)
			getList(page_index, jq);
		else
			$(jq).data("load", true);
			
		return false;
	}
	
	function initPagination(num_entries, items_per_page, current_page) {
		if(!current_page)
			var current_page=0;
			$("#pagination").pagination(num_entries, {
                        current_page : current_page,
                        num_edge_entries : 2,
                        num_display_entries : 8,
                        callback : pageselectCallback,
                        items_per_page : items_per_page
                });
		return false;
	}	
});