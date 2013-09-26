module Features
  module SessionHelpers
    def sign_up(email="jess@puppy.com",
                password="cheese!",
                password_confirmation="cheese!")
      visit '/users/new'
      fill_in 'email', :with => email
      fill_in 'password', :with => password
      fill_in 'password_confirmation', :with => password_confirmation
      click_button 'Sign up'
    end

    def sign_in(email, password)
      visit '/sessions/new'
      fill_in 'email', :with => email
      fill_in 'password', :with => password
      click_button 'Sign in'
    end
  end
end