class Question < ActiveRecord::Base
  belongs_to :question_category
  acts_as_list 

  validates_presence_of :question_category_id, :question, :answer
end
