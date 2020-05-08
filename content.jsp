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
					title : "��"
				},
				axisY : {
					title : "Ȯ���� ��"
				},
				title : {
					text : "����� �Ϻ� �ڷγ� Ȯ���ڼ�"
				},
				data : [ {
					name : "�ڷγ� Ȯ����",
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
					title : "��"
				},
				axisY : {
					title : "ž���� ��"
				},
				title : {
					text : "19-20 �����̿밴��"
				},
				data : [ {
					name : "2019 ž����",
					type : "line",
					showInLegend : true,
					dataPoints : ar1
				}, {
					name : "2020 ž����",
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
					title : "����"
				},
				axisY : {
					title : "ž���ڼ�"
				},
				title : {
					text : "�ڷγ� �����������̿��"
				},
				data : [ {
					name : "2019 ž����",
					type : "column",
					showInLegend : true,
					dataPoints : ar1
				}, {
					name : "2020 ž����",
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
					title : "����"
				},
				axisY : {
					title : "ž���ڼ�"
				},
				title : {
					text : "���� ���� vs�ָ� �̿밴�� ��"
				},
				data : [ {
					name : "2019 ž����",
					type : "column",
					showInLegend : true,
					dataPoints : ar1
				}, {
					name : "2020 ž����",
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
					text : "����ö �Ϻ� �̿밴�� ��",
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
					text : "����ö ���� vs�ָ� �̿밴�� ��",
					fontSize : 25
				},
				data : [ {
					name : "����",
					type : "column",
					showInLegend : true,
					dataPoints : wd
				}, {
					name : "�ָ�", //Shows y value on all Data Points
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
					text : "�ڷγ� �߻� ���� ����ö ���� �̿밴�� ������ Top 10",
					fontSize : 25
				},
				axisY : {
					title : "���� �̿밴��",
					stripLines : [ {
						value : 760283,
						label : "��ü ������ ���",
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
					title : "������",
					suffix : "%",
					stripLines : [ {
						value : 23.29862,
						label : "��ü ������ ���",
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
					text : "����� ������ �ڷγ� Ȯ���� �� ",
					fontSize : 25
				},
				axisX: {
					title: "����"
				},
				axisY: {
					title: "Ȯ���� �� "
			
				},
				data : [ {
					name: "������ Ȯ���ڼ�",
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
					text : "���� VS ���� �ڷγ� Ȯ���� �� ������",
					fontSize : 25
				},
				axisX : {
					title : "��¥",
					titleFontSize : 20,
					xValueFormatString : "DD MMM, YYYY"
				},
				axisY : {
					title : "Ȯ���� �� (����)",
					titleFontSize : 20,

				},
				legend : {
					fontSize : 15,
					fontColor : "#353535"
				},

				data : [ {
					type : "line",
					showInLegend : true,
					name : "����Ȯ����",
					lineColor : "#4F81BC",
					dataPoints : ar6

				}, {
					type : "line",
					showInLegend : true,
					name : "����Ȯ����",
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
	<h1>1. �Ұ�/����/���</h1>
	<br> ## ppt�ڷ� ���Կ���
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
	<h1>2. �����ͼ���</h1>
	<br> ## ppt�ڷ� ���Կ���
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
	<h1>3. �����ͺм�����</h1>
	<h2>&ensp;3.1 �ڷγ��߻���Ȳ</h2>
	<div id="chartContainer1n" style="height: 300px; width: 100%;"></div>
	<br> - 3/11 ���α��ݼ��� ���ܰ�����η� ���� �����ڼ� ��������
	<br> - 4/1 ���� 2���̻� ���� �� �ؿ� ���� ����
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="chartContainer2" style="height: 300px; width: 100%;"></div>	
	<br> -��õ�� �뱸 ��ȸ ���ܰ������� 2/20���� ���� �ڷγ� Ȯ���ڼ�  ����
	<br> -3/22 ��ȸ�� �Ÿ��α� ����
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="chartContainer3" style="height: 300px; width: 100%;"></div>
	<br> -����� 25�� ��ġ���� �ڷγ� ���� Ȯ���ڼ� ��Ȳ 
	<br> -Ȯ���� 601(����62, ����13, ����5, ����26, ����42, ����8, ����35, ��õ12, ���23, ����9, ���빮31, ����31, ����24, ���빮18, ����37, ����19, ����23, ����37, ��õ21, ������25, ���18, ����28, ����16, �߱�6, �߶�16)
	<br>
	<br>
	<br>
	<br>
	<h2>&ensp;3.2 ���� ���߱��� �̿밴 ��</h2>
	<div id="chartContainer4" style="height: 300px; width: 100%;"></div>
	<br>- 2019�� ����(2/5)�� 2020�� ����(1/25)�� ���� �̿밴 ���� ����
	<br>- ������ �Ⱓ �� �̿밴�� 388,043,418�� ����, �������� 24.4%
	<br>- 1�� 20�� ���� ù Ȯ���� ����, 2�� 23�� ���� ����ܰ� �ְ� ���� '�ɰ�'�ݻ� �� �������� �ް��� Ŀ���� ����
	<br>
	<br>
	<br>
	<br>
	<div id="chartContainer2n" style="height: 300px; width: 100%;"></div>
	<br>- 2019�� ����(2/5)�� 2020�� ����(1/25)�� ���� �̿밴 ���� ����
	<br>- ������ �Ⱓ �� �̿밴��222,616,831�� ����, �������� 20.5%
	<br>- 1�� 20�� ���� ù Ȯ���� ����, 2�� 23�� ���� ����ܰ� �ְ� ���� '�ɰ�'�ݻ� �� �������� �ް��� Ŀ���� ����<br>
	<br>
	<br>
	<br>
	<h2>&ensp;3.3 ����/�ָ� ���߱����̿밴��</h2>
	<div id="chartContainer5" style="height: 300px; width: 100%;"></div>
	<br>- ���� ��� ���� �̿밴�� 21.4% ����, �ָ��� 34.2% ����
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="chartContainer4n" style="height: 300px; width: 100%;"></div>
	<br>- ���� ��� ���� �̿밴�� 20.7% ����, �ָ��� 19.1% ����
	<br>
	<br>
	<br>
	<br>
	<br>
	<h2>&ensp;3.4 ������/���� ���߱����̿밴��</h2>
	<div id="chartContainer6" style="height: 300px; width: 100%;"></div>
	<br> - ���� ��� ���� �̿밴 ������ ����� 760,283�� �̸�, ������ ����� 23.3%�� ���߱��� ���, ������ �߽� �̿밴�� ũ�� ����	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br> - 2020�� ���� ���� �� �̿밴�� �񱳿��� ����
	<div id="chartContainer3n" style="height: 300px; width: 100%;"></div>
	<br><br><br><br><br><br>
	<h1>4. ���</h1>
	<br> ## ppt�ڷ� ���Կ���
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