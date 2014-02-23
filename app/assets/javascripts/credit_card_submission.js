$(function(){
	var marketplaceUri = '/v1/marketplaces/TEST-MP5SfoEAaHHoGv3gPnhi5zxU';
	var requestBinUrl = '/store_credit_card'


	var debug = function(tag, content) {
	  $('<' + tag + '>' + content + '</' + tag + '>').appendTo('#result');
	};

	try {
		balanced.init(marketplaceUri);
	} catch (e) {
		debug('code', 'balanced.init error!');
	}

	function balancedCallback(response) {
		var tag = (response.status < 300) ? 'pre' : 'code';
		debug(tag, JSON.stringify(response));
		switch(response.status) {
			case 201:
				console.log(response.data);
				var $form = $("#credit-card-form");
				var card_token_uri = response.data['uri'];
				$('<input>').attr({
					type: 'hidden',
					value: card_token_uri,
					name: 'balancedCreditCardURI'
				}).appendTo($form);
				$form.attr({action: requestBinUrl});
				$form.get(0).submit();
				break;
			case 400:
				console.log(response.error);
				break;
			case 404:
				console.log(response.error);
				break;
		}
	}

	var tokenizeCreditCard = function(e) {
		e.preventDefault();

		var $form = $('#credit-card-form');
		var creditCardData = {
			card_number: $form.find('.cc-number').val(),
			expiration_month: $form.find('.cc-em').val(),
			expiration_year: $form.find('.cc-ey').val(),
			security_code: $form.find('.cc-csc').val()
		};

		balanced.card.create(creditCardData, balancedCallback);
	};


	$('#credit-card-form').submit(tokenizeCreditCard);
});