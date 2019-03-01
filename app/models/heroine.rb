class Heroine < ApplicationRecord
  has_one :power
  validates :super_name, uniqueness: true
end
