//= require d3
var numC = 9;
var data = d3.range(numC);

var showColourInterpolations = function(name, cbMap) {
    var rectHeight = 50,
        w = 960;
    
    var chart = d3.select("#chart");
    chart.append('h4').text(name);

    var svg=chart.append("svg");

    var x = d3.scale.ordinal()
        .domain(data)
        .rangeRoundBands([0, w], 0.1);

    var colour = d3.scale.linear()
        .domain(d3.extent(data))
        .range([cbMap[numC][0], cbMap[numC][numC - 1]]);



    var addScale = function (y, colourFunc, name) {
        svg.append('text').attr("x", x(0)).attr("y", y-15).text(name);

        var textrectg = svg.append('g').selectAll("g")
            .data(data)
        .enter().append("g")
            .attr("transform", function(d) { return "translate(" + x(d) + "," + y + ")"; });
            
        textrectg.append("rect")
                //.attr("x", function(d) {return x(d); })
                //.attr("y", y)
                .attr("width", x.rangeBand())
                .attr("height", rectHeight)
                .attr("fill", colourFunc );

        textrectg.append("text")
                .text(colourFunc);
    }

    var colourBrewer = function (d) {
        return cbMap[numC][d];
    }
    // https://github.com/mbostock/d3/wiki/Transitions#wiki-d3_interpolateLab
    var colourLab = colour.copy().interpolate(d3.interpolateLab);
    // https://github.com/mbostock/d3/wiki/Transitions#wiki-d3_interpolateHcl
    var colourHcl = colour.copy().interpolate(d3.interpolateHcl);
    // https://github.com/mbostock/d3/wiki/Transitions#wiki-d3_interpolateRgb
    var colourRgb = colour.copy().interpolate(d3.interpolateRgb);
    // https://github.com/mbostock/d3/wiki/Transitions#wiki-d3_interpolateHsl
    var colourHsl = colour.copy().interpolate(d3.interpolateHsl);

    var cfuncs = [['brewer', colourBrewer], 
              ['L*a*b*', colourLab], 
              ['HCL', colourHcl],
              ['RGB', colourRgb], 
              ['HSL', colourHsl]];

    for (var i = 0; i < cfuncs.length; i++) {
        addScale(30 + i * (rectHeight + 30), cfuncs[i][1], cfuncs[i][0]);
    }
}

mapNames = ['Blues', 'Greens', 'Oranges', 'Purples', 'Reds'];
mapNames.forEach(function (mapName) {showColourInterpolations(mapName, colorbrewer[mapName]); });