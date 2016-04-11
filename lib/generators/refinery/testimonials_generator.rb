module Refinery
  class TestimonialsGenerator < Rails::Generators::Base

    source_root File.expand_path("../templates", __FILE__)

    def generate_blog_initializer
      template "config/initializers/refinery/testimonials.rb.erb", File.join(destination_root, "config", "initializers", "refinery", "testimonials.rb")
    end

    def rake_db
      rake "refinery_testimonials:install:migrations"
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by Refinery CMS Testimonials extension
Refinery::Testimonials::Engine.load_seed
        EOH
      end
    end
  end
end
