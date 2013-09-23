module Features
  module SessionHelpers
    def add_link(url, title)
      within('#new-link') do
        fill_in 'url', :with => url
        fill_in 'title', :with => title
        click_button 'Add link'
      end
    end
  end
end