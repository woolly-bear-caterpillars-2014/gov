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
//= require d3
//= require congress_people



//= require sly

$(document).ready(function() {
  var $buttonEmail = $('button[name=email]'),
      $email = $('congress-email'),

      $buttonArticle = $('button[name=articles]'),
      $buttonBill = $('button[name=bills]'),

      $articles = $('#congress-articles'),
      $bills = $('#congress-bills');


  $buttonArticle.on('click', articleButtonToggle)
  $buttonBill.on('click', billButtonToggle)
  $buttonEmail.on('click', emalButtonAccordian)

  function articleButtonToggle() {
    console.log('hi');
    $bills.fadeOut('fast');
    $articles.fadeIn('fast');
  }

  function billButtonToggle() {
    console.log('there');
    $articles.fadeOut('fast');
    $bills.fadeIn('fast');
  }

  function emalButtonAccordian() {
    $(this).next().slideToggle('fast');
  }

  generate_sly();

	$('grab-states').hasClass("map-area", getRepubDemCount());
	$('grab-states').hasClass("gmap-area", generateTweetMap());
	getSentimentAnalysis();
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
