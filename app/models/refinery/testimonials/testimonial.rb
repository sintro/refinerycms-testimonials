module Refinery
  module Testimonials
    class Testimonial < Refinery::Core::BaseModel
      self.table_name = "refinery_testimonials"

      # Constants for how to show the testimonials
      ORDER = %w[Random Recent]
      CHANNELS = %w[Letter Email Facebook Twitter]

      CHANNELS.each_with_index do |meth, index|
        define_method("#{meth}?") { channels == index }
      end

      validates :name, :presence => true, :uniqueness => true
      validates :quote, :presence => true

      scope :recent, lambda { |n| order('received_date DESC').limit(n)}
      scope :random, lambda { |n| order('RAND()').limit(n)}

    end
  end
end
