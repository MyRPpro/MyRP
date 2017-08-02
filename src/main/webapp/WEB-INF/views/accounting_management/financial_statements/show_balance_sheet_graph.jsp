<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
@import url('https://fonts.googleapis.com/css?family=Lato:300,400,700|Montserrat:300,400,500,700');

body {font-family: 'Lato', sans-serif;fill: #333333; font-size: 14px; text-align: center;}
H3{ font-family: 'Montserrat', sans-serif; font-size:32px}
.outsideText{ font-family: 'Montserrat', sans-serif; font-size:18px;}
.insideText{fill:#ffffff; text-shadow:0px 1px 0px #333;}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.6/d3.min.js"></script>
<script type="text/javascript">
////////////////////////////////////////////////////////////
//////////////////////// Set-up ////////////////////////////
////////////////////////////////////////////////////////////

var screenWidth = window.innerWidth;

var margin = {left: 20, top: 20, right: 20, bottom: 20},
	width = Math.min(screenWidth, 600) - margin.left - margin.right,
	height = Math.min(screenWidth, 600) - margin.top - margin.bottom;
			
var svg = d3.select("#behaviourchart").append("svg")
			.attr("width", (width + margin.left + margin.right))
			.attr("height", (height + margin.top + margin.bottom))
		   .append("g").attr("class", "wrapper")
			.attr("transform", "translate(" + (width / 2 + margin.left) + "," + (height / 2 + margin.top) + ")");



////////////////////////////////////////////////////////////// 
///////////////////// Data &  Scales ///////////////////////// 
////////////////////////////////////////////////////////////// 

//Some random data
var donutData = [
	{name: "Director",value: 20},
	{name: "Administrator",value: 20},
	{name: "Motivator",value: 20},
	{name: "Networker",value: 20},
	{name: "Marketer",value: 20},
	{name: "Supporter",value: 20},
	{name: "Organizer",value: 20},
	{name: "Trainer",value: 20},
{name: "Examiner",value: 20}
];

var insidedonutData = [
	{name: "user1 /n user1-a, user1-b",value: 20},
	{name: "user2",value: 20},
	{name: "user3",value: 20},
	{name: "user4",value: 20},
	{name: "user5",value: 20},
	{name: "user6",value: 20},
	{name: "user7",value: 20},
	{name: "user8",value: 20},
{name: "user9",value: 20}
];

//Create a color scale
var colorScale = d3.scale.linear()
   .domain([0,1,2,3,4,5,6,7,8])
   .range(["#40a4d8","#33beb8","#b2c225","#fecc2f","#f9a228","#f6621f","#db3838","#7200d2"])
   .interpolate(d3.interpolateHcl);

//Create an arc function   
var arc = d3.svg.arc()
	.innerRadius(width*0.05) 
	.outerRadius(width*0.75/2 + 30);

//Turn the pie chart 90 degrees counter clockwise, so it starts at the left	
var pie = d3.layout.pie()
	.startAngle(-90 * Math.PI/180)
	.endAngle(-90 * Math.PI/180 + 2*Math.PI)
	.value(function(d) { return d.value; })
	.padAngle(.001)
	.sort(null);
 
////////////////////////////////////////////////////////////// 
//////////////////// Create Donut Chart ////////////////////// 
////////////////////////////////////////////////////////////// 

//Create the donut slices and also the invisible arcs for the text 
svg.selectAll(".donutArcs")
	.data(pie(donutData))
  .enter().append("path")
	.attr("class", "donutArcs")
	.attr("d", arc)
	.style("fill", function(d,i) {
		if(i === 7) return "#a363d9"; //Other
		else return colorScale(i); 
	})
.each(function(d,i) {
	//Search pattern for everything between the start and the first capital L
	var firstArcSection = /(^.+?)L/; 	

	//Grab everything up to the first Line statement
	var newArc = firstArcSection.exec( d3.select(this).attr("d") )[1];
	//Replace all the comma's so that IE can handle it
	newArc = newArc.replace(/,/g , " ");
	
	//If the end angle lies beyond a quarter of a circle (90 degrees or pi/2) 
	//flip the end and start position
	if (d.endAngle > 90 * Math.PI/180) {
		var startLoc 	= /M(.*?)A/,		//Everything between the first capital M and first capital A
			middleLoc 	= /A(.*?)0 0 1/,	//Everything between the first capital A and 0 0 1
			endLoc 		= /0 0 1 (.*?)$/;	//Everything between the first 0 0 1 and the end of the string (denoted by $)
		//Flip the direction of the arc by switching the start en end point (and sweep flag)
		//of those elements that are below the horizontal line
		var newStart = endLoc.exec( newArc )[1];
		var newEnd = startLoc.exec( newArc )[1];
		var middleSec = middleLoc.exec( newArc )[1];
		
		//Build up the new arc notation, set the sweep-flag to 0
		newArc = "M" + newStart + "A" + middleSec + "0 0 0 " + newEnd;
	}//if
	
	//Create a new invisible arc that the text can flow along
	svg.append("path")
		.attr("class", "hiddenDonutArcs")
		.attr("id", "donutArc"+i)
		.attr("d", newArc)
		.style("fill", "none");
});
	
//Append the label names on the outside
svg.selectAll(".outsideText")
	.data(pie(donutData))
   .enter().append("text")
	.attr("class", "outsideText")
	//Move the labels below the arcs for those slices with an end angle greater than 90 degrees
	.attr("dy", function(d,i) { return (d.endAngle > 90 * Math.PI/180 ? 36 : -26); })
   .append("textPath")
	.attr("startOffset","50%")
	.style("text-anchor","middle")
	.attr("xlink:href",function(d,i){return "#donutArc"+i;})
	.text(function(d){return d.data.name;});

svg.selectAll(".insideText")
	.data(pie(insidedonutData))
   .enter().append("text")
	.attr("class", "insideText")
	//Move the labels below the arcs for those slices with an end angle greater than 90 degrees
	.attr("dy", function(d,i) { return (d.endAngle > 90 * Math.PI/180 ? -20 : 30); })
   .append("textPath")
	.attr("startOffset","50%")
	.style("text-anchor","middle")
	.attr("xlink:href",function(d,i){return "#donutArc"+i;})
	.html(function(d){return d.data.name});
</script>
<body>


<h3>Behavior Traits </h3>
	<div id="behaviourchart"></div>
    
</body>
</html>