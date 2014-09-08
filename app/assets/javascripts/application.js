//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require underscore
//= require gmaps/google

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

  generate_sly();
  getRepubDemCount();
});

// function generateArticles() {
//   e.preventDefault;


// }

//     buttonSubmit = $('button[name=submit_feedback]'),
//     submit = $('#submitFeedback'),
