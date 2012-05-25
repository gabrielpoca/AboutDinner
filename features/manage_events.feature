Feature: Manage Events

	In order to manage events I should be able to add/remove users, places and dinners.

	Background:
		Given Default user is registered
		And I'm logged in as default user

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
		And I select date and time "1/6/2012 14:30" in "Time"
		And I fill in "event_dinner_name" with "Coisas boas"
		And I click "Create"
		Then I should see "Novo Evento"
		And I should see "cette118@gmail.com"
		And I should see "Braga"
		And I should see "Coisas boas"

	Scenario: Add Dinner To Event
		Given Event "Evento" is registered with user "mais@gmail.com"
		And I'm in "/events"
		When I click "Evento"
		And I click "Edit"
		And I click "Add Dinner"
		And I fill in "event_dinner_name" with "Coisas Boas"
		And I click "Add"
		Then I should see "Coisas Boas"
		And I should see "mais@gmail.com"
		And I should see "Evento"

	Scenario: Add Place To Event
		Given Event "Evento" is registered with user "mais@gmail.com"
		And I'm in "/events"
		When I click "Evento"
		And I click "Edit"
		And I click "Add Place"
		And I fill in "event_place_name" with "Braga"
		And I select date and time "1/6/2012 14:30" in "Time"
		And I click "Add"
		Then I should see "Braga"
		And I should see "mais@gmail.com"
		And I should see "Evento"

	Scenario: Edit Event Name
		Given Event "Evento" is registered with user "mais@gmail.com"
		And I'm in "/events"
		When I click "Evento"
		And I click "Edit"
		And I fill in "event_name" with "Novo Nome"
		And I click "Save"
		Then I should see "Novo Nome"

	Scenario: Remove User From Event
		Given Event "Evento" is registered with user "mais@gmail.com"
		And I'm in "/events"
		When I click "Evento"
		And I click "Edit"
		And I click "Remove" on "mais@gmail.com"
		Then I should not see "mais@gmail.com"
		And I should see "Evento"

	Scenario: Remove Place From Event
		Given Event "Evento" is registered with place "Lugar"
		And I'm in "/events"
		When I click "Evento"
		And I click "Edit"
		And I click "Remove" on "Lugar"
		Then I should not see "Lugar"
		And I should see "Evento"

	Scenario: Remove Dinner From Event
		Given Event "Evento" is registered with dinner "Coisas boas"
		And I'm in "/events"
		When I click "Evento"
		And I click "Edit"
		And I click "Remove" on "Coisas boas"
		Then I should not see "Coisas boas"
		And I should see "Evento"

	Scenario: Add Comment to Event
		Given Event "Evento" is registered with user "cette118@gmail.com"
		And I'm in "/events"
		When I click "Evento"
		And I click "Edit"
		And I click "Add Comment"
		And I fill in "event_comment_content" with "Comentario"
		And I click "Add"
		Then I should see "Comentario"
