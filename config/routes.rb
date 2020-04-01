Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/help', to: 'static_pages#help'
  get  '/home', to: 'static_pages#home'
  get  '/about', to: 'static_pages#about'
  get  '/data', to: 'generation_data#data'
  get  '/new', to: 'generation_data#new'
  get  '/create', to: 'generation_data#create'
  resources :generation_data
end
