//= require jquery
//= require jquery_ujs
//= require underscore
//= require states
//= require raphael-min
//= require jquery-mapael
//= require usa_states
//= require gmaps/google
//= require gmaps
//= require d3
//= require d3.layout.cloud
//= require congress_people
//= require congress_profile
//= require fb


$(document).ready(function() {


  if ($('.state-map').size() > 0) { getRepubDemCount(); }
  if ($('.gmap-area').size() > 0) { generateTweetMap(); }

  generateCongressProfileListeners();
});

