FactoryGirl.define do
  factory :question, class: Spree::Question do

    question_category

    sequence(:question) { |n| "question#{n}" }
    answer { generate(:random_description) }
  end
end
