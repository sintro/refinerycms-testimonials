require 'refinerycms-core'
require 'friendly_id/globalize'

module Refinery
  autoload :TestimonialsGenerator, 'generators/refinery/testimonials_generator'

  module Testimonials
    include ActiveSupport::Configurable
    config_accessor :page_url

    require 'refinery/testimonials/engine'


    self.page_url = "/testimonials"

    autoload :Tab, 'refinery/testimonials/tabs'

    class << self
      attr_writer :root
      attr_writer :tabs

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end
      
      def tabs
        @tabs ||= []
      end

    end
  end
end
