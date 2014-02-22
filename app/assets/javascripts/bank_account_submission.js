$(function(){
	var marketplaceUri = '/v1/marketplaces/TEST-MP5SfoEAaHHoGv3gPnhi5zxU';
	var requestBinUrl = '/store_bank_account'
	 
	var debug = function(tag, content) {
	  $('<' + tag + '>' + content + '</' + tag + '>').appendTo('#result');
	  console.log(content)
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
				var $form = $("#bank-account-form");
				var bank_account_uri = response.data['uri'];
				$('<input>').attr({
					type: 'hidden',
					value: bank_account_uri,
					name: 'balancedBankAccountURI'
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
	 
	var tokenizeBankAccount = function(e) {
		e.preventDefault();
	 
		var $form = $('#bank-account-form');
		var bankAccountData = {
			name: $form.find('.ba-name').val(),
			account_number: $form.find('.ba-an').val(),
			bank_code: $form.find('.ba-rn').val(),
			type: $form.find('select').val()
		};
	 
		balanced.bankAccount.create(bankAccountData, balancedCallback);
	};
 

	$('#bank-account-form').submit(tokenizeBankAccount);
});