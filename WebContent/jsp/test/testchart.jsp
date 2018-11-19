<!DOCTYPE html>

<meta charset="utf-8">
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css">
<link rel="stylesheet" href="../../css/radar-chart.css">

<style>
body {
  padding: 20px;
}
</style>

<style>
.radar-chart .area {
  fill-opacity: 0.7;
}
.radar-chart.focus .area {
  fill-opacity: 0.3;
}
.radar-chart.focus .area.focused {
  fill-opacity: 0.9;
}
.area.germany, .germany .circle {
  fill: #FFD700;
  stroke: none;
}
.area.argentina, .argentina .circle {
  fill: #ADD8E6;
  stroke: none;
}
</style>

<script src="http://d3js.org/d3.v3.js"></script>
<script src="../../js/radar-chart.js"></script>

<script>
RadarChart.defaultConfig.color = function() {};
RadarChart.defaultConfig.radius = 3;
</script>

<h1>Radar Chart</h1>
<p>A reusable radar chart implementation in D3.js</p>

<script>
var data = [
  {
    className: 'germany', // optional can be used for styling
    axes: [
      {axis: "strength", value: 13}, 
      {axis: "intelligence", value: 6}, 
      {axis: "charisma", value: 5},  
      {axis: "dexterity", value: 9},  
      {axis: "luck", value: 2},
	  {axis: "blessed", value: 12}
    ]
  },
  {
    className: 'argentina',
    axes: [
      {axis: "strength", value: 10}, 
      {axis: "intelligence", value: 7}, 
      {axis: "charisma", value: 10},  
      {axis: "dexterity", value: 13},  
      {axis: "luck", value: 9}
    ]
  }
];
function randomDataset() {
  return data.map(function(d) {
    return {
      className: d.className,
      axes: d.axes.map(function(axis) {
        return {axis: axis.axis, value: Math.ceil(Math.random() * 10)};
      })
    };
  });
}
</script>

<h2>Reusable D3 API</h2>
<script>
var chart = RadarChart.chart();
var cfg = chart.config(); // retrieve default config
var svg = d3.select('body').append('svg')
  .attr('width', cfg.w)
  .attr('height', cfg.h + cfg.h / 4);
svg.append('g').classed('single', 1).datum(randomDataset()).call(chart);

// many radars
chart.config({w: cfg.w / 4, h: cfg.h / 4, axisText: false, levels: 0, circles: false});
cfg = chart.config();
function render() {
  var game = svg.selectAll('g.game').data(
    [
      randomDataset(),
      randomDataset(),
      randomDataset(),
      randomDataset()
    ]
  );
  game.enter().append('g').classed('game', 1);
  game
    .attr('transform', function(d, i) { return 'translate('+(i * cfg.w)+','+ (cfg.h * 4) +')'; })
    .call(chart);

  setTimeout(render, 1000);
}
render();
</script>

<script>
</script>

<!-- 아래의 차트만 사용하기로. -->
<h2>Simple single chart drawing</h2>
<h3>No lines, only ticks</h3>
<div class="chart-container"></div>
<script>
RadarChart.defaultConfig.levelTick = true;
RadarChart.draw(".chart-container", data);
</script>
