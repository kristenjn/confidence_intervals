// X axis: scale and draw:
  var x = d3.scaleLinear()
  .domain([-4, 4]) 
  .range([0, width]);
  
  var xAxis = d3.axisBottom()
  .scale(x);
  
  svg.append("g")
  .attr("transform", "translate(0," + height + ")")
  .call(xAxis);
  
  // Y axis: initialization
  var y = d3.scaleLinear()
    .range([height, 0]);
  
  var yAxis = svg.append("g")
    .attr("class", "yaxis");

  
function update() {
    // set the parameters for the histogram
    var histogram = d3.histogram()
      .domain(x.domain())  // then the domain of the graphic
      .thresholds(x.ticks(20)); // then the numbers of bins
    
    // And apply this function to data to get the bins
    var bins = histogram(data);
    
    // Y axis: scale and draw:
    y.domain([0, d3.max(bins, function(d) { return d.length; })]);   // d3.hist has to be called before the Y axis obviously
    
    svg.selectAll("yaxis")
      .transition()
      .duration(1000)
      .call(d3.axisLeft(y));
    
    // Join the rect with the bins data
    var u = svg.selectAll("rect")
      .data(bins);
    
    // Manage the existing bars and eventually the new ones:
    u
      .enter()
      .append("rect") // Add a new rect for each new elements
      .merge(u) // get the already existing elements as well
      .transition() // and apply changes to all of them
      .duration(1000)
      .attr("x", 1)
      .attr("transform", function(d) { return "translate(" + x(d.x0) + "," + y(d.length) + ")"; })
      .attr("width", function(d) { return x(d.x1) - x(d.x0) -1 ; })
      .attr("height", function(d) { return height - y(d.length); })
      .style("fill", "#69b3a2");
    
    // If less bar in the new histogram, I delete the ones not in use anymore
    u
    .exit()
    .remove();
  }
  
  update();
  
  svg.style("overflow", "visible");
  