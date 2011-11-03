class Question < ActiveRecord::Base
  belongs_to :question_category
  acts_as_list 

  validates :question_category_id, :question, :answer, :presence => true
end
