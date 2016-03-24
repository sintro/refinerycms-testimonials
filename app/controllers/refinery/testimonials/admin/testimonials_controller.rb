module Refinery
  module Testimonials
    module Admin
      class TestimonialsController < ::Refinery::AdminController

        crudify :'refinery/testimonials/testimonial',
                title_attribute: :flash_name,
                include: [:translations]

        helper :'refinery/testimonials/admin'

        protected

        def testimonial_params
          params[:testimonial][:images_attributes]={} if params[:testimonial][:images_attributes].nil?
          params.require(:testimonial).permit(:name,
                                              :quote,
                                              :teaser,
                                              :company,
                                              :job_title,
                                              :website,
                                              :received_date,
                                              :received_channel,
                                              :position,
                                              images_attributes: [:id, :caption]
                                              )
        end
      end
    end
  end
end
