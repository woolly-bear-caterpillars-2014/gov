//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require underscore
//= require states
//= require raphael-min
//= require jquery-mapael
//= require usa_states
//= require gmaps/google
//= require gmaps
//= require sly

$(document).ready(function() {
  var $frame = $("#frame")
  $('.slidee li').on('click', '.senator-card-democrat', function() {
    // console.log();

    if ( $frame.css("height") == "160px") {
      $(this).next().fadeIn('fast');
      // $(".article").not($(this).next()).fadeOut('fast');
      $("#frame").animate({ height: '400px' });

    } else {
      $(".article").fadeOut('fast');
      $("#frame").animate({ height: '160px' });
    }
  })

  $('.slidee li').on('click', '.senator-card-republican', function() {
    // console.log('hi');
    if (event.target.nodeName != 'BUTTON') {
      $(this).next().slideToggle('fast');
      $(".boo").html('<p>What is going on</p>');
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
