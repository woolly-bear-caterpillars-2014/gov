//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require underscore
//= require states
//= require gmaps/google

$(document).ready(function() {

	$('grab-states').hasClass("map-area", getRepubDemCount());
	$('grab-states').hasClass("gmap-area"), generateTweetMap();

});
