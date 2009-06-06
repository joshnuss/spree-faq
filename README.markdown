== Spree Faq

An spree extension for managing FAQs

== Installation

To install the extension use this command:

script/extension install git://github.com/joshnuss/spree_faq.git

Next you need to copy some resources to your public folder:

rake spree:extensions:spree_faq:update

== Editing FAQs

1. Login to Administraton Console
2. Click on Configuration 
3. Click on the Frequently Asked Questions link

== Loading Sample FAQs

rake spree:extensions:spree_faq:load_samples
