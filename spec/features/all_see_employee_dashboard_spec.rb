require "rails_helper"

feature "Employee has a dashboard" do
  scenario "employee logs in" do
  #     As an employee,
  # when I log in to my account,
  # I should see the results of all of the surveys taken regarding me,
  # and if I have been assigned to rate another employee,
  # I should see a link that takes me to a page where I can complete that rating

    peter = create(:employee)
    review = create(:review, employee_id: peter.id)

    visit root_path
    click_link "Employee Login"
    fill_in("Username", with: peter.username)
    fill_in("Password", with: peter.password)
    click_on "Login"

    assert_equal employee_path(peter), current_path
    assert page.has_content? "my_money: #{review.my_money}"
  end

  scenario "manager has assigned review" do
    # link appears
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
    select "#{samir.username}", from: "reviews_reviewer"
    select "#{michael.username}", from: "reviews_reviewee"
    click_on "Assign Review"
    click_on "Logout"

    visit root_path
    click_link "Employee Login"
    fill_in("Username", with: samir.username)
    fill_in("Password", with: samir.password)
    click_on "Login"

    assert page.has_content? "Complete assigned review"

  end

  scenario "manager wants to see employee's dashboard" do
    # manager can navigate to the dashboard
  end

end
