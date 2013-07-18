class RemoveLocationFromArts < ActiveRecord::Migration
  def change
    remove_column :arts, :location, :string
  end
end
  
