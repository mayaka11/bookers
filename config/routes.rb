Rails.application.routes.draw do
  get '/' => 'books#top'
  post 'books' => 'lists#create'
  get 'books' => 'lists#index'
  get 'books/:id' => 'lists#show', as: 'list'
  get 'books/:id/edit' => 'lists#edit', as: 'edit_list'
  delete 'books/:id' => 'lists#destroy', as: 'destroy_list'
  patch 'books/:id' => 'lists#update',as: 'update_list'
end