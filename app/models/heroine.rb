class Heroine < ApplicationRecord
  has_one :power, through: :heroine_power
end
