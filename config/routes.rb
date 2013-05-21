QuizzesOnRails::Application.routes.draw do
  resources :quizzs
  resources :authentication


get "sign_in" => "authentication#sign_in"
get "signed_out" => "authentication#signed_out"
get "new_user" => "authentication#new_user"
post "sign_in" => "authentication#login"
post "new_user" => "authentication#register"
put "new_user" => "authentication#register"
get "start" => "quizzs#startExam"
put "percentage" => "quizzs#percentage"
post "percentage" => "quizzs#percentage"
get "result" => "quizzs#results"
get "questions" => "quizzs#questions"

post "check" => "quizzs#check"
put "check" => "quizzs#check"

get "answer" => "quizzs#answer"
post "create_quizz" => "quizzs#create"
put "create_quizz" => "quizzs#create"

post "all_user" => "authentication#all_user"
get "all_user" => "authentication#all_user"
put "all_user" => "authentication#all_user"

get "admin" => "authentication#admin_in"
post "admin" => "authentication#admin"

put "edit" => "quizzs#update"
post "edit" => "quizzs#update"




  get "home/index"


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
   root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
   match ':controller(/:action(/:id))(.:format)'
 end
