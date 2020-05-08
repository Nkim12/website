<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.getJSON("http://localhost/TeamProject/Getdayjson", function(ads) {
			var ar = [];
			$.each(ads, function(i, f) {
				ar[i] = {
					label : f.day,
					y : f.confirmed * 1
				};
			});
			var chart = new CanvasJS.Chart("chartContainer1n", {
				animationEnabled : true,
				axisX : {
					title : "일"
				},
				axisY : {
					title : "확진자 수"
				},
				title : {
					text : "서울시 일별 코로나 확진자수"
				},
				data : [ {
					name : "코로나 확진자",
					type : "line",
					showInLegend : true,
					dataPoints : ar
				} ]
			});
			chart.render();
		});
		$.getJSON("http://localhost/TeamProject/Getdayjson", function(ads) {
			var ar1 = [];
			var ar2 = [];
			$.each(ads, function(i, f) {
				ar1[i] = {
					label : f.day,
					y : f.y19 * 1
				};
				ar2[i] = {
					label : f.day,
					y : f.y20 * 1
				};
			});
			var chart = new CanvasJS.Chart("chartContainer2n", {
				animationEnabled : true,
				axisX : {
					title : "일"
				},
				axisY : {
					title : "탑승자 수"
				},
				title : {
					text : "19-20 버스이용객비교"
				},
				data : [ {
					name : "2019 탑승자",
					type : "line",
					showInLegend : true,
					dataPoints : ar1
				}, {
					name : "2020 탑승자",
					type : "line",
					showInLegend : true,
					dataPoints : ar2
				} ]
			});
			chart.render();
		});
		$.getJSON("http://localhost/TeamProject/GetbyAreajson", function(ads) {
			var ar1 = [];
			var ar2 = [];
			$.each(ads, function(i, f) {
				ar1[i] = {
					label : f.Area,
					y : f.y2019 * 1
				};
				ar2[i] = {
					label : f.Area,
					y : f.y2020 * 1
				};
			});
			var chart = new CanvasJS.Chart("chartContainer3n", {
				animationEnabled : true,
				axisX : {
					title : "지역"
				},
				axisY : {
					title : "탑승자수"
				},
				title : {
					text : "코로나 지역별버스이용비교"
				},
				data : [ {
					name : "2019 탑승자",
					type : "column",
					showInLegend : true,
					dataPoints : ar1
				}, {
					name : "2020 탑승자",
					type : "column",
					showInLegend : true,
					dataPoints : ar2
				} ]
			});
			chart.render();
		});
		$.getJSON("http://localhost/TeamProject/Getaccordingtoweekjson", function(ads) {
			var ar1 = [];
			var ar2 = [];
			$.each(ads, function(i, f) {
				ar1[i] = {
					label : f.week,
					y : f.y2019 * 1
				};
				ar2[i] = {
					label : f.week,
					y : f.y2020 * 1
				};
			});
			var chart = new CanvasJS.Chart("chartContainer4n", {
				animationEnabled : true,
				axisX : {
					title : "연도"
				},
				axisY : {
					title : "탑승자수"
				},
				title : {
					text : "버스 평일 vs주말 이용객수 비교"
				},
				data : [ {
					name : "2019 탑승자",
					type : "column",
					showInLegend : true,
					dataPoints : ar1
				}, {
					name : "2020 탑승자",
					type : "column",
					showInLegend : true,
					dataPoints : ar2
				} ]
			});
			chart.render();
		});

		$.getJSON("http://localhost/TeamProject/GetSubJSON", function(sd) {
			var user2019 = [];
			var user2020 = [];
			$.each(sd, function(i, s) {
				user2019[i] = {
					label : s.day,
					y : s.y2019 * 1
				};
				user2020[i] = {
					label : s.day,
					y : s.y2020 * 1
				};
			});
			var chart = new CanvasJS.Chart("chartContainer4", {
				animationEnabled : true,
				exportEnabled : true,
				theme : "light1", // "light1", "light2", "dark1", "dark2"
				title : {
					text : "지하철 일별 이용객수 비교",
					fontSize : 25
				},
				data : [ {
					name : "2019", //Shows y value on all Data Points
					type : "line", //change type to bar, line, area, pie, etc
					showInLegend : true,
					dataPoints : user2019
				}, {
					name : "2020", //Shows y value on all Data Points
					type : "line", //change type to bar, line, area, pie, etc
					showInLegend : true,
					dataPoints : user2020
				} ]
			});
			chart.render();
		});
		
		$.getJSON("http://localhost/TeamProject/GetSubWJSON", function(sd1) {
			var wd = [];
			var wk = [];
			$.each(sd1, function(i, s) {
				wd[i] = {
					label : s.year,
					y : parseInt(s.weekday * 1)
				};
				wk[i] = {
					label : s.year,
					y : parseInt(s.weekend * 1)
				};
			});
			var chart = new CanvasJS.Chart("chartContainer5", {
				animationEnabled : true,
				exportEnabled : true,
				theme : "light1", // "light1", "light2", "dark1", "dark2"
				title : {
					text : "지하철 평일 vs주말 이용객수 비교",
					fontSize : 25
				},
				data : [ {
					name : "평일",
					type : "column",
					showInLegend : true,
					dataPoints : wd
				}, {
					name : "주말", //Shows y value on all Data Points
					type : "column", //change type to bar, line, area, pie, etc
					showInLegend : true,
					dataPoints : wk
				} ]
			});
			chart.render();
		});

		$.getJSON("http://localhost/TeamProject/GetSubSJSON", function(sd2) {
			var gab = [];
			var per = [];
			$.each(sd2, function(i, s) {
				gab[i] = {
					label : s.station,
					y : s.gab * 1
				};
				per[i] = {
					label : s.station,
					y : s.per * 100
				};
			});
			var chart = new CanvasJS.Chart("chartContainer6", {
				animationEnabled : true,
				exportEnabled : true,
				theme : "light1", // "light1", "light2", "dark1", "dark2"
				title : {
					text : "코로나 발생 이후 지하철 역별 이용객수 감소폭 Top 10",
					fontSize : 25
				},
				axisY : {
					title : "감소 이용객수",
					stripLines : [ {
						value : 760283,
						label : "전체 감소폭 평균",
						labelFontColor : "#0100FF",
						showOnTop : true,
						labelAlign : "center",
						labelFontSize : 14,
						color : "#0100FF"
					} ],
					lineColor : "#4F81BC",
					tickColor : "#4F81BC",
					labelFontColor : "#4F81BC"
				},
				axisY2 : {
					title : "감소율",
					suffix : "%",
					stripLines : [ {
						value : 23.29862,
						label : "전체 감소율 평균",
						labelFontColor : "#FF0800",
						showOnTop : true,
						labelAlign : "center",
						labelFontSize : 14,
						color : "#FF0800"
					} ],
					lineColor : "#C0504E",
					tickColor : "#C0504E",
					labelFontColor : "#C0504E"
				},
				data : [ {
					type : "column", //change type to bar, line, area, pie, etc
					dataPoints : gab
				} ]
			});
			chart.render();
			createPareto();

			function createPareto() {
				var yTotal = 0;
				for (var i = 0; i < chart.data[0].dataPoints.length; i++)
					yTotal += chart.data[0].dataPoints[i].y;
				theme: "light1"
				chart.addTo("data", {
					type : "line",
					yValueFormatString : "0.##\"%\"",
					dataPoints : per
				});
				chart.data[1].set("axisYType", "secondary", false);
				chart.axisY[0].set("maximum", 8000000);
				chart.axisY2[0].set("maximum", 100);
			}

		});
		$.getJSON("http://192.168.1.23/TeamProject/GetCoronaJSON", function(cr) {
			var ar5 = []
			$.each(cr, function(i, c) {
				ar5[i] = {
					label : c.area,
					y : c.num * 1
				};

			});

			var chart = new CanvasJS.Chart("chartContainer3", {
				animationEnabled : true,
				title : {
					text : "서울시 구역별 코로나 확진자 수 ",
					fontSize : 25
				},
				axisX: {
					title: "구역"
				},
				axisY: {
					title: "확진자 수 "
			
				},
				data : [ {
					name: "구역별 확진자수",
					type : "column",
					showInLegend : true,
					dataPoints : ar5
				} ]
			});
			chart.render();

		});
		$.getJSON("http://192.168.1.23/TeamProject/GetCoronaJSON3", function(cr4) {
			var ar6 = [];
			var ar7 = [];
			$.each(cr4, function(i, c) {
				ar6[i] = {
					x : new Date(c.sdate),
					y : c.snum * 1
				};
				ar7[i] = {
					x : new Date(c.ndate),
					y : c.nnum * 1
				};
			});

			var chart = new CanvasJS.Chart("chartContainer2", {
				title : {
					text : "전국 VS 서울 코로나 확진자 수 누적비교",
					fontSize : 25
				},
				axisX : {
					title : "날짜",
					titleFontSize : 20,
					xValueFormatString : "DD MMM, YYYY"
				},
				axisY : {
					title : "확진자 수 (누적)",
					titleFontSize : 20,

				},
				legend : {
					fontSize : 15,
					fontColor : "#353535"
				},

				data : [ {
					type : "line",
					showInLegend : true,
					name : "서울확진자",
					lineColor : "#4F81BC",
					dataPoints : ar6

				}, {
					type : "line",
					showInLegend : true,
					name : "전국확진자",
					lineColor : "#C0504E",
					dataPoints : ar7
				} ]
			});
			chart.render();

		});

	});
