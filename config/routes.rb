Rails.application.routes.draw do
  get 'template/template'

  resources :garantia
  get 'usuarios' => 'registrar#index', as: :usuarios
  post 'registrar/create'
  resources :subgroups
  resources :asesors
  get 'charges/index'
  post 'charges/create'
  get 'charges/show'

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
      resources :get_nombre_asesor, path: "obtener_nombre_asesor"
      resources :get_ordenes_abiertas_asesor, path: "obtener_ordenes_asesor"
      resources :get_ordenes_facturadas_asesor, path: "obtener_facturadas_asesor"
      resources :get_competencias, path: "obtener_competencias"
      resources :get_ordenes_viejas_asesor, path: "obtener_viejas"
      resources :crear_usuarios, path: "crea_usuario"
      resources :garantias, path: "garantias"
      resources :garantias_estatus, path: "garantias_estatus"
      resources :garantias_estatus_color, path: "garantias_color"
      resources :garantias_detalles, path: "garantias_detalles"
      resources :cierre_mes, path: "cierre_mes"
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
  get 'asesores' => 'home#index_asesores', as: :asesores
  get 'garantias' => 'home#index_garantias', as: :garantias
  get 'pago' => 'alertpayment#index', as: :pago
  get 'sucursales' => 'sucursales#index', as: :sucursales
  get 'agencias' => 'apps#index', as: :agencias
  get 'agencias/new' => 'apps#new', as: :agencias_new
  get 'panel' => 'groups#index', as: :panel
  get 'nuevo_grupo' => 'groups#new', as: :group_new
  get 'nuevo_usuario' => 'registrar#create', as: :usuario_new
  match 'usuario/:id' => 'registrar#destroy', :via => :delete, :as => :admin_destroy_user
  get 'nuevo_acceso' => 'accesos#new', as: :acceso_new
  get 'perfiles' => 'accesos#perfiles', as: :perfiles
  get 'nuevo_perfil' => 'accesos#nuevo_perfil', as: :nuevo_perfil
  get 'nuevo_perfil_postventa' => 'accesos#nuevo_perfil_postventa', as: :nuevo_perfil_postventa
  get 'nuevo_perfil_hyp' => 'accesos#nuevo_perfil_hyp', as: :nuevo_perfil_hyp
  get 'nuevo_perfil_asesores' => 'accesos#nuevo_perfil_asesores', as: :nuevo_perfil_asesores
  get 'nuevo_perfil_garantias' => 'accesos#nuevo_perfil_garantias', as: :nuevo_perfil_garantias
  get 'nueva_agencia' => 'apps#new', as: :agencia_new
  get 'asignar_asesor' => 'asesors#new', as: :asignar_new
  get 'listado_asesores' => 'asesors#index', as: :listado_asesores
  get 'choise' => 'inicio#choise', as: :choise
  
  #delete 'photos/:id(.:format)', :to => 'photos#destroy'
  #get 'precios' => 'inicio#precios', as: :precios




   #as :user do
    # get 'login' => 'devise/sessions#new', :as => :new_user_session
    # post 'login' => 'devise/sessions#create', :as => :user_session
    # match 'salir' => 'devise/sessions#destroy', :as => :destroy_user_session,
    #:via => Devise.mappings[:user].sign_out_via
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
