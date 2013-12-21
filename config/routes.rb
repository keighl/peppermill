Peppermill::Application.routes.draw do

  get "robots.txt" => "application#robots"

  root to: "application#index"

  namespace :api, defaults: { format: 'json' } do

    namespace :v1 do
      root to: 'api#index'

      resources :todos

      get 'me' => 'users#me'
      put 'me' => 'users#update'

      resources :users, only: [:create] do
        post :login, on: :collection
      end
    end
  end
end
