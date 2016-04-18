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
    assert page.has_content "my_money: 3"
  end

  scenario "manager has assigned review" do
    # link appears
  end

  scenaior "manager wants to see employee's dashboard" do
    # manager can navigate to the dashboard
  end

end
