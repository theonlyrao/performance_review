FactoryGirl.define do
  sequence :employee_username do |n|
    "Employee#{n}"
  end

  factory :employee do
    username { generate(:employee_username)}
    password "password"
    team
  end

end
