module ApiRoutes
  def self.extended(router)
    router.instance_exec do
      namespace :api do
        resources :users
      end # end namespace
    end # end router
  end
end
