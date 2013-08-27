function create_map() {
  d3.json("/map.json", function(json) {
    render_map(json);      
  });   
}
function render_map(json) {
  var force = d3.layout.force()
    .nodes(d3.values(json.nodes))
    .links(json.links)
    .size([$('#map').attr('width'), $('#map').attr('height')])
    .linkDistance(30)
    .charge(-100)
    .on("tick", tick)
    .start();

  var svg = d3.select("#map").append("svg:svg");

  svg.append("svg:defs")
    .append("svg:marker")
    .attr("id", "arrow")
    .attr("viewBox", "0 -5 10 10")
    .attr("refX", 15)
    .attr("refY", -1.5)
    .attr("markerWidth", 6)
    .attr("markerHeight", 6)
    .attr("orient", "auto")
    .append("svg:path")
    .attr("d", "M0,-5L10,0L0,5");

  var path = svg.append("svg:g").selectAll("path")
    .data(force.links())
    .enter().append("svg:path")
    .attr("class",  "link")
    .attr("marker-end", "url(#arrow)");

  var circle = svg.append("svg:g").selectAll("circle")
    .data(force.nodes())
    .enter().append("a").attr("xlink:href", function(d) { return d.url; }).append("svg:circle")
    .attr("r", 6)
    .attr("class", function(d) { return d.state; })
    .call(force.drag);

  var text = svg.append("svg:g").selectAll("g")
    .data(force.nodes())
    .enter().append("svg:g");

  // A copy of the text with a thick white stroke for legibility.
  text.append("svg:text")
    .attr("x", 8)
    .attr("y", ".31em")
    .attr("class", "shadow")
    .text(function(d) { return d.name; });

  text.append("svg:text")
    .attr("x", 8)
    .attr("y", ".31em")
    .text(function(d) { return d.name; });

  // Use elliptical arc path segments to doubly-encode directionality.
  function tick() {
    path.attr("d", function(d) {
      var dx = d.target.x - d.source.x,
      dy = d.target.y - d.source.y,
      dr = Math.sqrt(dx * dx + dy * dy);
    return "M" + d.source.x + "," + d.source.y + "A" + dr + "," + dr + " 0 0,1 " + d.target.x + "," + d.target.y;
    });

    circle.attr("transform", function(d) {
      return "translate(" + d.x + "," + d.y + ")";
    });

    text.attr("transform", function(d) {
      return "translate(" + d.x + "," + d.y + ")";
    });
  }
}


$(document).ready(function() {
  if($('#map').length != 0) {
    create_map();
  }
});
