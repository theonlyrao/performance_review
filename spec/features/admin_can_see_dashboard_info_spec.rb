require "rails_helper"

feature "Admin logs in" do
  scenario "views relevant info on dashboard" do

    firm = Organization.create(name: "Pentatrode")
    inspiration = Manager.create(username: "Bill", password: "Lumberg", organization_id: firm.id)
    alpha = Team.create(name: "alpha", manager_id: inspiration.id)
    beta = Team.create(name: "beta", manager_id: inspiration.id)
    peter = Employee.create(username: "Peter", password: "Gibbons", team_id: alpha.id)
    samir = Employee.create(username: "Samir", password: "Notgonnaworkhereanymore", team_id: alpha.id)
    michael = Employee.create(username: "Michael", password: "He's pretty good", team_id: alpha.id)

    visit "/"

    click_link "Manager Login"
    expect(current_path).to eq(new_manager_session_path)
    fill_in("Username", with: inspiration.username)
    fill_in("Password", with: inspiration.password)
    click_on "Login"

    expect(page).to have_content "Organization: #{firm.name}"
    expect(page).to have_content "#{alpha.name}"
    expect(page).to have_content "#{beta.name}"
    expect(page).to have_link("View all employees")
    expect(page).to have_link("Add an employee")

    click_link "Logout"

    expect(current_path).to eq("/")
  end
end
