Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount API => '/'

  post 'client_token' => 'client_token#create'
end
