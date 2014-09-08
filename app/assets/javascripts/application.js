//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require underscore
//= require states
//= require gmaps/google
//= require gmaps
$(document).ready(function() {
  var $buttonSubmit = $('button[name=submit_feedback]'),
      $submit = $('#submitFeedback');

  $('button[name=submit_feedback]').on('submit', function(e) {
    $.ajax($(this).attr('action'), {
      method: 'post',
      dataType: 'json',
      data: $(this).serialize()
    }).done(function(response) {
      console.log(response);
    });

    submit.fadeIn('fast');
  });


	$('grab-states').hasClass("map-area", getRepubDemCount());
	$('grab-states').hasClass("gmap-area"), generateTweetMap();
});

// function generateArticles() {
//   e.preventDefault;


// }

//     buttonSubmit = $('button[name=submit_feedback]'),
//     submit = $('#submitFeedback'),
