require "rails_helper"

feature "Employee has been assigned review" do
  scenario "logs into account" do
    pentatrode = create(:organization)
    bill = create(:manager)
    alpha = create(:team, manager_id: bill.id)
    samir = create(:employee, team_id: alpha.id)
    michael = create(:employee, team_id: alpha.id)
    review = Review.create(reviewer: samir.id, employee_id: michael.id)

    visit root_path
    click_link "Employee Login"
    fill_in("Username", with: samir.username)
    fill_in("Password", with: samir.password)
    click_on "Login"

    click_on "Complete assigned review"

    assert review_path(michael.id), current_path

    fill_in "My money", with: "4"
    fill_in "My team", with: "3"
    fill_in "At risk", with: "true"
    fill_in "Promote", with: "false"
    click_on "Submit Review"

    assert employee_path(samir.id), current_path
    refute page.has_content?("Complete assigned reivew")
    assert michael.id, Review.last.employee_id
    assert "4", Review.last.my_money
    assert "3", Review.last.my_team
    assert "true", Review.last.at_risk
    assert "false", Review.last.promote
    assert "2016-04-18", Review.last.date_given
  end
end
