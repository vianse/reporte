Rails.application.routes.draw do
  resources :groups
  get 'errors/app_id'
  get 'errors/acceso'
  get 'errors/sucursal'
  get 'sucursales/index'

  get 'alertpayment/index'

  resources :payments
  get 'inicio/index'

  devise_for :supers
  devise_for :sistemas
  resources :configuracions
  resources :facturadas
  resources :pendientes
  resources :ordenes_abierta
  get 'home/index'

  resources :accesos
   devise_for :users
  resources :catalogos
  resources :apps
  namespace :api do
    namespace :v1 do
      resources :report
      resources :get_empresa, path: "empresa"
      resources :get_objetivo
      resources :get_objetivo_real, path: "objetivo_real"
      resources :get_ordenes_abiertas, path: "abiertas"
      resources :get_costo, path: "costo"
      resources :get_facturas, path: "facturadas"
      resources :get_costo_internas, path: "internas"
      resources :get_conteo_internas, path: "conteo_internas"
      resources :random_orden, path: "pronostico"
      resources :random_orden_pronosticos, path: "orden_pronostico"
      resources :get_ordenes_abiertas_internas, path: "ordenes_internas"
      resources :get_porcentaje, path: "porcentaje"
      resources :crear_ordenes, path: "crear_ordenes"
      resources :crear_facturadas, path: "crear_facturadas"
      resources :valida_app_id, path: "valida_app_id"
      resources :get_ordenes_mayores, path: "mayores"
      resources :get_fecha, path: "fecha"
      resources :test, path: "prueba"
      resources :sucursales, path: "sucursales"
      resources :get_sucursales_hyp, path: "sucursales_hyp"
      resources :get_ordenes_hyp, path: "ordenes_hyp"
      resources :general, path: "general"
      resources :get_sucursales_general, path: "general_sucursales"
      resources :get_dias, path: "dias"
      resources :get_periodos_anteriores, path: "periodos"
      resources :get_periodos_servicio, path: "periodos_servicio"
      resources :get_periodos_hyp, path: "periodos_hyp"

    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'control#index'
  get 'settings' => 'configuracions#index', as: :settings
  get 'objetivos' => 'catalogos#index', as: :objetivos
  get 'home' => 'home#index', as: :home
  get 'home_hyp' => 'home#index_hyp', as: :home_hyp
  get 'general' => 'home#index_general', as: :home_general
  get 'inicio' => 'inicio#index', as: :inicio
  get 'periodos' => 'home#index_periodos', as: :periodos
  get 'pago' => 'alertpayment#index', as: :pago
  get 'sucursales' => 'sucursales#index', as: :sucursales


 
  # as :user do
  #   get 'login' => 'devise/sessions#new', :as => :new_user_session
  #   post 'login' => 'devise/sessions#create', :as => :user_session
  #   match 'salir' => 'devise/sessions#destroy', :as => :destroy_user_session,
  #     :via => Devise.mappings[:user].sign_out_via
  # end
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
