class RenameQuestionCategoriesToSpreeQuestionCategories < ActiveRecord::Migration
  def change
    rename_table :question_categories, :spree_question_categories
  end
end