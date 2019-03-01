class Heroine < ApplicationRecord
  belongs_to :power

  validates :super_name, uniqueness: true

  def self.search(searchterm)
    if searchterm
      power = Power.find_by(name: searchterm)
      if power
        self.where(power_id: power)
      else
        Heroine.all
      end
    else
      Heroine.all
    end
  end

end
