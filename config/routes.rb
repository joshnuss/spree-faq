map.resources :faq, :controller => 'faqs'

map.namespace :admin do |admin|
  admin.resources :question_categories
end
