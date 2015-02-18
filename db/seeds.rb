  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-testimonials').blank?
        user.plugins.create(:name => 'refinerycms-testimonials',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end
