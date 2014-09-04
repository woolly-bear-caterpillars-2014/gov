// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
console.log("hi");
  $.ajax({
      url: '/fedregs',
      type: 'get',
      data: {},
      dataType: "json"
  }).done(function(data) {


      var dataObject = {
        "timeline": {
          "headline":"The Main Timeline Headline Goes here",
          "type":"default",
          "text":"<p>Intro body text goes here, some HTML is ok</p>",
          "asset": {
            "media":"http://twitter.com/ArjunaSoriano/status/164181156147900416",
            "credit":"Credit Name Goes Here",
            "caption":"Caption text goes here"
          },
          "date": [
              {
                  "startDate":"2013,12,10",
                  "endDate":"2013,12,10",
                  "headline": data[0].title,
                  "text":"<p>" + data[0].abstract +"</p>",
                  "tag":"This is Optional",
                  "classname":"optionaluniqueclassnamecanbeaddedhere",
                  "asset": {
                      "media":"http://twitter.com/ArjunaSoriano/status/164181156147900416",
                      "thumbnail":"optional-32x32px.jpg",
                      "credit":"Credit Name Goes Here",
                      "caption":"Caption text goes here"
                  }
              }
          ],
          "era": [
            {
              "startDate":"2012,12,10",
              "endDate":"2014,12,11",
              "headline":"Headline Goes Here",
              "text":"<p>Body text goes here, some HTML is OK</p>",
              "tag":"This is Optional"
            }
          ]
        }
      }

    createStoryJS({
      type:       'timeline',
      width:      '800',
      height:     '600',
      source:     dataObject,
      embed_id:   'my-timeline'
    });
  })
});