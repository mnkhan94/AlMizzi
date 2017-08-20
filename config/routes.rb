Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  resources :hadith_collections
  resources :hadith_books
  resources :hadith_chapters

  resources :narrations
  resources :narrators

  get '/reset/:id' => 'narrations#reset_narration'
  post '/bulker' => 'narrations#bulker'
  post '/remove_narrator' => 'narrations#remove_narrator'

  get '/hadith_chapters/:hadith_book_id/new' => 'hadith_chapters#new'

  get '/hadith_books/:hadith_collection_id/new' => 'hadith_books#new'

  get '/test/bukhari/:link' => 'pages#test_bukhari'

  get '/test/bukhari/narrator/:search' => 'pages#test_bukhari_narrators'

  get '/test/muslim/:link' => 'pages#test_bukhari'

  root 'pages#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
