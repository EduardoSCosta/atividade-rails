Rails.application.routes.draw do
  get 'users' => 'users#index'
  post 'users' => 'users#create'
  get 'users/new' => 'users#new', as: 'user_new'
  patch 'users/:id' => 'users#update'
  # get 'users/destroy'
  get 'users/:id/edit'  => 'users#edit', as: 'user_edit'
  get 'users/:id' => 'users#show', as: 'user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
