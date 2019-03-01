class Power < ApplicationRecord
  has_many :heroines, through: :heroine_power
end
