Peppermill::Application.routes.draw do

  get "robots.txt" => "application#robots"

  root to: "application#index"

  namespace :api do
    namespace :v1 do
      root to: 'api#index'
    end
  end
end
