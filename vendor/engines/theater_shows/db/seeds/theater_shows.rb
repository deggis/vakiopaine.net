if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'theater_shows').blank?
      user.plugins.create(:name => 'theater_shows',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Theater Shows',
    :link_url => '/theater_shows',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/theater_shows(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end