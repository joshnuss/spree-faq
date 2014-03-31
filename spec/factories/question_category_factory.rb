FactoryGirl.define do
  factory :question_category, class: Spree::QuestionCategory do

    sequence(:name) { |n| "category#{n}" }
  end
end
