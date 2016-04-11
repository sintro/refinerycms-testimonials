module Refinery
  module Testimonials
      class TestimonialsController < ::ApplicationController
  	  	before_action :find_page, :load_testimonials, only: [:index]
        respond_to :json, :html

		def index
  		end


        def show
          @testimonial = Refinery::Testimonials::Testimonial.with_translations(I18n.locale).friendly.find(params[:id])
		  @testimonial_images = @testimonial.images.includes(:translations)
        end

        protected

		def load_testimonials
		  @testimonials = Refinery::Testimonials::Testimonial.with_translations(I18n.locale)
		                    .reorder(received_date: :desc)
		                    .references(:image_pages)
		                    .includes(:images, images: [:translations])
		end

		def find_page
		  @page = Refinery::Page.find_by(:link_url => Refinery::Testimonials.page_url)
		end

      end
    end
end
