class Heroine < ApplicationRecord
  belongs_to :power
  validates :name, presence: true
  validates :super_name, presence: true, uniqueness: true

  def self.search(search)
    if search
      power = Power.find_by(name: search)
      power ? self.where(power_id: power) : Heroine.all
    else
      Heroine.all
    end
  end
end
