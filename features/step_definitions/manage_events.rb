Given /^I'm in "([^"]*)"$/ do |page|
  visit page
end

Given /^User with email "([^"]*)" is registered$/ do |mail|

  step 'I\'m in "/users/sign_up"'
  step 'I fill in "user_name" with "Gabriel"'
  step 'I fill in "user_email" with "#{mail}"'
  step 'I fill in "user_password" with "password"'
  step 'I fill in "user_password_confirmation" with "password"'
  step 'I click "Sign up"'
  
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
