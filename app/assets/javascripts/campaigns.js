// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(function(){
	$('#new_campaign .next_button').click(function(){
    $('form.new_campaign').trigger('submit', true);
		$(this).closest('.form-step').addClass('hide').next().removeClass('hide');
		$('#new_campaign .steps .ui.step.active').removeClass('active').addClass('done').next().addClass('active');
	});


	$('#new_campaign .prev_button').click(function(){
    $('form.new_campaign').trigger('submit', true);
		$(this).closest('.form-step').addClass('hide').prev().removeClass('hide');
		$('#new_campaign .steps .ui.step.active').removeClass('active').addClass('done').prev().addClass('active');
	});

  $('form.new_campaign').submit(function(e, nosubmit){
    if( nosubmit == true ){
      e.preventDefault();
    }
  });

});
