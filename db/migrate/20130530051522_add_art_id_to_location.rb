class AddArtIdToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :art_id, :integer
  end
end
