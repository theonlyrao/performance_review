FactoryGirl.define do

  sequence :bool do |n|
    if n.even?
      true
    else
      false
    end
  end

  sequence :date do |n|
    day = (n * 3)%30
    "2016-04-#{day}"
  end

  factory :review do
    date_given {generate(:date)}
    my_money {rand(1..5)}
    my_team {rand(1..5)}
    at_risk {generate(:bool)}
    promote {generate(:bool)}
    employee
  end

end
