require 'spec_helper'

feature 'User signs up' do

  scenario 'when being logged out' do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content("Welcome, jess@puppy.com")
    expect(User.first.email).to eq("jess@puppy.com")
  end

end