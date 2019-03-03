class Baby < ActiveRecord::Base
  MALE = "male"
  FEMALE = "female"
  UNKNOWN = "unknown"

  GENDERS = [MALE, FEMALE, UNKNOWN]

  SIZES = {
    "4" => "a poppy seed",
    "5" => "an apple seed",
    "6" => "a sweet pea",
    "7" => "a blueberry",
    "8" => "a kidney bean",
    "9" => "a grape",
    "10" => "a tangerine",
    "11" => "a fig",
    "12" => "a lime",
    "13" => "a pea pod",
    "14" => "a lemon",
    "15" => "an apple",
    "16" => "an avocado",
    "17" => "a pear",
    "18" => "a sweet potato",
    "19" => "a mango",
    "20" => "a banana",
    "21" => "a carrot",
    "22" => "a squash",
    "23" => "a grapefruit",
    "24" => "a corn",
    "25" => "an acorn squash",
    "26" => "a head of kale",
    "27" => "a cauliflower",
    "28" => "an eggplant",
    "29" => "a butternut squash",
    "30" => "a cabbage",
    "31" => "a coconut",
    "32" => "a chinese cabbage",
    "33" => "a pineapple",
    "34" => "a melon",
    "35" => "a honeydew",
    "36" => "a canary melon",
    "37" => "a swiss chard",
    "38" => "a rhubarb",
    "39" => "a small watermelon",
    "40" => "a watermelon"
  }

  belongs_to :user
end