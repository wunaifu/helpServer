function initMyData(year) {
  var ctx1, data1, myLineChart1, options1;
  var ctx2, data2, myLineChart2, options2;
  var ctx3, data3, myLineChart3, options3;
  Chart.defaults.global.responsive = true;
  ctx1 = $('#jumbotron-line-chart1').get(0).getContext('2d');
  ctx2 = $('#jumbotron-line-chart2').get(0).getContext('2d');
  ctx3 = $('#jumbotron-line-chart3').get(0).getContext('2d');
  options1 = {
    showScale: true,
    scaleShowGridLines: false,
    scaleGridLineColor: "rgba(0,0,0,.05)",
    scaleGridLineWidth: 0,
    scaleShowHorizontalLines: false,
    scaleShowVerticalLines: false,
    bezierCurve: false,
    bezierCurveTension: 0.4,
    pointDot: false,
    pointDotRadius: 0,
    pointDotStrokeWidth: 2,
    pointHitDetectionRadius: 20,
    datasetStroke: true,
    datasetStrokeWidth: 4,
    datasetFill: true,
    legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%>" +
    "<li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
  };
  options2 = {
    showScale: true,
    scaleShowGridLines: false,
    scaleGridLineColor: "rgba(0,0,0,.05)",
    scaleGridLineWidth: 0,
    scaleShowHorizontalLines: false,
    scaleShowVerticalLines: false,
    bezierCurve: false,
    bezierCurveTension: 0.4,
    pointDot: false,
    pointDotRadius: 0,
    pointDotStrokeWidth: 2,
    pointHitDetectionRadius: 20,
    datasetStroke: true,
    datasetStrokeWidth: 4,
    datasetFill: true,
    legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%>" +
    "<li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
  };
  options3 = {
    showScale: true,
    scaleShowGridLines: false,
    scaleGridLineColor: "rgba(0,0,0,.05)",
    scaleGridLineWidth: 0,
    scaleShowHorizontalLines: false,
    scaleShowVerticalLines: false,
    bezierCurve: false,
    bezierCurveTension: 0.4,
    pointDot: false,
    pointDotRadius: 0,
    pointDotStrokeWidth: 2,
    pointHitDetectionRadius: 20,
    datasetStroke: true,
    datasetStrokeWidth: 4,
    datasetFill: true,
    legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%>" +
    "<li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
  };
  var initData1=[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  var initData2=[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  var initData3=[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  $.ajax({
    type : "POST",
    url: "/index/backdata?year="+year,
    contentType : "application/json;charset=utf-8",
    dataType : "json",
    error : function() {
      alert("数据初始化失败");
    },
    success:function (data) {
      if (data.length>0) {
        //console.log(data);
        $.each(data,function(i,item){
          //console.log(item.monthmen);
          initData1[i]=item.monthmen;
          initData2[i]=item.monthorders;
          initData3[i]=item.monthmoney;
        });
      }else {

      }
      data1 = {
        labels: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
        datasets: [
          {
            label: "My Second dataset",
            fillColor: "rgba(34, 167, 240,0.2)",
            strokeColor: "#22A7F0",
            pointColor: "#22A7F0",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "#22A7F0",
            data: initData1
          }
        ]
      };
      data2 = {
        labels: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
        datasets: [
          {
            label: "My Second dataset",
            fillColor: "rgba(34, 167, 240,0.2)",
            strokeColor: "#22A7F0",
            pointColor: "#22A7F0",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "#22A7F0",
            data: initData2
          }
        ]
      };
      data3 = {
        labels: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
        datasets: [
          {
            label: "My Second dataset",
            fillColor: "rgba(34, 167, 240,0.2)",
            strokeColor: "#22A7F0",
            pointColor: "#22A7F0",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "#22A7F0",
            data: initData3
          }
        ]
      };
      myLineChart1 = new Chart(ctx1).Line(data1, options1);
      myLineChart2 = new Chart(ctx2).Line(data2, options2);
      myLineChart3 = new Chart(ctx3).Line(data3, options3);
    }
  });

}

