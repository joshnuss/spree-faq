class RenameQuestionsToSpreeQuestions < ActiveRecord::Migration
  def change
    rename_table :questions, :spree_questions
  end
end