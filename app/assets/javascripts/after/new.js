//= require application

$(document).ready(function(){
	$( 'p' ).click(function() {
		 // item 의 최대번호 구하기
		 var lastItemNo = $("#example tr:last").attr("class").replace("item", "");
       var newitem = $("#example tr:eq(1)").clone();
        newitem.removeClass();
        newitem.find("td:eq(0)").attr("rowspan", "1");
        newitem.addClass("item"+(parseInt(lastItemNo)+1));

        $("#example").append(newitem);
		});
});

var addAnswer_onClick = function() {
	b = $(this).parent().parent().find(".answer_block");

	if( $(b).size() < 3 ) {
		b = $(b).get(0);
		
		d = document.createElement("div");
		//$(d).addClass("answer_block").html($(b).html()).after(b);
		$(d).addClass("answer_block").html($(b).html()).insertAfter($(this).parent().parent().find(".answer_block:last"));
		//$(d).addClass("answer_block").html( $(b).html() ).before(b);
	}  else {
		alert("응답은 3개까지 추가 가능합니다.");
	}
	
};

$(".btnAddAnswer").click( addAnswer_onClick );

$(".btnAddQuestion").click( function() {
	b = $(".Reitem");
	
	if( $(".item1").size() < 3 ) {
		b = $(b).get(0);
		c = $(b).clone();
		
		$(c).find("input[type=text]").each( function() {
			$(this).val("");
			
		});
		
		$(c).removeClass('Reitem').addClass("item1").show().insertAfter($(".item1:last"));
		$(c).find(".btnAddAnswer").click( addAnswer_onClick );
	} else {
		alert("질문은 3개까지 추가 가능합니다.");
	}
	
});
