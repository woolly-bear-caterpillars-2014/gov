function generateCongressProfileListeners() {
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
}
