Scenario: user can add a pet owner into system
Given I am on page adding owner
When I filled firstName with Nicholas
When I filled lastName with Ren
When I filled address with GaoXin Road
When I filled city with XiAn
When I filled telephone with 13823458694
When I submit

Then I should see XiAn
Then I should see GaoXin Road
Then I should see 13823458694