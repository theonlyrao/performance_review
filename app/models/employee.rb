class Employee < ActiveRecord::Base
  has_secure_password
  
  belongs_to :team
end
