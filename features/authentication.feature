Feature: Manage users authentication

	Scenario: User sign in
		Given User with email "user@name.com" and password "password" is registered
		And I'm in "/"
		When I go to "/users/sign_in"
		And I fill in "user_email" with "user@name.com"
		And I fill in "user_password" with "password"
		And I click "Sign In"
		Then I should see "sucessfully logged in"
		
	Scenario: User sing out
		Given User with email "user@name.com" is registered
		When I go to "/users/sign_out"
		Then I should see "sucessfully logged out"

	Scenario: User sign up
		Given I'm in "/users/sign_up"
		When I fill in "user_email" with "teste@email.com"
		And I fill in "user_password" with "password"
		And I fill in "user_password_confirmation" with "password"
		And I click "Sign Up"
		Then I should see "sucessfully signed up"
