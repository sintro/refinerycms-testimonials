module Refinery
  module Admin
    module PageTestimonialsHelper
      def testimonials_picker(collection)
        picker = collection.nil? ? content_tag(:p, t('.no_testimonials_yet')) :
          select_tag( :page, :testimonies_ids, collections.map{ |t| [t.name, t.id ] }, {}, {:multiple=>true, :class=>:multiselect, :id=>:testimonial_multiselect})
        content_tag(:div, picker, class: 'wym_skin_refinery page_part', id:'page_testimonial_picker')
      end
    end
  end
end