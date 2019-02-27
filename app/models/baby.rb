class Baby < ActiveRecord::Base
  MALE = "male"
  FEMALE = "female"
  UNKNOWN = "unknown"

  GENDERS = [MALE, FEMALE, UNKNOWN]

  belongs_to :user
  has_many :appointments
end