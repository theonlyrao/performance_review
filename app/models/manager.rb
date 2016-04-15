class Manager < ActiveRecord::Base
  belongs_to :organization
  has_many :teams

  has_secure_password
end