</script>

</head>
<body>
	<h1>1. 소개/목적/배경</h1>
	<br> ## ppt자료 삽입예정
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br><br>
	<br>
	<br>
	<br>
	<br>
	<h1>2. 데이터설정</h1>
	<br> ## ppt자료 삽입예정
	<br>
	<br><br>
	<br>
	<br>
	<br>
	<br><br><br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h1>3. 데이터분석내용</h1>
	<h2>&ensp;3.1 코로나발생현황</h2>
	<div id="chartContainer1n" style="height: 300px; width: 100%;"></div>
	<br> - 3/11 구로구콜센터 집단감염경로로 인해 감염자수 대폭증가
	<br> - 4/1 이후 2차이상 감염 및 해외 접촉 추정
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="chartContainer2" style="height: 300px; width: 100%;"></div>	
	<br> -신천지 대구 교회 집단감염으로 2/20이후 전국 코로나 확진자수  급증
	<br> -3/22 사회적 거리두기 시작
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="chartContainer3" style="height: 300px; width: 100%;"></div>
	<br> -서울시 25개 자치구별 코로나 누적 확진자수 현황 
	<br> -확진자 601(강남62, 강동13, 강북5, 강서26, 관악42, 광진8, 구로35, 금천12, 노원23, 도봉9, 동대문31, 동작31, 마포24, 서대문18, 서초37, 성동19, 성북23, 송파37, 양천21, 영등포25, 용산18, 은평28, 종로16, 중구6, 중랑16)
	<br>
	<br>
	<br>
	<br>
	<h2>&ensp;3.2 일일 대중교통 이용객 비교</h2>
	<div id="chartContainer4" style="height: 300px; width: 100%;"></div>
	<br>- 2019년 설날(2/5)과 2020년 설날(1/25)로 인한 이용객 차이 배제
	<br>- 전년대비 기간 총 이용객은 388,043,418명 감소, 감소율은 24.4%
	<br>- 1월 20일 국내 첫 확진자 이후, 2월 23일 국가 위기단계 최고 수준 '심각'격상 후 감소폭이 급격히 커진후 유지
	<br>
	<br>
	<br>
	<br>
	<div id="chartContainer2n" style="height: 300px; width: 100%;"></div>
	<br>- 2019년 설날(2/5)과 2020년 설날(1/25)로 인한 이용객 차이 배제
	<br>- 전년대비 기간 총 이용객은222,616,831명 감소, 감소율은 20.5%
	<br>- 1월 20일 국내 첫 확진자 이후, 2월 23일 국가 위기단계 최고 수준 '심각'격상 후 감소폭이 급격히 커진후 유지<br>
	<br>
	<br>
	<br>
	<h2>&ensp;3.3 평일/주말 대중교통이용객비교</h2>
	<div id="chartContainer5" style="height: 300px; width: 100%;"></div>
	<br>- 전년 대비 평일 이용객은 21.4% 감소, 주말은 34.2% 감소
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="chartContainer4n" style="height: 300px; width: 100%;"></div>
	<br>- 전년 대비 평일 이용객은 20.7% 감소, 주말은 19.1% 감소
	<br>
	<br>
	<br>
	<br>
	<br>
	<h2>&ensp;3.4 지역구/역별 대중교통이용객비교</h2>
	<div id="chartContainer6" style="height: 300px; width: 100%;"></div>
	<br> - 전년 대비 역별 이용객 감소폭 평균은 760,283명 이며, 감소율 평균은 23.3%로 대중교통 허브, 관광지 중심 이용객수 크게 감소	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br> - 2020년 새로 생긴 역 이용객은 비교에서 제외
	<div id="chartContainer3n" style="height: 300px; width: 100%;"></div>
	<br><br><br><br><br><br>
	<h1>4. 결과</h1>
	<br> ## ppt자료 삽입예정
	<br>
	<br><br>
	<br>
	<br><br><br>
	<br>
	<br>
	<br>
	<br><br>
	<br><br><br>
	<br><br>
	<br><br>
	<br>
	<br><br><br>
	<br>
	<br>
	<br>
	<br><br>
	<br><br><br>
	<br>
	<br><br><br>
	<br>
	<br>
	<br>
	<br><br>
	<br>
	<br><br>
	<br><br>
	<br>
	<br>
</body>
</html>