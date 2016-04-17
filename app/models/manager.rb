class Manager < ActiveRecord::Base
  belongs_to :organization
  has_many :teams
  has_many :employees, through: :teams

  has_secure_password
end
