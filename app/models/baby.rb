class Baby < ActiveRecord::Base
  MALE = "male"
  FEMALE = "female"
  UNKNOWN = "unknown"

  GENDERS = [MALE, FEMALE, UNKNOWN]

  SIZES = {
    "4" => "poppy seed",
    "5" => "apple seed",
    "6" => "sweet pea",
    "7" => "blueberry",
    "8" => "kidney bean",
    "9" => "grape",
    "10" => "tangerine",
    "11" => "fig",
    "12" => "lime",
    "13" => "pea pod",
    "14" => "lemon",
    "15" => "apple",
    "16" => "avocado",
    "17" => "pear",
    "18" => "sweet potato",
    "19" => "mango",
    "20" => "banana",
    "21" => "carrot",
    "22" => "squash",
    "23" => "grapefruit",
    "24" => "corn",
    "25" => "acorn squash",
    "26" => "head of kale",
    "27" => "cauliflower",
    "28" => "eggplant",
    "29" => "butternut squash",
    "30" => "cabbage",
    "31" => "coconut",
    "32" => "chinese cabbage",
    "33" => "pineapple",
    "34" => "melon",
    "35" => "honeydew",
    "36" => "canary melon",
    "37" => "swiss chard",
    "38" => "rhubarb",
    "39" => "small watermelon",
    "40" => "watermelon"
  }

  belongs_to :user
end