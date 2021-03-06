module Features
  module LinkHelpers
    def add_link(url, title, tags=[])
      within('#new-link') do
        fill_in 'url', :with => url
        fill_in 'title', :with => title
        # our tags will be space separated
        fill_in 'tags', :with => tags.join(' ')
        click_button 'Add link'
      end      
    end
  end
end