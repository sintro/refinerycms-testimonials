Refinery::Admin::PagesController.class_eval do
#  http://nirvdrum.com/2009/05/15/alias-method-chain-closure-issue.html
  pp_method_builder = Proc.new do
    # Get a reference to the  original method with all previous permissions already applied.
    page_params_method = instance_method :page_params

    # Define the new method.
    define_method("page_params_with_testimonials_params") do
      testimonials_params = params.require(:page).permit(:testimonials_show, :testimonials_count, :testimonials_select, :testimony_ids => [])
      page_params_method.bind(self).call().merge(testimonials_params)
    end
  end

  alias_method_chain :page_params, :testimonials_params, &pp_method_builder
end