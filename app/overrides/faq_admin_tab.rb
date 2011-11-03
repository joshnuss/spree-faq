Deface::Override.new(:virtual_path => "layouts/admin",
                     :name => "faq_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => "<%= tab(:question_categories, :label => :question_categories_admin) %>")
