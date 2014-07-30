# Open the Refinery::Page model for manipulation
Refinery::Page.class_eval do
  validates     :testimonials_count, :numericality => { :only_integer => true, :greater_than_or_equal_to=>0 }
  before_save   :add_testimonial_page_part
  attr_reader :testimonials

  has_and_belongs_to_many :testimonies, proc { order('received_date ASC') },
    join_table: :refinery_pages_testimonials,
    class_name: 'Refinery::Testimonials::Testimonial',
    association_foreign_key: :testimony_id,
    foreign_key: :page_id

  def testimonials
    if testimonials_show
      limit = testimonials_count==0 ? Refinery::Testimonials::Testimonial.count : testimonials_count

      case testimonials_select
      when 'Random'
        @testimonials = Refinery::Testimonials::Testimonial.random(limit)
      when 'Recent'
        @testimonials = Refinery::Testimonials::Testimonial.recent(limit)
      when 'Exact'
        @testimonials = testimonies
      end
    end
  end

  protected

  def add_testimonial_page_part
    parts.build(title: 'Testimonials', position: parts.count, plugin: 'refinery-testimonials') unless part_with_title('Testimonials')
  end

end