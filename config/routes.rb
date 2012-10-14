BabyCasts::Application.routes.draw do
  root to: 'videos#index'

  devise_for :users, :controllers => { omniauth_callbacks: 'babycasts_omniauth_callbacks' }

  resources :videos, only: [:index, :show, :create] do
    collection do
      post 'results'
    end
  end

  get '/about' => 'pages#about'
end
