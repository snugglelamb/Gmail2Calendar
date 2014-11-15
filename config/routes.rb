# == Route Map
#
#                   Prefix Verb     URI Pattern                                 Controller#Action
#                 mygmails GET      /mygmails(.:format)                         mygmails#index
#                          POST     /mygmails(.:format)                         mygmails#create
#              new_mygmail GET      /mygmails/new(.:format)                     mygmails#new
#             edit_mygmail GET      /mygmails/:id/edit(.:format)                mygmails#edit
#                  mygmail GET      /mygmails/:id(.:format)                     mygmails#show
#                          PATCH    /mygmails/:id(.:format)                     mygmails#update
#                          PUT      /mygmails/:id(.:format)                     mygmails#update
#                          DELETE   /mygmails/:id(.:format)                     mygmails#destroy
#                     root GET      /                                           users#index
#         new_user_session GET      /users/sign_in(.:format)                    devise/sessions#new
#             user_session POST     /users/sign_in(.:format)                    devise/sessions#create
#     destroy_user_session DELETE   /users/sign_out(.:format)                   devise/sessions#destroy
#  user_omniauth_authorize GET|POST /users/auth/:provider(.:format)             omniauth_callbacks#passthru {:provider=>/google_oauth2/}
#   user_omniauth_callback GET|POST /users/auth/:action/callback(.:format)      omniauth_callbacks#:action
#            user_password POST     /users/password(.:format)                   devise/passwords#create
#        new_user_password GET      /users/password/new(.:format)               devise/passwords#new
#       edit_user_password GET      /users/password/edit(.:format)              devise/passwords#edit
#                          PATCH    /users/password(.:format)                   devise/passwords#update
#                          PUT      /users/password(.:format)                   devise/passwords#update
# cancel_user_registration GET      /users/cancel(.:format)                     devise/registrations#cancel
#        user_registration POST     /users(.:format)                            devise/registrations#create
#    new_user_registration GET      /users/sign_up(.:format)                    devise/registrations#new
#   edit_user_registration GET      /users/edit(.:format)                       devise/registrations#edit
#                          PATCH    /users(.:format)                            devise/registrations#update
#                          PUT      /users(.:format)                            devise/registrations#update
#                          DELETE   /users(.:format)                            devise/registrations#destroy
#                   events GET      /events(.:format)                           events#index
#                          POST     /events(.:format)                           events#create
#                new_event GET      /events/new(.:format)                       events#new
#               edit_event GET      /events/:id/edit(.:format)                  events#edit
#                    event GET      /events/:id(.:format)                       events#show
#                          PATCH    /events/:id(.:format)                       events#update
#                          PUT      /events/:id(.:format)                       events#update
#                          DELETE   /events/:id(.:format)                       events#destroy
#            user_mygmails GET      /users/:user_id/mygmails(.:format)          mygmails#index
#                          POST     /users/:user_id/mygmails(.:format)          mygmails#create
#         new_user_mygmail GET      /users/:user_id/mygmails/new(.:format)      mygmails#new
#        edit_user_mygmail GET      /users/:user_id/mygmails/:id/edit(.:format) mygmails#edit
#             user_mygmail GET      /users/:user_id/mygmails/:id(.:format)      mygmails#show
#                          PATCH    /users/:user_id/mygmails/:id(.:format)      mygmails#update
#                          PUT      /users/:user_id/mygmails/:id(.:format)      mygmails#update
#                          DELETE   /users/:user_id/mygmails/:id(.:format)      mygmails#destroy
#           user_getgmails GET      /users/:user_id/getgmails(.:format)         mygmails#getGmails
#                    users GET      /users(.:format)                            users#index
#                          POST     /users(.:format)                            users#create
#                 new_user GET      /users/new(.:format)                        users#new
#                edit_user GET      /users/:id/edit(.:format)                   users#edit
#                     user GET      /users/:id(.:format)                        users#show
#                          PATCH    /users/:id(.:format)                        users#update
#                          PUT      /users/:id(.:format)                        users#update
#                          DELETE   /users/:id(.:format)                        users#destroy
#

require 'omniauth'
require 'omniauth-google-oauth2'
Rails.application.routes.draw do
  

  resources :mygmails

  root :to => 'users#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  #resources :mygmails
  resources :events
  
  #shallow do
    resources :users do
      resources :mygmails
      get 'getgmails' => 'mygmails#getGmails'
      end
   # end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
