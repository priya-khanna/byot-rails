Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    # get '/talks' => 'talks#index', as: 'talks'
    # get '/talks/new' => 'talks#new', as: 'new_talk'
    # post '/talks' => 'talks#create', as: 'create_talk'

    get '/submissions' => 'submissions#index'

    get '/byot_schedules/latest' => 'byot_schedules#latest'
    resources :byot_schedules
    resources :talks

    post '/votes' => "votes#create", as: 'create_vote'
    delete '/votes' => "votes#delete", as: 'delete_vote'
  end

  get '/about' => 'home#about'
  root to: 'home#index'
end
