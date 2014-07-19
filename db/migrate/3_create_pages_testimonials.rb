class CreatePagesTestimonials < ActiveRecord::Migration
  def change
    create_table :pages_testimonials, id: false do |t|
        t.references :page
        t.references :testimonial
    end
    add_index :pages_testimonials, [:page_id, :testimonial_id]
    add_index :pages_testimonials, :testimonial_id
  end

end
