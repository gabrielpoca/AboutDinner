Feature: Manage Users in Events

	In order to manage users I should be able to add existing or new users to event.

	Background: I should be logged in and there should be an event.
		Given Default user is registered
		And I'm logged in as default user
		And Event "Novo Evento" is registered
		And I'm in "/events"

	Scenario: Add exising user by email.
		Given User with name "TesteName2" and email "teste@gmail.com" is registered
		When I click "Novo Evento"
		And I click "Edit"
		And I click "Add User"
		And I fill in "event_user_email" with "teste@gmail.com"
		And I click "Add"
		Then I should see "teste@gmail.com added"

	Scenario: Add non exisiting user.
		When I click "Novo Evento"
		And I click "Edit"
		And I click "Add User"
		And I fill in "event_user_email" with "novo@mail.com"
		And I click "Add"
		Then I should see "novo@mail.com invited"
