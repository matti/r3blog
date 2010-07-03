R3blog::Application.routes.draw do |map|

  match 'posts.:format' => 'feed#show', :as => :feed
  
  resources :posts do
    resources :comments
  end
  
  
  namespace :admin do
    resources :posts do
      get :toggle_publish, :on => :member
    end
  end
  
  root :to => "posts#index"
end
