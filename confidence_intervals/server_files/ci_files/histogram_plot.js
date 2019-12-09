// X axis: scale and draw:
var x = d3.scaleLinear()
    .domain([0, 1000])     // can use this instead of 1000 to have the max of data: d3.max(data, function(d) { return +d.price })
    .range([0, width]);
    svg.append("g")
    .attr("transform", "translate(0," + height + ")")
    .call(d3.axisBottom(x));

// Y axis: scale and draw:
var y = d3.scaleLinear()
    .range([height, 0]);
    y.domain([0, d3.max(bins, function(d) { return d.length; })]);   // d3.hist has to be called before the Y axis obviously
    svg.append("g")
    .call(d3.axisLeft(y));
    
 // set the parameters for the histogram
var histogram = d3.histogram()
    .value(function(d) { return d.price; })   // I need to give the vector of value
    .domain(x.domain())  // then the domain of the graphic
    .thresholds(x.ticks(70)); // then the numbers of bins

// And apply this function to data to get the bins
    var bins = histogram(data);

    
    
    
    