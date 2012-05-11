Feature: Manage Events
	In order to manage events
	I should be able to manage events

	Scenario: Visit New Event Page
		Given I'm in "/"
		When I click "New Event"
		Then I should see "New Event" in the selector "h1"

	Scenario: Create New Event
		Given Email "cette118@gmail.com" is registered
		And I'm in "/events/new"
		When I fill in "event_name" with "Novo Evento"
		And I fill in "event_user_email" with "cette118@gmail.com"
		And I fill in "event_place_name" with "Braga"
		And I select "2012" in "event_place_time_1i"
		And I select "May" in "event_place_time_2i"
		And I select "3" in "event_place_time_3i"
		And I select "11" in "event_place_time_4i"
		And I select "40" in "event_place_time_5i"
		And I fill in "event_dinner_name" with "Coisas boas"
		And I click "Create"
		Then I should see "Novo Evento"
		And I should see "cette118@gmail.com"
		And I should see "Braga"
		And I should see "Coisas boas"

	Scenario: Edit Event
		Given Event "Novo Evento" is registered with user "cette118@gmail.com"
		And I'm in "/events"
		When I click "Novo Evento"
		And I click "Edit"
		And I fill in "email" with "novoemail@gmail.com"
		And I click "Save"
		Then I should see "novoemail@gmail.com"
