class Employee < ActiveRecord::Base
  has_secure_password

  belongs_to :team
  has_one :manager, through: :team
end
