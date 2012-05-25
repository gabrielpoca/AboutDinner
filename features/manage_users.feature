Feature: Manage Users in Events

	In order to manage users I should be able to add existing or new users to event.

	Background: I should be logged in and there should be an event.
		Given Default user is registered
		And I'm logged in as default user
		And Event "Novo Evento" is registered
		And I'm in "/events/index"

	Scenario Outline: Add exising user by name and email.
		Given User with name "TesteName2" and email "teste@gmail.com" is registered
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

	Scenario: Invite non registered user to event.
		When I click "Novo Evento"
		And I click "Edit"
		And I click "Add User"
		And I click "Invite User to App"
		And I fill in "user_email" with "novoemail@email.com"
		And I click "Invite"
		Then I should see "novoemail@email.com invited"
