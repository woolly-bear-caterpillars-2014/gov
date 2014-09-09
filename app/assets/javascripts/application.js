//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require underscore
//= require states
//= require gmaps/google
//= require gmaps
//= require d3
//= require congress_people

$(document).ready(function() {

	$('grab-states').hasClass("map-area"), getRepubDemCount();
	$('grab-states').hasClass("gmap-area"), generateTweetMap();
	getSentimentAnalysis();

});
