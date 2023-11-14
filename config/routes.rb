Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # verb '/path', to: controller_name_in_plural#action, as: :prefix

  # SEE ALL RESTAURANTS (READ ALL)
  get '/restaurants', to: 'restaurants#index', as: :restaurants

  # RECEIVE THE FORM SUBMISSION
  post '/restaurants', to: 'restaurants#create'

  # CREATE 2-STEP
  # DISPLAY THE FORM
  get '/restaurants/new', to: 'restaurants#new', as: :new_restaurant


  # UPDATE
  # DISPLAY THE FORM
  get '/restaurants/:id/edit', to: 'restaurants#edit', as: :edit_restaurant


  # SEE DETAILS ABOUT ONE (READ ONE)
  get '/restaurants/:id', to: 'restaurants#show', as: :restaurant

  # RECEIVE THE FORM SUBMISSION
  patch '/restaurants/:id', to: 'restaurants#update'

  # DELETE A RESTAURANT
  delete '/restaurants/:id', to: 'restaurants#destroy'

  # resources :restaurants => this will generate all the 7 routes above
end
