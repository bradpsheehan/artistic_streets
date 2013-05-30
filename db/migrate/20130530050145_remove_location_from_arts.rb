class RemoveLocationFromArts < ActiveRecord::Migration
  def up
    remove_column :arts, :location
  end

  def down
    add_column :arts, :location, :str
  end
end
