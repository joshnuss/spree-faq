# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class FaqExtension < Spree::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/spree_faq"

  # Please use spree_faq/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate
    # admin.tabs.add "Spree Faq", "/admin/spree_faq", :after => "Layouts", :visibility => [:all]
  end

end

Admin::ConfigurationsController.class_eval do
  before_filter :add_faq_links, :only => :index
  def add_faq_links
    @extension_links << {:link => admin_question_categories_path, 
                         :link_text => "Frequently Asked Questions", 
                         :description => "Add,edit or remove FAQ categories and questions"}
  end
end
