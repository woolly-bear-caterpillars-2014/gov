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
//= require underscore
//= require gmaps/google

$(document).ready(function() {
  console.log('hi');

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
    startAt: 0,
    keyboardNavBy: 'horizontal'
  });
});
