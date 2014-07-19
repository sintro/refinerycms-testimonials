# Open the Refinery::Page model for manipulation
Refinery::Page.class_eval do
  validates     :testimonials_count, :numericality => { :only_integer => true, :greater_than_or_equal_to=>0 }
  before_save   :add_testimonial_page_part

  protected

  def add_testimonial_page_part
    parts.build(title: 'Testimonials', position: parts.count, plugin: 'refinery-testimonials') unless part_with_title('Testimonials')
  end

end