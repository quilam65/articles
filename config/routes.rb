Rails.application.routes.draw do
  root 'articles#index'
  get 'private_article', to: :private_article, controller: 'articles'
  resources :articles do
    member do
      get 'like'
    end

    resources :texts do
      member do
        get 'like'
      end
    end

    resources :images do
      member do
        get 'like'
      end
    end
    
  end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
