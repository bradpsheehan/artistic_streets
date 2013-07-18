class RemoveLocationFromArts < ActiveRecord::Migration
  def change
    remove_column :arts, :location
  end
end
  
