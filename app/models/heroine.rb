class Heroine < ApplicationRecord
  has_one :power

  validates :name, uniqueness: true

  def power
    power = Power.find(self.power_id)
  end
end
