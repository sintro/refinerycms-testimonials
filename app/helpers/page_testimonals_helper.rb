module Refinery
  module Admin
    module PageTestimonialsHelper
      def refinery_label_with_help(name, value=nil)
       content_tag(:span, class: :label_with_help) do
        label_tag( name, t(".#{name}", value)) <<  refinery_help_tag( t(".#{name}_help"))
      end
    end

    end
  end
end