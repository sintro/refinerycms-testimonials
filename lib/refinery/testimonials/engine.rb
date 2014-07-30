 module Refinery
  module Testimonials
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Testimonials

      engine_name :refinery_testimonials

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = 'refinery_testimonials'
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.testimonials_admin_testimonials_path }
          plugin.pathname = root
          plugin.menu_match = %r{refinery/testimonials/testimonials}
          plugin.activity = {
            :class_name => Refinery::Testimonials::Testimonial,
            :title =>  'name'
          }
          plugin.edit_page_template = 'testimonials_page_options'
          plugin.page_attributes = %w(testimonials_show testimonials_count testimonials_select)
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Testimonials)
        require 'refinery/testimonials_section_presenter'
      end
    end
  end
end
