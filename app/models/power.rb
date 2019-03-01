class Power < ApplicationRecord
  has_many :heroines
  validates :name, uniqueness: true
end
