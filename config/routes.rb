FindItCompareIt::Application.routes.draw do

  resources :users

  #resources :cards do
  #  collection do
  #    get 'search'
  #  end
  #end

  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'

  match '/login', :to => 'sessions#new'
  match '/logout', :to => 'sessions#destroy'

  match '/me', :to => 'home#me'

  root :to => "home#index"

end
