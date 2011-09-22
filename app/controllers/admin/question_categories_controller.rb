class Admin::QuestionCategoriesController < Admin::BaseController
  resource_controller

  helper 'spree/base'

  new_action.response do |format|
    format.html 
    format.js
  end
  update.response do |format|
    format.html { redirect_to admin_question_categories_path }
  end
  create.response do |format|
    format.html { redirect_to edit_admin_question_category_path(@question_category) }
  end
end
