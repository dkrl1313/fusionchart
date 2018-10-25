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

    <title>DemoApp</title>
    <link rel="icon" type="image/x-icon" href="favicon.ico">

    <script type="text/javascript">
        $(document).ready(function () {

        });

        FusionCharts.ready(function () {
            var fusioncharts = new FusionCharts({
                type: 'inversemsline',
                renderAt: 'chart-container',
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
                        // "paletteColors": "#0075c2,#1aaf5d",
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
                        "showValues": "0",
                        "yAxisMinValue": "1",
                        "yAxisMaxValue": "15",
                        "numDivLines": "14",
                        "numVDivLines": "22",
                        "legendPosition": "right",
                    },
                    "categories": [{
                        "category": [{
                            "label": "00시"
                        }, {
                            "label": "01시"
                        }, {
                            "label": "02시"
                        }, {
                            "label": "03시"
                        }, {
                            "label": "04시"
                        }, {
                            "label": "05시"
                        }, {
                            "label": "06시"
                        }, {
                            "label": "07시"
                        }, {
                            "label": "08시"
                        }, {
                            "label": "09시"
                        }, {
                            "label": "10시"
                        }, {
                            "label": "11시"
                        }, {
                            "label": "12시"
                        }, {
                            "label": "13시"
                        }, {
                            "label": "14시"
                        }, {
                            "label": "15시"
                        }, {
                            "label": "16시"
                        }, {
                            "label": "17시"
                        }, {
                            "label": "18시"
                        }, {
                            "label": "19시"
                        }, {
                            "label": "20시"
                        }, {
                            "label": "21시"
                        }, {
                            "label": "22시"
                        }, {
                            "label": "23시"
                        }]
                    }],
                    "dataset": [{
                        "seriesname": "지능형자동입찰 마케팅크레프트",
                        "data": [{
                            "value": "1"
                        }, {
                            "value": "1"
                        }, {
                            "value": "1"
                        }, {
                            "value": "1"
                        }, {
                            "value": "1"
                        }, {
                            "value": "1"
                        }, {
                            "value": "1"
                        }, {
                            "value": "2"
                        }, {
                            "value": "1"
                        }, {
                            "value": "4"
                        }, {
                            "value": "4"
                        }, {
                            "value": "5"
                        }, {
                            "value": "2"
                        }, {
                            "value": "5"
                        }, {
                            "value": "5"
                        }, {
                            "value": "5"
                        }, {
                            "value": "5"
                        }, {
                            "value": "5"
                        }, {
                            "value": "4"
                        }, {
                            "value": "2"
                        }, {
                            "value": "2"
                        }, {
                            "value": "2"
                        }, {
                            "value": "2"
                        }, {
                            "value": "1"
                        }]
                    }, {
                        "seriesname": "검색광고솔루션 플레이디",
                        "data": [{
                            "value": "2"
                        }, {
                            "value": "3"
                        }, {
                            "value": "3"
                        }, {
                            "value": "3"
                        }, {
                            "value": "3"
                        }, {
                            "value": "2"
                        }, {
                            "value": "3"
                        }, {
                            "value": "4"
                        }, {
                            "value": "4"
                        }, {
                            "value": "6"
                        }, {
                            "value": "6"
                        }, {
                            "value": "7"
                        }, {
                            "value": "4"
                        }, {
                            "value": "7"
                        }, {
                            "value": "6"
                        }, {
                            "value": "6"
                        }, {
                            "value": "7"
                        }, {
                            "value": "6"
                        }, {
                            "value": "6"
                        }, {
                            "value": "3"
                        }, {
                            "value": ""
                        }, {
                            "value": ""
                        }, {
                            "value": ""
                        }, {
                            "value": ""
                        }]
                    },
                    {
                        "seriesname": "네이버 키워드 자동입찰 셀",
                        "data": [{
                            "value": "3"
                        }, {
                            "value": "4"
                        }, {
                            "value": "2"
                        }, {
                            "value": "2"
                        }, {
                            "value": "4"
                        }, {
                            "value": "3"
                        }, {
                            "value": "2"
                        }, {
                            "value": "1"
                        }, {
                            "value": "2"
                        }, {
                            "value": "3"
                        }, {
                            "value": "3"
                        }, {
                            "value": "2"
                        }, {
                            "value": "1"
                        }, {
                            "value": "2"
                        }, {
                            "value": "2"
                        }, {
                            "value": "2"
                        }, {
                            "value": "2"
                        }, {
                            "value": "2"
                        }, {
                            "value": "2"
                        }, {
                            "value": "4"
                        }, {
                            "value": "1"
                        }, {
                            "value": "1"
                        }, {
                            "value": "1"
                        }, {
                            "value": "2"
                        }]
                    },
                    {
                        "seriesname": "종합광고대행사 애드게이트",
                        "data": [{
                            "value": "4"
                        }, {
                            "value": "5"
                        }, {
                            "value": "4"
                        }, {
                            "value": "4"
                        }, {
                            "value": "5"
                        }, {
                            "value": "4"
                        }, {
                            "value": "4"
                        }, {
                            "value": "6"
                        }, {
                            "value": "6"
                        }, {
                            "value": "8"
                        }, {
                            "value": "9"
                        }, {
                            "value": "8"
                        }, {
                            "value": "7"
                        }, {
                            "value": "9"
                        }, {
                            "value": "9"
                        }, {
                            "value": "9"
                        }, {
                            "value": "9"
                        }, {
                            "value": "8"
                        }, {
                            "value": ""
                        }, {
                            "value": ""
                        }, {
                            "value": ""
                        }, {
                            "value": ""
                        }, {
                            "value": ""
                        }, {
                            "value": ""
                        }]
                    }
                ]}
            });
            fusioncharts.render();
        });
    </script>
</head>

<body>
<div id="chart-container">FusionCharts XT will load here!</div>
</body>

</html>
