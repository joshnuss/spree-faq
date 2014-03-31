Deface::Override.new(virtual_path:  "spree/admin/shared/_configuration_menu",
                     name:          "add_faq_configuration_line",
                     insert_bottom: "[data-hook='admin_configurations_sidebar_menu']",
                     text:          "<%= configurations_sidebar_menu_item Spree.t(:question_categories_admin, scope: :spree_faq), admin_question_categories_url %>",
                     disabled:      false)
