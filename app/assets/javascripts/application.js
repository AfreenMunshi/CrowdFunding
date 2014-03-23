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
//= require semantic-ui
// require ./lib/googlecharts
//= require select2
//= require zebra-datepicker/core
//= require jquery
//= require campaigns
// require chartkick
// require jquery.rambling.slider
//= require bank_account_submission
//= require credit_card_submission
//= require highcharts

$(function(){
	$('.ui.dropdown').dropdown({
		on: 'hover'
	});
	$('.ui.pop-up').popup();
	$('.ui.checkbox').checkbox();

	$('.ui.message .close.icon').click(function() { $(this).parent().fadeOut(); });

  $('#voteup').click(function(e){
    var $self = $(this);
    $self.addClass('voted');
    $.post($self.parent().attr('vote_path'), function(count){
        $('.vote_counter').text(count);
        setTimeout(function(){
          $self.parent().fadeOut();
        },2000);
    })
      .done(function(){
        console.log('success');
      })
      .fail(function(){
        console.log('error');
      })
  });

  if( $("#card_number").length ){
    $("#card_number").validateCreditCard(function(e) {
        if (e.card_type == null) {
          $(".cards li").removeClass("off");
          $("#card_number").removeClass("valid");
          $(".vertical.maestro").slideUp({duration: 200}).animate({opacity: 0}, {queue: !1,duration: 200});
          return
        }
        $(".cards li").addClass("off");
        $(".cards ." + e.card_type.name).removeClass("off");
        e.card_type.name === "maestro" ? $(".vertical.maestro").slideDown({duration: 200}).animate({opacity: 1}, {queue: !1}) : $(".vertical.maestro").slideUp({duration: 200}).animate({opacity: 0}, {queue: !1,duration: 200});
        var is_valid = e.length_valid && e.luhn_valid;
        is_valid && $('#credit-card-form').submit();
        return is_valid ? $("#card_number").addClass("valid") : $("#card_number").removeClass("valid")
      },
      {accept: ["visa", "visa_electron", "mastercard", "maestro", "amex"]}
    );
  }

});

  $(window).load(function(){
    $('#slider').ramblingSlider({
      // adaptImages: true,
      useLargerImage: false,
      alignBottom: true
    });
  });
