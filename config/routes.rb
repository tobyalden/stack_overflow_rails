Rails.application.routes.draw do
  root :to => 'home#index'

  get '/log-in' => 'sessions#new'
  post '/log-in' => 'sessions#create'
  delete '/log-out' => 'sessions#destroy', as: :log_out

  resources :users do
    resources :questions
  end

  resources :questions do
    resources :answers
  end
end
