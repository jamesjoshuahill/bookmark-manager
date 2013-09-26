require 'spec_helper'

feature "User signs out" do

  before(:each) do
    User.create(:email => 'test@test.com',
                :password => 'test',
                :password_confirmation => 'test')
  end
  
  scenario "when already signed in" do
    sign_in('test@test.com', 'test')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end