class Heroine < ApplicationRecord
    belongs_to :power

    #validations
    validates :super_name, uniqueness: true
end
