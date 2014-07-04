# Open the Refinery::Page model for manipulation
Refinery::Page.class_eval do
  validates     :testimonials_count, :numericality => { :only_integer => true, :greater_than_or_equal_to=>0 }
  before_save   :add_testimonial_page_part
  after_save    :remove_testimonial_page_part
  attr_accessor :testimonials

  def testimonials
    if testimonials_show
      limit = testimonials_count==0 ? Refinery::Testimonials::Testimonial.count : testimonials_count
      @testimonials = Refinery::Testimonials::Testimonial.limit(limit)
      # @testimonials = testimonials_select=='Random' ? @testimonials.order_by_rand.limit(limit) : @testimonials.recent(limit)
    end
  end

  protected

  def add_testimonial_page_part
    testimonial_part = part_with_title('Testimonials')
    Rails.logger.debug ".........Testimonial Part:#{testimonial_part} #{testimonials_show}"
    parts.build(title: 'Testimonials', position: parts.count, template: 'positioning_tab') if testimonials_show && !testimonial_part
  end

  def remove_testimonial_page_part
    testimonial_part = part_with_title('Testimonials')
    Rails.logger.debug ".........Testimonial Part:#{testimonial_part} #{testimonials_show}"
    parts.delete(testimonial_part) if testimonial_part && !testimonials_show
  end

end