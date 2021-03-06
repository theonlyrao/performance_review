require "rails_helper"

feature "Manager logs in" do
  scenario "creates new employee on a team" do
    pentatrode = create(:organization)
    bill = create(:manager)
    alpha = create(:team, manager_id: bill.id)
    beta = create(:team, manager_id: bill.id)
    employee_username = "Peter"
    employee_password = "password"

    visit root_path
    click_link "Manager Login"
    fill_in("Username", with: bill.username)
    fill_in("Password", with: bill.password)
    click_on "Login"
    click_on "Add an employee"
    fill_in("Username", with: employee_username)
    fill_in("Password", with: employee_password)
    select "#{beta.name}", from: "employee_team_id"
    click_on "Create Employee"

    assert_equal "Peter", Employee.last.username
    assert_equal bill.username, Employee.last.team.manager.username
  end
end
