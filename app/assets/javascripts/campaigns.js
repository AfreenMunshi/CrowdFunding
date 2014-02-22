// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(function(){
	$('#new_campaign .next_button').click(function(){
		$(this).closest('.form-step').addClass('hide').next().removeClass('hide');
		$('#new_campaign .steps .ui.step.active').removeClass('active').addClass('done').next().addClass('active');
	});
});