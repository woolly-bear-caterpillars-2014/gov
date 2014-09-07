//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require underscore
//= require gmaps/google

$(document).ready(function() {
  generate_map();
  generate_sly();
  // $form = $

  $.ajax('/states', {
    type: 'GET',
    dataType: 'json'
  }).done(function(response) {

    console.log(response);
  })

});

function getRepubDemCount() {

}
