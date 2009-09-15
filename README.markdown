Spree Frequently Asked Question Extension
=========

An spree extension for managing FAQs

Installation
============

To install the extension use this command:

script/extension install git://github.com/joshnuss/spree-faq.git

rake db:migrate

rake spree:extensions:faq:update

Viewing FAQs
============

http://yourdomain.tld/faqs

Editing FAQs
===========

1. Login to Administraton Console
2. Click on Configuration 
3. Click on the Frequently Asked Questions link

Loading Sample FAQs
=============

rake spree:extensions:faq:load_samples
