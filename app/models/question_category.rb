class QuestionCategory < ActiveRecord::Base
  acts_as_list 

  has_many :questions
  validates_uniqueness_of :name
  validates_presence_of :name

  accepts_nested_attributes_for :questions, :allow_destroy => true
end
