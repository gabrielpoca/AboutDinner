Feature: Manage Users in Events

	In order to manage users I should be able to add existing or new users to event.

	Background: I should be logged in and there should be an event.
		Given default user is registered
		And I'm logged in as default user
		And event "Novo Evento" is registered
		And I'm in "/events/index"

	Scenario Outline: Add exising user by name and email.
		When I click "Novo Evento"
		And I click "Edit"
		And I click "Add User"
		And I fill in "<field>" with "<value>"
		And And I click "Add"
		Then I should see "User <value> added"

		Examples:
			| field       | value           |
			| user_name   | TesteName2      |
			| user_email  | teste@gmail.com |
