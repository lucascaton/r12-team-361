BabyCasts::Application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'babycasts_omniauth_callbacks' }

  resources :videos, only: [:index, :show] do
    collection { post 'results' }
  end

  root to: 'videos#index'
end
