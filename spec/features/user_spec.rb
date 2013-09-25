require 'spec_helper'

feature 'User signs up' do

  scenario 'when being logged out' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content("Welcome, jess@puppy.com")
    expect(User.first.email).to eq("jess@puppy.com")
  end

  scenario "with a password that doesn't match" do
    expect {
      sign_up('a@a.com', 'pass', 'wrong')
    }.to change(User, :count).by 0
    expect(current_path).to eq '/users'
    expect(page).to have_content("Sorry, your passwords didn't match")
  end

  scenario "with an email that has already been registered" do
    expect { sign_up }.to change(User, :count).by 1
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content("This email is already taken")
  end

end