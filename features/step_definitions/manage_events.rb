Given /^I'm in "([^"]*)"$/ do |page|
  visit page
end

Given /^Email "([^"]*)" is registered$/ do |mail|
  User.create! :name => 'name', :email => mail, :password => 'password'
end

Given /^Event "([^"]*)" is registered with user "([^"]*)"$/ do |event, user|
  e = Event.new :name => event
  e.user_attributes = [{ :name => user, :email => user, :password => user }]
  e.save
end

When /^I click "([^"]*)"$/ do |text|
  click_on text
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |element, text|
  fill_in element, :with => text
end

When /^I select date and time "([^"]*)" in "([^"]*)"$/ do |value, field|
  e = DateTime.parse(value)
  select_datetime(e.to_s, :from => field)
end

When /^I click "([^"]*)" on "([^"]*)"$/ do |link, field|
  find('tr', :text => field).click_link(link)
end

Then /^I should see "([^"]*)" in the selector "([^"]*)"$/ do |text, element|
  page.should have_selector element, :content => text
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content text
end

Then /^I should not see "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
