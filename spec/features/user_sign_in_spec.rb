require 'spec_helper'

feature "User signs in" do
  let(:welcome_message) { "Welcome, test@test.com" }
  
  before(:each) do
    User.create(:email => "test@test.com",
                :password => "test",
                :password_confirmation => "test")
  end

  scenario "with correct credentials" do
    visit '/'
    expect(page).not_to have_content(welcome_message)
    sign_in('test@test.com', 'test')
    expect(page).to have_content(welcome_message)
  end

  scenario "with incorrect credentials" do
    visit '/'
    expect(page).not_to have_content(welcome_message)
    sign_in('test@test.com', 'wrong')
    expect(page).not_to have_content(welcome_message)
  end

end