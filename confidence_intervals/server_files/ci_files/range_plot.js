// X axis: scale and draw:
  var x = d3.scaleLinear()
  .range([0, width])
  .domain([data[2]-0.75, data[2]+0.75]);
  //.domain([-5,5]);
  
  var xAxis = svg.append("g")
  .attr("transform", "translate(0," + height + ")")
  .attr("class", "xaxis")
  .call(d3.axisBottom(x));
  
  svg.selectAll("xaxis")
    .transition()
    .duration(1000)
    .call(d3.axisBottom(x));

// Add Y axis
  var y = d3.scaleLinear()
    .domain([-1, 1.5])
    .range([ height, 0]);
  //svg.append("g")
  //  .call(d3.axisLeft(y));

  var ci_area = r2d3.svg.selectAll(".range")
      .data(r2d3.data);
  
  ci_area.enter()
    .append("rect")
      .attr("x", x(data[0]))
      .attr("y", y(0.6))
      .attr("width", x(data[1]) - x(data[0]))
      .attr("height", height/2)
      .style("fill", "#69b3a2")
      .style("opacity", 0.5)
      .attr("class", "range");
    
  ci_area.exit().remove();
    
  ci_area.transition()
  .duration(1000)
  .attr("x", x(data[0]))
  .attr("width", x(data[1]) - x(data[0]));
  
  var population = r2d3.svg.selectAll(".pop")
  .data(r2d3.data);
  
  //population.enter()
  //  .append("circle")
  //    .attr("cx", x(data[2]))
  //    .attr("cy", y(0))
  //    .attr("r", 20)
  //    .style("fill", "green")
  //    .attr("class", "pop");

  population.enter()
      .append("line")
        .attr("x1", x(data[2]))
        .attr("y1", y(-1))
        .attr("x2", x(data[2]))
        .attr("y2", y(1))
        .attr("stroke", "#000")
        .attr("stroke-width", "3px")
        .attr("class", "pop");

population.enter()
         .append("text")
         .attr("x", x(0))
         .attr("y", y(1+0.2))
         .style("font-size", "1.8rem")
         .text("Population mean");
  
  population.exit().remove();

  population.transition()
  .duration(1000)
  .attr("x1", x(data[2]))
  .attr("x2", x(data[2]));
  
  var sample = r2d3.svg.selectAll(".samp")
  .data(r2d3.data);
  
  sample.enter()
    .append("circle")
      .attr("cx", x(data[3]))
      .attr("cy", y(0))
      .attr("r", 15)
      .style("fill", "#09101e")
      .attr("class", "pop");

  sample.exit().remove();

  sample.transition()
  .duration(1000)
  .attr("cx", x(data[3]));
  
  
  svg.style("overflow", "visible");