PublisherPictoricalCom::Application.routes.draw do

  match "/terms-and-conditions", :to => "pages#terms_and_conditions", :as => :terms_and_conditions, :via => :get
  match "/license-agreement", :to => "pages#license_agreement", :as => :license_agreement, :via => :get
  match "/artwork-guidelines", :to => "pages#artwork_guidelines", :as => :artwork_guidelines, :via => :get
  match "/privacy-policy", :to => "pages#privacy_policy", :as => :privacy_policy, :via => :get
  match "/website-disclaimer", :to => "pages#website_disclaimer", :as => :website_disclaimer, :via => :get
  match "/copyright-notice", :to => "pages#copyright_notice", :as => :copyright_notice, :via => :get
  match "/legal", :to => "pages#legal", :as => :legal, :via => :get
  match "/help", :to => "pages#help", :as => :help, :via => :get

  devise_for :users

  match "users/:id/mature", :to => "users#mature"
  match "users/:id/demature", :to => "users#demature"
  match "users/:id/make_admin", :to => "users#make_admin"
  match "users/:id/unmake_admin", :to => "users#unmake_admin"
  match "users/facepic", :to => "users#facepic", :as => :facepic  
  match "users/:id/facepic", :to => "users#facepic", :as => :facepic
  match "users/:id/add_facepic", :to => "users#add_facepic", :as => :add_facepic
  

  resources :users

  match "texts/:id/available", :to => "texts#make_available"
  match "texts/:id/unavailable", :to => "texts#make_unavailable"

  resources :texts

  match "trashes/:id/trashed_destroy", :to => "texts#trashed_destroy", :as => :trashed_destroy
  match "trashes/:id/trashed_undestroy", :to => "texts#trashed_undestroy", :as => :trashed_undestroy
  match "trashes/:id", :to => "texts#trashed_show", :as => :trashed
  match "trashes", :to => "texts#trashed_index", :as => :trashes

  resources :authors
  resources :translators

  match "invitations/reject", :to => "invitations#reject", :as => :reject_artist
  

  resources :invitations

  match "books/change", :to => "books#change", :as => :change_book
  match "books/review", :to => "books#review", :as => :review_book
  match "books/publish/:id", :to => "books#publish"
  match "books/revise/:id", :to => "books#revise"
  match "books/destroy/:id", :to => "books#destroy"
  match "books/:id/add_text", :to => "books#add_text"
  match "books/:id/remove_text", :to => "books#remove_text"
  match "books/:id/expire", :to => "books#expire", :as => :expire_book

  match "books/:id/epub/content/00copyright",     :to => "books#epub_content_00copyright",      :as => :epub_content_00copyright
  match "books/:id/epub/content/01title",         :to => "books#epub_content_01title",          :as => :epub_content_01title
  match "books/:id/epub/content/02artist",        :to => "books#epub_content_02artist",         :as => :epub_content_02artist  
  match "books/:id/epub/content/03story",         :to => "books#epub_content_03story",          :as => :epub_content_03story
  match "books/:id/epub/content/images/download", :to => "books#epub_content_images_download",  :as => :epub_content_images_download
  match "books/:id/epub/metadata",                :to => "books#epub_metadata",                 :as => :epub_metadata
  match "books/:id/epub/toc",                     :to => "books#epub_toc",                       :as => :epub_toc
  


  resources :books
  
  match "illustrations/uploaded", :to => "illustrations#uploaded", :as => :illustration_uploaded
  match "illustrations/new/:type/:position", :to => "illustrations#new", :as => :new_illustration
  
  resources :illustrations




  match "cant", :to => "dashboard#cant", :as => :cant


  match "reminders/book_no_illustration", :to => "reminders#book_no_illustration", :as => :book_no_illustration

  root :to => "dashboard#start"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
