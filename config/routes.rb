BabyCasts::Application.routes.draw do
  resources :videos
  get '/sign_up' => 'sessions#sign_up', as: 'sign_up'

  root to: 'videos#index'
end
