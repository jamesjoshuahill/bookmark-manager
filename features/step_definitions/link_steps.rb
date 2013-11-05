Given(/^I have just opened the application$/) do
  visit '/'
end

When(/^I take a look at the application$/) do
  
end

Then(/^there should be no links$/) do
  expect(page).to have_css('ul#links')
  expect(page).not_to have_css('ul li')
end

Then(/^I should see a link to "([^"]*)"$/) do |href_destination|
  page.should have_xpath("//a[@href='#{href_destination}']")
end