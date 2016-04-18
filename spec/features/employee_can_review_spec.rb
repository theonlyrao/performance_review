require "rails_helper"

feature "Employee has been assigned review" do
  scenario "logs into account" do
    pentatrode = create(:organization)
    bill = create(:manager)
    alpha = create(:team, manager_id: bill.id)
    samir = create(:employee, team_id: alpha.id)
    michael = create(:employee, team_id: alpha.id)
    review = create(:review, reviewer: samir.id, employee_id: michael.id)

    visit root_path
    click_link "Employee Login"
    fill_in("Username", with: samir.username)
    fill_in("Password", with: samir.password)
    click_on "Login"
    save_and_open_page
    click_on "Complete assigned review"

    assert review_path(michael.id), current_path

    fill_in "My_money", "4"
    fill_in "My_team", "3"
    fill_in "At_risk", "true"
    fill_in "promote", "false"
    click_on "Submit Review"

    assert employe_path(samir.id), current_path
    refute page.has_content?("Complete assigned reivew")
    assert michcael.id, Review.last.employee_id
    assert "4", Review.last.my_money
    assert "3", Review.last.my_team
    assert "true", Review.last.at_risk
    assert "false", Review.last.promote
    assert "2016-04-18", Review.last.date_given
  end
end
