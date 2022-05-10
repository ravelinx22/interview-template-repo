module AdminRoutes
  def self.extended(router)
    router.instance_exec do
      namespace :admin do
        resources :users
      end # end namespace
    end # end router
  end
end
