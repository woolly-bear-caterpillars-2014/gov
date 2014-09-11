

var stopWords = /^(i|me|&amp|&amp;|my|myself|we|us|our|ours|ourselves|you|your|yours|yourself|yourselves|he|him|his|himself|she|her|hers|herself|it|its|itself|they|them|their|theirs|themselves|what|which|who|whom|whose|this|that|these|those|am|is|are|was|were|be|been|being|have|has|had|having|do|does|did|doing|will|would|should|can|could|ought|i'm|you're|he's|she's|it's|we're|they're|i've|you've|we've|they've|i'd|you'd|he'd|she'd|we'd|they'd|i'll|you'll|he'll|she'll|we'll|they'll|isn't|aren't|wasn't|weren't|hasn't|haven't|hadn't|doesn't|don't|didn't|won't|wouldn't|shan't|shouldn't|can't|cannot|couldn't|mustn't|let's|that's|who's|what's|here's|there's|when's|where's|why's|how's|a|an|the|and|but|if|or|because|as|until|while|of|at|by|for|with|about|against|between|into|through|during|before|after|above|below|to|from|up|upon|down|in|out|on|off|over|under|again|further|then|once|here|there|when|where|why|how|all|any|both|each|few|more|most|other|some|such|no|nor|not|only|own|same|so|than|too|very|say|says|said|shall)$/
var data = []

var getSentiment = function() {
  console.log("Hello from Sentiment Analysis!");
  $.ajax('sentiment_visualization', {
    type: 'GET',
    data: 'json',
  }).done(function(response) {
    for( var i=0, l=response.length; i<l; i++) {
      data.push(response[i].sentiment_score);
    };
    var m = [80, 80, 80, 80]; // margins
    var w = 1000 - m[1] - m[3]; // width
    var h = 400 - m[0] - m[2]; // height

    // create a simple data array that we'll plot with a line (this array represents only the Y values, X will just be the index location)

    // X scale will fit all values from data[] within pixels 0-w
    var x = d3.scale.linear().domain([0, data.length]).range([0, w]);
    // Y scale will fit values from 0-10 within pixels h-0 (Note the inverted domain for the y-scale: bigger is up!)
    var y = d3.scale.linear().domain([-10, 10]).range([h, 0]);
      // automatically determining max range can work something like this
      // var y = d3.scale.linear().domain([0, d3.max(data)]).range([h, 0]);

    // create a line function that can convert data[] into x and y points
    var line = d3.svg.line()
      // assign the X function to plot our line as we wish
      .x(function(d,i) {
        // verbose logging to show what's actually being done
        // return the X coordinate where we want to plot this datapoint
        return x(i);
      })
      .y(function(d) {
        // verbose logging to show what's actually being done
        // return the Y coordinate where we want to plot this datapoint
        return y(d);
      })

    var graph = d3.select("#graph").append("svg:svg")
            .attr("width", w + m[1] + m[3])
            .attr("height", h + m[0] + m[2])
          .append("svg:g")
            .attr("transform", "translate(" + m[3] + "," + m[0] + ")");


      // create yAxis
      var xAxis = d3.svg.axis().scale(x).tickSize(-h).tickSubdivide(true);
      // Add the x-axis.
      graph.append("svg:g")
            .attr("class", "x axis")
            .attr("transform", "translate(0," + h + ")")
            .call(xAxis);


      // create left yAxis
      var yAxisLeft = d3.svg.axis().scale(y).ticks(4).orient("left");
      // Add the y-axis to the left
      graph.append("svg:g")
            .attr("class", "y axis")
            .attr("transform", "translate(-25,0)")
            .call(yAxisLeft);
            
    graph.append("svg:path").attr("d", line(data));

    graph.append("text")
    .attr("class", "x label")
    .attr("text-anchor", "end")
    .attr("x", w)
    .attr("y", h)
    .text("TWEETS");

    graph.append("text")
    .attr("class", "y label")
    .attr("text-anchor", "end")
    .attr("y", 0)
    .attr("dy", "-.55em")
    .attr("transform", "rotate(-90)")
    .text("SENTIMENT  SCORE");
});


};



var stopWords = /^(i|&amp|&amp;|me|my|myself|we|us|our|ours|ourselves|you|your|yours|yourself|yourselves|he|him|his|himself|she|her|hers|herself|it|its|itself|they|them|their|theirs|themselves|what|which|who|whom|whose|this|that|these|those|am|is|are|was|were|be|been|being|have|has|had|having|do|does|did|doing|will|would|should|can|could|ought|i'm|you're|he's|she's|it's|we're|they're|i've|you've|we've|they've|i'd|you'd|he'd|she'd|we'd|they'd|i'll|you'll|he'll|she'll|we'll|they'll|isn't|aren't|wasn't|weren't|hasn't|haven't|hadn't|doesn't|don't|didn't|won't|wouldn't|shan't|shouldn't|can't|cannot|couldn't|mustn't|let's|that's|who's|what's|here's|there's|when's|where's|why's|how's|a|an|the|and|but|if|or|because|as|until|while|of|at|by|for|with|about|against|between|into|through|during|before|after|above|below|to|from|up|upon|down|in|out|on|off|over|under|again|further|then|once|here|there|when|where|why|how|all|any|both|each|few|more|most|other|some|such|no|nor|not|only|own|same|so|than|too|very|say|says|said|shall)$/

var getWordMap = function() {
  console.log("Hello from WordMap!");
  $.ajax('sentiment_visualization', {
    type: 'POST',
    data: 'json',
  }).done(function(response) {
    var data = [];
    var tweets = [];
    for( var i=0, l=response.length; i<l; i++) {
      if(stopWords.test(response[i].tweet)){
        console.log('no match');
      }
      else
        {tweets.push(response[i].tweet)};
    };
    var inbetween = tweets.reduce(function(a,b){
      return a.concat(b);
    });
    var flattened = []
    console.log(inbetween)

    for(var i=0, l=inbetween.length; i<l; i++){
      if(stopWords.test(inbetween[i])){
        console.log('no maxtch');
      }
      else
        {flattened.push(inbetween[i])};
    };
      var fill = d3.scale.linear()
            .domain([0,1,2,3,4,5,6,10,15,20,100])
            .range(["#08306b", "#08519c", "#2171b5", "#4292c6", "#6baed6", "#9ecae1", "c6dbef", "#08519c"])

    d3.layout.cloud().size([1500, 1500])
      .words(flattened.map(function(d) {
        return {text: d, size: 10 + Math.random() * 90};
      }))
      .padding(5)
      .rotate(0)
      .font("Arial")
      .fontSize(function(d) { return d.size; })
      .on("end", draw)
      .start();

  function draw(words) {
    d3.select("#wordmap").append("svg")
        .attr("width", 1100)
        .attr("height", 1100)
      .append("g")
        .attr("transform", "translate(500,500)")
      .selectAll("text")
        .data(words)
      .enter().append("text")
        .style("font-size", function(d) { return d.size + "px"; })
        .style("font-family", "Arial")
        .style("fill", function(d, i) { return fill(i); })
        .attr("text-anchor", "middle")
        .attr("transform", function(d) {
          return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
        })
        .text(function(d) { return d.text; });
    }

  });

};

$(document).ready(function(){
  // $('body').on('click', 'button[name=vote]', updateVotes);

 $('body').on("click", 'button[name=wordmap]', function(){
    console.log('hi');
    getWordMap();
  });

  $('body').on("click", 'button[name=sentiment]', function(){
    console.log('hi');
    getSentiment();
  });

});
