# Open the Refinery::Page model for manipulation
Refinery::Page.class_eval do
  # Whitelist the testimonials control fields
  attr_accessible :testimonials_show, :testimonials_count, :testimonials_select
  validates :testimonials_count, :numericality => { :only_integer => true, :greater_than_or_equal_to=>0 }
  before_save :testimonial_page_part

  def testimonial_page_part
    testimonial_part = @page.part_with_title('testimonials')
    @page.parts << {title: 'testimonials', position: @page.parts.count} if @page.testimonials_show && !testimonial_part
    @page.parts.delete(testimonial_part) if testimonial_part && !@page.testimonials_show
  end
end