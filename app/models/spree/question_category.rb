class Spree::QuestionCategory < ActiveRecord::Base
  acts_as_list

  has_many :questions, class_name: 'Spree::Question'

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :questions, allow_destroy: true
end
