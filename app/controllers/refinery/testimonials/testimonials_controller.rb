module Refinery
  module Testimonials
      class TestimonialsController < ::ApplicationController
      respond_to :json, :html
        def show
          @testimonial = Refinery::Testimonials::Testimonial.with_translations(I18n.locale).friendly.find(params[:id])
		  @testimonial_images = @testimonial.images.includes(:translations)
        end
      end
    end
end
