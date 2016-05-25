
$(document).ready(function(){

	$("#address_id_search_form").submit(function(){
		getList();
		return false;
	});
	
	$("#perpage").change(function(){
		$("#pagination").empty();
		getList();
		$(this).blur();
		return true;
	 });
	 
	function getList(current_page, jq) {
		if(!current_page)
				current_page = 0;
				
			var perPage =$("#perpage").val()				
			var pageID=current_page+1;
				
				
			var action=$('#address_id_search_form').attr('action');
			var find_method=$('#address_id_search_form select[name="find_method"]').val();
			var search=$('#address_id_search_form input[name="search"]').val();
			
			$.getJSON(action,{'format':'json','find_method':find_method,'search':search,'per_page':perPage,'page':pageID},function(data) {
				$('#address_id_list').empty();
			

			if(data.count) {
				$.each(data.list,function(index,value){
					var li=$('<li style="cursor:pointer"><input type="hidden" value="'+value.id+'" /><span>'+value.full_address+'</span></li>').click(function(){
						$('#read_only_address_id').val($(this).find('input').val());
						$('#myModal').modal('hide');
					});
					li.appendTo('#address_id_list');
				});
			
				$("#pagination").removeData("load");
				
   		if(Number(data.count)>Number($("#perpage").val()))
   			initPagination(data.count,$("#perpage").val(),current_page);				
			} else {
					var li=$('<li><span>해당 아이디가 없습니다.</span></li>');
					li.appendTo('#address_id_list');
					
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