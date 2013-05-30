class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.string :title
      t.string :artist
      t.string :location
      t.text :comment

      t.timestamps
    end
  end
end
