module AdminRoutes
  def self.extended(router)
    router.instance_exec do
      namespace :admin do
        get :not_found, to: 'admin_application#not_found'
        resources :users
      end # end namespace
    end # end router
  end
end
