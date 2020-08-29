Rails.application.routes.draw do
  resources :quizzes
  resources :students
  resources :answers
  resources :questions
end
