Rails.application.routes.draw do
  root 'articles#index'
  resources :articles do
    member do
      get 'like'
    end
    resources :texts
    resources :images
  end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
