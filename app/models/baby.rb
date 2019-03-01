class Baby < ActiveRecord::Base
  MALE = "male"
  FEMALE = "female"
  UNKNOWN = "unknown"

  GENDERS = [MALE, FEMALE, UNKNOWN]

  SIZES = {
    "21" => "Carrot"
  }

  belongs_to :user
end