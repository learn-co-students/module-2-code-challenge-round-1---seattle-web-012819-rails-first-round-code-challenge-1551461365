class Heroine < ApplicationRecord
   belongs_to :power
   validates :super_name, uniqueness: true
   #ideally would create a custom validation that downcases and checks for a downcase
   #match.
end
