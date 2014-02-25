
the first commit is there

git status

for more u just need to do 
git add <somthing> OR git rm <filenames>
and 
git commit -m 'some message'
and

git push origin master
or
git push -u origin master

hiberating



http://zamboni.readthedocs.org/en/latest/topics/install-zamboni/vagrant-on-windows.html

﻿https://docs.balancedpayments.com/1.1/overview/resources/
https://docs.balancedpayments.com/1.1/guides/quickstart/charging-funding-instruments/

card = Balanced::Card.find balanced_card_uri

card.debit(
  :amount => 5000,
  :appears_on_statement_as => 'Statement text',
  :description => 'Some descriptive text for the debit in the dashboard'
)

﻿https://docs.balancedpayments.com/1.1/guides/quickstart/charging-funding-instruments/

Balanced::Marketplace.mine.in_escrow # will have increased by 5000