class Medicine < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user, :name, :dose, :description
end