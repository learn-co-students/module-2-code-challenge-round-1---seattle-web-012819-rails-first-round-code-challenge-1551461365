class Heroine < ApplicationRecord
    belongs_to :power
    validates_uniqueness_of :super_name, message: 'is not available'
    validates :name, presence: true
    validates :super_name, presence: true
end
