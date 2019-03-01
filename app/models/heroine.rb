class Heroine < ApplicationRecord
  belongs_to  :power
  accepts_nested_attributes_for :power, reject_if: :all_blank

  validates :super_name, uniqueness: true
end
