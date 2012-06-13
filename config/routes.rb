AddressApplication::Application.routes.draw do
  resources :addresses

  root :to => 'application#index'
end
