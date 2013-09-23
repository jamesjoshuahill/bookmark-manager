Given(/^I have just opened the application$/) do
  visit '/'
end

When(/^I take a look at the application$/) do
  
end

Then(/^there should be no links$/) do
  expect(page.has_xpath?('//section/ul')).to be_true
  expect(page.has_xpath?('//section/ul/li')).to be_false
end