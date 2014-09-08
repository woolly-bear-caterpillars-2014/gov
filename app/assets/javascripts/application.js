//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require underscore
//= require states
//= require gmaps/google
//= require gmaps
//= require sly

$(document).ready(function() {
  $('.slidee li').on('click', '.senator-card-democrat', function() {
    if (event.target.nodeName != 'BUTTON') {
      $(this).next().slideToggle('fast');
      $(".article").not($(this).next()).slideUp('fast');
    }
  })

  $('.slidee li').on('click', '.senator-card-republican', function() {
    if (event.target.nodeName != 'BUTTON') {
      $(this).next().slideToggle('fast');
      $(".article").not($(this).next()).slideUp('fast');
    }
  })

  generate_sly();

	$('grab-states').hasClass("map-area", getRepubDemCount());
	$('grab-states').hasClass("gmap-area", generateTweetMap());
});

function generate_sly() {
  $('#frame').sly({
    horizontal: 1,
    itemNav: 'centered',
    smart: 1,
    activateOn: 'click',
    scrollBy: 1,
    mouseDragging: 1,
    swingSpeed: 0.2,
    scrollBar: $('.scrollbar'),
    dragHandle: 1,
    speed: 600,
    startAt: 1,
    keyboardNavBy: 'horizontal'
  });
}




  // var $buttonSubmit = $('button[name=submit_feedback]'),
  //     $submit = $('#submitFeedback');
  // var $form = $('form');
  // $form.on('submit', function(e) {
  //   e.preventDefault();
  //   $.ajax('/states', {
  //     method: 'post',
  //     dataType: 'json',
  //     data: $form.serialize()
  //   }).done(function(response) {
  //     console.log(response);
  //   });
  // });
