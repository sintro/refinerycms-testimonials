module Refinery
  module Testimonials
    module Extension
      def testimonial_fields
        validates :testimonials_count, :numericality => { :only_integer => true, :greater_than_or_equal_to=>0 }
      end
    end
  end
end

ActiveRecord::Base.send(:extend, Refinery::Testimonials::Extension)
