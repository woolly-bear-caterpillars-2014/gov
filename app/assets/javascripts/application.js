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
//= require d3.layout.cloud
//= require congress_people
//= require sly

$(document).ready(function() {
  var $buttonEmail = $('button[name=email]'),
      $email = $('congress-email'),

      $buttonArticle = $('button[name=articles]'),
      $buttonBill = $('button[name=bills]'),

      $articles = $('#congress-articles'),
      $bills = $('#congress-bills'),
      $btn = $('.btn'),

      $congressContent = $('.congress-content');


  $buttonArticle.on('click', articleButtonToggle)
  $buttonBill.on('click', billButtonToggle)
  $buttonEmail.on('click', emailButtonAccordian)
  $btn.on('click', toggleButtons);

  function toggleButtons() {
    $btn.not(this).removeClass('btnactive');
    $(this).toggleClass('btnactive');
  }

  function articleButtonToggle() {
    $('html,body').animate({scrollTop: $congressContent.offset().top - 60}, 'slow');
    $bills.fadeOut('fast');
    $articles.fadeIn('fast');
  }

  function billButtonToggle() {
    $('html,body').animate({scrollTop: $congressContent.offset().top - 60}, 'slow');
    $articles.fadeOut('fast');
    $bills.fadeIn('fast');
  }

  function emailButtonAccordian() {
    $(this).next().slideToggle('fast');
  }

  generate_sly();
  if ($('.state-map').size() > 0) {
    getRepubDemCount();
  }

  if ($('.gmap-area').size() > 0) {
    generateTweetMap();
  }

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

