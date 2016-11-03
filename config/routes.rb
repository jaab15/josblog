Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get  '/'        => 'home#index'
  get  '/about'   => 'home#about'
  get  '/posts/page/:page'     => 'posts#pagination', as: :pagination
  get  '/posts/search/:page'   => 'posts#search', as: :search

  resources :posts  do
       resources :comments
  end

  resources :categories
  resources :contacts

end