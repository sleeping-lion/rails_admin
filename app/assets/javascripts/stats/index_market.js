//= require stats/index

$(document).ready(function(){
	$('#market_ids').attr('id','read_only_market_ids').attr('readonly','readonly').focus(function(){
    $('#myModal').modal({'remote':'/markets/market_id_select?no_layout=true'});
	}).removeAttr('class').addClass('span8');
	
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
                    format: '{value}'+I18n.t('count_people'),
                    style: {
                        color: '#4572A7'
                    }
                },
                title: {
                    text: '회원가입수',
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
		$("#market_ids_layer").empty();
		$("#read_only_market_ids").val('');
		$("#market_id_list input:checkbox").removeAttr('checked');
		$("#p_deselect_button").attr('disabled','disabled');
		$(this).hide();
	}
});	