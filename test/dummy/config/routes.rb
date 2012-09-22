Dummy::Application.routes.draw do
  get "user_info" => "home#user_info"
  get "logout" => "home#logout"
  root :to => "home#index"
end
