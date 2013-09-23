Given(/^I have just opened the application$/) do
  visit '/'
end

When(/^I take a look at the application$/) do
  
end

Then(/^there should be no links$/) do
  page.has_no_selector? '.link'
end