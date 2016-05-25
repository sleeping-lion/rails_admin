//= require stats/index

$(document).ready(function(){
	
	if(show_chart) {	
	$('#chart1').highcharts({
            chart: {
                zoomType: 'xy'
            },
            title: {
                text: '회원통계'
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
            }, { // Secondary yAxis
                title: {
                    text: '합산회원가입수',
                    style: {
                        color: '#89A54E'
                    }
                },
                labels: {
                    format: '{value}<%=I18n.t(:count_people) %>',
                    style: {
                        color: '#89A54E'
                    }
                },
                opposite: true
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
            series: [{
                name: '인증회원',
                color: '#4572A7',
                type: 'column',
                data: data1,
                tooltip: {
                    valueSuffix: '<%=I18n.t(:count_people) %>'
                }
    
            },{
                name: '미인증회원',
                color: '#99ccff',
                type: 'column',
                data: data2,
                tooltip: {
                    valueSuffix: '<%=I18n.t(:count_people) %>'
                }
    
            }, {
                name: '합산회원가입수',
                color: '#89A54E',
                type: 'spline',
                yAxis: 1,                
                data: data3,
                tooltip: {
                    valueSuffix: '<%=I18n.t(:count_people) %>'
                }
            }]
        });
	
	}
});	