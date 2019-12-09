//Create group element
var g = svg.append("g");

//Create and append ellipse element into group
var box = g.append("rect")
            .attr("x", 0)
            .attr("y", 10)
            .attr("width", 210)
            .attr("height", 40)
            .attr("fill", "#69b3a2");

//Create and append text element into group
g.append("text")
 .attr("x", 5)
 .attr("y", 35)
 .style("font-size", "2rem")
 .text("Confidence Interval");
 
 
 var circle = g.append("circle")
                .attr("cx", 20)
                .attr("cy", 75)
                .attr("r", 10)
                .style("fill", "#09101e")
                .append("text");
  
g.append("text")
 .attr("x", 50)
 .attr("y", 82)
 .style("font-size", "2rem")
 .text("Estimated mean");
          
