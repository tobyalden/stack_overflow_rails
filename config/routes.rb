Rails.application.routes.draw do
  get '/' => 'home#index'
  
  resources :users do
    resources :questions
  end

  get '/log-in' => 'sessions#new'
  post '/log-in' => 'sessions#create'
  delete '/log-out' => 'sessions#destroy', as: :log_out

end
