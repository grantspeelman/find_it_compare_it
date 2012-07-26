FindItCompareIt::Application.routes.draw do

  resources :boards do
    resources :items
    resources :board_test_features, :path => 'test_features'
  end

  resources :users
  resources :items, :path => "iframe/items", :only => [:new, :create, :index], :defaults => {:iframe => true}

  #resources :cards do
  #  collection do
  #    get 'search'
  #  end
  #end

  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'

  match '/iframe/login', :to => 'sessions#new', :defaults => {:iframe => true}
  match '/login', :to => 'sessions#new'
  match '/logout', :to => 'sessions#destroy'

  match '/dashboard', :to => 'home#dashboard'

  root :to => "home#index"

end
