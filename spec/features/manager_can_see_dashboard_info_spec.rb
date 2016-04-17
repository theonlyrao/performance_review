require "rails_helper"

feature "Manager logs in" do
  scenario "views relevant info on dashboard" do

    pentatrode = create(:organization)
    bill = create(:manager)
    alpha = create(:team, manager_id: bill.id)
    beta = create(:team, manager_id: bill.id)
    peter = create(:employee, team_id: alpha.id)
    samir = create(:employee, team_id: alpha.id)
    michael = create(:employee, team_id: alpha.id)

    visit root_path

    click_link "Manager Login"
    expect(current_path).to eq(new_manager_session_path)
    fill_in("Username", with: bill.username)
    fill_in("Password", with: bill.password)
    click_on "Login"

    expect(page).to have_content "Organization: #{pentatrode.name}"
    expect(page).to have_content "#{alpha.name}"
    expect(page).to have_content "#{beta.name}"
    expect(page).to have_link("View all employees")
    expect(page).to have_link("Add an employee")

    click_link "Logout"

    expect(current_path).to eq(root_path)
  end
end
