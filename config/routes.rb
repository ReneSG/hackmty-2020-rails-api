Rails.application.routes.draw do
  resources :quizzes do
    member do
      get 'leaderboard'
      get 'next_question'
      get 'start'
    end
  end
  resources :students
  resources :answers
  resources :questions

  get 'quiz_sessions/:id/results', to: 'quiz_sessions#results'
end
