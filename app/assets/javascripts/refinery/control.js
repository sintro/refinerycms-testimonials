jQuery(function() {

  $('#testimonials_select').find('input').on('change', function(){
    if ($.inArray(this.value, ['Random', 'Recent'])>=0) {
      $('#testimonials_picker').addClass('hidden');
      $('#testimonials_counter_field').removeClass('hidden');
    } else {
      $('#testimonials_picker').removeClass('hidden');
      $('#testimonials_counter_field').addClass('hidden');
    }
  });
  $('#page_testimonials_count').spinner();
  $('#testimonial_multiselect').multiselect();
});