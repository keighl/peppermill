Peppermill::Application.routes.draw do

  get "robots.txt" => "application#robots"

  root to: "application#index"

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      root to: 'api#index'
      resources :todos
    end
  end
end
