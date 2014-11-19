Rails.application.routes.draw do
  resources :posts do
    resources :images
  end

  root to: 'posts#index'
  get '/index_admin' => 'posts#index_admin'
  get '/posts/:post_id/images/:id' => 'images#show'
end
