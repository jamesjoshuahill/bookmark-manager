module Features
  module SessionHelpers
    
    def add_link(url, title)
      within('#new-link') do
        fill_in 'url', :with => url
        fill_in 'title', :with => title
        click_button 'Add link'
      end
    end

    def add_link_with_tag(url, title, tags = [])
      within('#new-link') do
        fill_in 'url', :with => url
        fill_in 'title', :with => title
        # our tags will be space separated
        fill_in 'tags', :with => tags.join(' ')
        click_button 'Add link'
      end      
    end

    def sign_up(email="jess@puppy.com", password="cheese!")
      visit '/users/new'
      fill_in 'email', :with => email
      fill_in 'password', :with => password
      click_button 'Sign up'
    end

  end
end