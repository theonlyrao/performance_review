require "rails_helper"

feature "Manager logs in" do
  scenario "to assign employee to review another employee" do
    pentatrode = create(:organization)
    bill = create(:manager)
    alpha = create(:team, manager_id: bill.id)
    samir = create(:employee, team_id: alpha.id)
    michael = create(:employee, team_id: alpha.id)

    visit root_path

    click_link "Manager Login"
    fill_in("Username", with: bill.username)
    fill_in("Password", with: bill.password)
    click_on "Login"

    click_on "Request Employee Review"

    within("#reviewer") do
      select "#{samir.username}", from: "reviews_employee_id"
    end

    within("#reviewee") do
      select "#{michael.username}", from: "reviews_employee_id"
    end

    click_on "Assign Review"

    assert(page).has_content "#{samir.username} has been assigned to review #{michael.username}."
  end
end
