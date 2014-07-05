Refinery::Admin::PagesController.class_eval do

  # Add :testimonials_attributes to page_params for strong parameters.
  def page_params_with_testimonials_params
    test_params = params.require(:page).permit(:testimonials_show, :testimonials_count, :testimonials_select)
    page_params_without_testimonials_params.merge(test_params)
  end
  alias_method_chain :page_params, :testimonials_params

end