class ChangeArtIdFormatInLocations < ActiveRecord::Migration
  def up
    change_column :locations, :art_id, :integer
  end

  def down
    change_column :locations, :art_id, :string
  end
end
