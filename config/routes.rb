Peppermill::Application.routes.draw do

  get "robots.txt" => "application#robots"

  root :to => "application#index"

end
