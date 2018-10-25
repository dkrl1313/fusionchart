<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>

    <link href="/webjars/jquery-ui/1.10.3/themes/base/jquery-ui.css" rel="stylesheet">
    <link href="/webjars/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <link href="/webjars/bootstrap/3.3.5/css/bootstrap-theme.min.css" rel="stylesheet">
    <script type="text/javascript" src="/webjars/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript" src="/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/webjars/jquery-ui/1.10.3/ui/jquery-ui.js"></script>

    <script type="text/javascript" src="/fusioncharts/js/fusioncharts.js"></script>
    <script type="text/javascript" src="/fusioncharts/js/themes/fusioncharts.theme.fint.js"></script>

    <link rel="stylesheet" href="/css/test.css">
    <title>DemoApp</title>
    <link rel="icon" type="image/x-icon" href="favicon.ico">

    <script type="text/javascript">
        var dataSource = {
            "chart": {
                "caption": "Monthly revenue for last year",
                "subCaption": "Harry's SuperMart",
                "xAxisName": "Month",
                "yAxisName": "Revenues (In USD)",
                "theme": "fint",
            },
            "data": []
        };

        var keywordList = ${keywordList};
        var keywordList2 = ${keywordList2};

        $(document).ready(function(){
            // console.log(keywordList);

            for(var i in keywordList){
                // console.log(keywordList[i]);
                dataSource.data.push({"label":keywordList[i].keyword, "value":keywordList[i].count});
                if(i == 20){ break; }
            }
        });

        FusionCharts.ready(function () {
            var revenueChart = new FusionCharts({
                "type": "area2d",
                "renderAt": "chartContainer2",
                "width": "1000",
                "height": "500",
                "dataFormat": "json",
                "dataSource": dataSource

            });
            revenueChart.render();
            var revenueChart2 = new FusionCharts({
                "type": "column2d",
                "renderAt": "chartContainer",
                "width": "1000",
                "height": "500",
                "dataFormat": "json",
                "dataSource": dataSource

            });
            revenueChart2.render();
            var revenueChart3 = new FusionCharts({
                "type": "inversemsline",
                "renderAt": "chartContainer3",
                "width": "1000",
                "height": "500",
                "dataFormat": "json",
                "dataSource": {
                    "chart": {
                        "caption": "Average Page Load Time (hsm.com)",
                        "subCaption": "Last Week",
                        "showBorder": "0",
                        "xAxisName": "Day",
                        "yAxisName": "Time (In Sec)",
                        "numberSuffix": "s",

                        //Cosmetics
                        "lineThickness": "2",
                        "paletteColors": "#008ee4,#6baa01",
                        "baseFontColor": "#333333",
                        "baseFont": "Helvetica Neue,Arial",
                        "captionFontSize": "14",
                        "subcaptionFontSize": "14",
                        "subcaptionFontBold": "0",
                        "showBorder": "0",
                        "bgColor": "#ffffff",
                        "showShadow": "0",
                        "showLegend": "0",
                        "canvasBgColor": "#ffffff",
                        "canvasBorderAlpha": "0",
                        "divlineAlpha": "100",
                        "divlineColor": "#999999",
                        "divlineThickness": "1",
                        "divLineIsDashed": "1",
                        "divLineDashLen": "1",
                        "divLineGapLen": "1",
                        "showXAxisLine": "1",
                        "xAxisLineThickness": "1",
                        "xAxisLineColor": "#999999",
                        "showAlternateHGridColor": "0",
                        "toolTipColor": "#ffffff",
                        "toolTipBorderThickness": "0",
                        "toolTipBgColor": "#000000",
                        "toolTipBgAlpha": "80",
                        "toolTipBorderRadius": "2",
                        "toolTipPadding": "5"
                    },
                    "categories": [{
                        "category": [{
                            "label": "Mon"
                        }, {
                            "label": "Tue"
                        }, {
                            "label": "Wed"
                        }, {
                            "label": "Thu"
                        }, {
                            "label": "Fri"
                        }, {
                            "label": "Sat"
                        }, {
                            "label": "Sun"
                        }]
                    }],
                    "dataset": [{
                        "seriesname": "Loading Time",
                        "allowDrag": "0",
                        "data": [{
                            "value": "6"
                        }, {
                            "value": "5.8"
                        }, {
                            "value": "5"
                        }, {
                            "value": "4.3"
                        }, {
                            "value": "4.1"
                        }, {
                            "value": "3.8"
                        }, {
                            "value": "3.2"
                        }]
                    }]
                }

            });
            revenueChart3.render();


            var revenueChart4 = new FusionCharts({
                "type": "pie2d",
                "renderAt": "chartContainer4",
                "width": "1000",
                "height": "500",
                "dataFormat": "json",
                "dataSource": {
                    "chart": {
                        "caption": "Split of revenue by product categories",
                        "subCaption": "Last year",
                        "numberPrefix": "$",
                        "showPercentInTooltip": "0",
                        "showTooltip": "0",
                        "decimals": "1",
                        "useDataPlotColorForLabels": "1",
                        //Theme
                        "theme": "fint"
                    },
                    "data": [{
                        "label": "Food",
                        "value": "10"
                    }, {
                        "label": "Apparels",
                        "value": "20"
                    }, {
                        "label": "Electronics",
                        "value": "30"
                    }, {
                        "label": "Household",
                        "value": "40"
                    }, {
                        "label": "notused",
                        "value": "100",
                        "alpha": "0",
                        "showValue": "0",
                        "showLabel": "0"
                    }]
                }
            });
            revenueChart4.render();


            var fusioncharts = new FusionCharts({
                    type: 'msline',
                    renderAt: 'chartContainer5',
                    width: '1000',
                    height: '500',
                    dataFormat: 'json',
                    dataSource: {
                        "chart": {
                            "caption": "Number of visitors last week",
                            "subCaption": "Bakersfield Central vs Los Angeles Topanga",
                            "captionFontSize": "14",
                            "subcaptionFontSize": "14",
                            "subcaptionFontBold": "0",
                            "paletteColors": "#0075c2,#1aaf5d",
                            "bgcolor": "#ffffff",
                            "showBorder": "0",
                            "showShadow": "0",
                            "showCanvasBorder": "0",
                            "usePlotGradientColor": "0",
                            "legendBorderAlpha": "0",
                            "legendShadow": "0",
                            "showAxisLines": "0",
                            "showAlternateHGridColor": "0",
                            "divlineThickness": "1",
                            "divLineIsDashed": "1",
                            "divLineDashLen": "1",
                            "divLineGapLen": "1",
                            "xAxisName": "Day",
                            "showValues": "0"
                        },
                        "categories": [{
                            "category": [{
                                "label": "Mon"
                            }, {
                                "label": "Tue"
                            }, {
                                "label": "Wed"
                            }, {
                                "vline": "true",
                                "lineposition": "0",
                                "color": "#6baa01",
                                "labelHAlign": "center",
                                "labelPosition": "0",
                                "label": "National holiday",
                                "dashed": "1"
                            }, {
                                "label": "Thu"
                            }, {
                                "label": "Fri"
                            }, {
                                "label": "Sat"
                            }, {
                                "label": "Sun"
                            }]
                        }],
                        "dataset": [{
                            "seriesname": "Bakersfield Central",
                            "data": [{
                                "value": "15123"
                            }, {
                                "value": "14233"
                            }, {
                                "value": "25507"
                            }, {
                                "value": "9110"
                            }, {
                                "value": "15529"
                            }, {
                                "value": "20803"
                            }, {
                                "value": "19202"
                            }]
                        }, {
                            "seriesname": "Los Angeles Topanga",
                            "data": [{
                                "value": "13400"
                            }, {
                                "value": "12800"
                            }, {
                                "value": "22800"
                            }, {
                                "value": "12400"
                            }, {
                                "value": "15800"
                            }, {
                                "value": "19800"
                            }, {
                                "value": "21800"
                            }]
                        }],
                        "trendlines": [{
                            "line": [{
                                "startvalue": "17022",
                                "color": "#6baa01",
                                "valueOnRight": "1",
                                "displayvalue": "Average"
                            }]
                        }]
                    }
                }
            );
            fusioncharts.render();

            var chartInstance = new FusionCharts({
                type: 'column2D',
                width: '700', // Width of the chart
                height: '400', // Height of the chart
                dataFormat: 'json', // Data type
                renderAt:'chart-container', //container where the chart will render
                dataSource: {
                    "chart": {
                        "caption": "Countries With Most Oil Reserves [2017-18]",
                        "subCaption": "In MMbbl = One Million barrels",
                        "xAxisName": "Country",
                        "yAxisName": "Reserves (MMbbl)",
                        "numberSuffix": "K",
                        "theme": "fusion",
                    },
                    // Chart Data
                    "data": [{
                        "label": "Venezuela",
                        "value": "290"
                    }, {
                        "label": "Saudi",
                        "value": "260"
                    }, {
                        "label": "Canada",
                        "value": "180"
                    }, {
                        "label": "Iran",
                        "value": "140"
                    }, {
                        "label": "Russia",
                        "value": "115"
                    }, {
                        "label": "UAE",
                        "value": "100"
                    }, {
                        "label": "US",
                        "value": "30"
                    }, {
                        "label": "China",
                        "value": "30"
                    }]
                }
            });
// Render
            chartInstance.render();
        })
    </script>
</head>

<body>
<div id="chartContainer2">FusionCharts XT will load here!</div>
<div id="chartContainer">FusionCharts XT will load here!</div>
<div id="chartContainer3">FusionCharts XT will load here!</div>
<div id="chartContainer4">FusionCharts XT will load here!</div>
<div id="chartContainer5">FusionCharts XT will load here!</div>

<div id="chart-container">FusionCharts XT will load here!</div>

</body>

</html>
