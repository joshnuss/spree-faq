class SpreeFaqHooks < Spree::ThemeSupport::HookListener
  insert_bottom :admin_tabs do
    "<%=  tab(:question_categories, :label => :question_categories_admin) %>"
  end
end

