Given /^I'm in "([^"]*)"$/ do |page|
  visit page
end

Given /^Email "([^"]*)" is registered$/ do |mail|
  User.create! :name => 'name', :email => mail, :password => 'password'
end

Given /^Event "([^"]*)" is registered$/ do |name|
  Event.create! :name => name
end

When /^I click "([^"]*)"$/ do |text|
  click_on text
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |element, text|
  fill_in element, :with => text
end

Then /^I should see "([^"]*)" in the selector "([^"]*)"$/ do |text, element|
  page.should have_selector element, :content => text
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content text
end
