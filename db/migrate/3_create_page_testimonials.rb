class CreatePageTestimonials < ActiveRecord::Migration
  def change
    create_table :page_testimonials, id: false do |t|
        t.references :page
        t.references :testimonial
    end
    add_index :page_testimonials, [:page_id, :testimonial_id]
    add_index :page_testimonials, :testimonial_id
  end

end
