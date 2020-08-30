Rails.application.routes.draw do
  resources :quizzes do
    member do
      get 'leaderboard'
    end
  end
  resources :students
  resources :answers
  resources :questions
end
