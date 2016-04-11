Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :testimonials, :path => Refinery::Testimonials.page_url do
    resources :testimonials, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :testimonials, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      scope :path => Refinery::Testimonials.page_url do
		resources :testimonials, :except => :show do
			collection do
				post :update_positions
			end
		end
	  end
    end
  end

end
