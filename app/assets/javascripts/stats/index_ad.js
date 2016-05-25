//= require stats/index

$(document).ready(function(){
	$('#ad_id').attr('id','read_only_ad_ids').attr('readonly','readonly').removeAttr('name').focus(function(){
    $('#myModal').modal({'remote':'/ads/ad_id_select?no_layout=true'});
	}).removeAttr('class').addClass('span8');
	
	if($("#ad_ids_layer input").length) {
		var tt=[];
		$("#ad_ids_layer input").each(function(){
			tt.push($(this).attr('title'));	
		});
		$("#read_only_ad_ids").val(tt.join(','));
	}
	
	$("#m_clear_check_list").click(clear_check_list);	
	
	if(show_chart) {
		$('#chart1').highcharts({
            chart: {
                zoomType: 'xy'
            },
            title: {
                text: title_text
            },
            xAxis: [{
                categories: period
            }],
            yAxis: [{ // Primary yAxis
                labels: {
                    format: '{value}'+I18n.t('count_thing'),
                    style: {
                        color: '#4572A7'
                    }
                },
                title: {
                    text: '노출건수',
                    style: {
                        color: '#4572A7'
                    }
                }
            }],
            tooltip: {
                shared: true
            },
            legend: {
                layout: 'vertical',
                align: 'left',
                x: 120,
                verticalAlign: 'top',
                y: 100,
                floating: true,
                backgroundColor: '#FFFFFF'
            },
            series: series
        });
	}
	
	function clear_check_list() {
		$("#ad_ids_layer").empty();
		$("#read_only_ad_ids").val('');
		$("#ad_id_list input:checkbox").removeAttr('checked');
		$("#p_deselect_button").attr('disabled','disabled');		
		$(this).hide();
	}
});