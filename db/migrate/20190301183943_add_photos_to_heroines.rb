class AddPhotosToHeroines < ActiveRecord::Migration[5.1]
  def change
    add_column :heroines, :img_url, :string
  end
end
