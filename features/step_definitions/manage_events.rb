Given /^default user is registered$/ do
  @user = User.create! :name => 'Gabriel', :email => 'eu@gmail.com', :password => 'password', :password_confirmation => 'password'
end

Given /^I'm logged in as default user$/ do
  visit '/users/sign_out'
  visit '/users/sign_in'
  fill_in "user_email", :with => @user[:email]
  fill_in "user_password", :with => @user[:password]
  click_button "Sign in"  
end

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

Given /^Event "([^"]*)" is registered with place "([^"]*)"$/ do |event, place|
  e = Event.new :name => event
  e.place_attributes = [{ :name => place, :time => Time.now }]
  e.save
end

Given /^Event "([^"]*)" is registered with dinner "([^"]*)"$/ do |event, dinner|
  e = Event.new :name => event
  e.dinner_attributes = [{ :name => dinner }]
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

Then /^I should not see "([^"]*)"$/ do |text|
  page.should_not have_content text
end
