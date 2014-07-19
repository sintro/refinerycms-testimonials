module Refinery
  module Testimonials
    module Extension
      def testimonial_fields
        validates :testimonials_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
      end

      def has_many_page_testimonials
        has_many :testimonials, proc { order('position ASC') }, through: :page_testimonials, class_name: 'Refinery::Testimonial'
        has_many :page_testimonials, proc { order('position ASC') }, as: :page, class_name: 'Refinery::PageTestimonial'

        accepts_nested_attributes_for :testimonials, allow_destroy: false

      end
    end
  end
end

ActiveRecord::Base.send(:extend, Refinery::Testimonials::Extension)
