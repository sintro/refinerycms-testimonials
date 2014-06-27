# Open the Refinery::Page model for manipulation
Refinery::Page.class_eval do
  # Whitelist the testimonials control fields
  attr_accessible :testimonials_show, :testimonials_count, :testimonials_select
  validates :testimonials_count, :numericality => { :only_integer => true, :greater_than_or_equal_to=>0 }
  before_save :testimonial_page_part

  def testimonial_page_part
    testimonial_part = part_with_title('Testimonials')
    parts.build(title: 'Testimonials', position: parts.count) if testimonials_show && !testimonial_part
    parts.delete(testimonial_part) if testimonial_part && !testimonials_show
  end
end