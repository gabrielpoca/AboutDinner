Feature: Manage Events
	In order to manage events
	I should be able to manage events

	Scenario: Visit New Event Page
		Given I'm in "/"
		When I click "New Event"
		Then I should see "New Event" in the selector "h1"

	Scenario: Create New Event
		Given Email "cette118@gmail.com" is registered
		And I'm in "events_path"
		When I fill in "name" with "Novo Evento"
		And I fill in "users" with "cette118@gmail.com"
		And I fill in "places" with "Braga"
		And I fill in "dinners" with "Coisas boas"
		And I click "Create"
		Then I should see "Novo Evento"
		And I should see "cette118@gmail.com"
		And I should see "Braga"
		And I should see "Coisas boas"

	Scenario: Edit Event
		Given Event "Novo Evento" is registered
		And I'm in "/events"
		When I click "Novo Evento"
		And I click "Edit"
		And I fill in "users" with "novoemail@gmail.com"
		And I click "Save"
		Then I should see "novoemail@gmail.com"
