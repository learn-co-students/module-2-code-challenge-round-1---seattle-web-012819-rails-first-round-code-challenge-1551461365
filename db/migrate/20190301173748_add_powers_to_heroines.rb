class AddPowersToHeroines < ActiveRecord::Migration[5.1]
  def change
    change_table :heroines do |t|
      t.belongs_to :power
    end
  end
end
