Given /^Default user is registered$/ do
  @default_user = User.create! :name => 'Default user', :email => 'default@user.com', :password => 'password', :password_confirmation => 'password'
end

Given /^I'm logged in as default user$/ do
  visit '/users/sign_out'
  visit '/users/sign_in'
  fill_in "user_email", :with => 'default@user.com'
  fill_in "user_password", :with => 'password'
  click_button "Sign in"  
  page.should have_content("Signed in successfully.")  
end

Given /^I'm in "([^"]*)"$/ do |page|
  visit page
end

Given /^Email "([^"]*)" is registered$/ do |mail|
  User.create! :name => 'name', :email => mail, :password => 'password'
end

Given /^Event "([^"]*)" is registered with user "([^"]*)"$/ do |event, user|
  e = Event.new :name => event
  password = Devise.friendly_token.first(6) 
  e.user_attributes = [{ :name => user, :email => user, :password => password, :password_confirmation => password }]
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

Given /^Event "([^"]*)" is registered$/ do |name|
  e = Event.new :name => name
  e.user << @default_user
  e.save
end

Given /^User with name "([^"]*)" and email "([^"]*)" is registered$/ do |name, email|
  password = Devise.friendly_token.first(6)
  User.create! :name => name, :email => email, :password => password, :password_confirmation => password
end

##### WHEN

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


##### THEN

Then /^I should see "([^"]*)" in the selector "([^"]*)"$/ do |text, element|
  page.should have_selector element, :content => text
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content text
end

Then /^I should not see "([^"]*)"$/ do |text|
  page.should_not have_content text
end
