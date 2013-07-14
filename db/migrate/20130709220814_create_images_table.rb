class CreateImagesTable < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.references :art, index: true

      t.timestamps
    end

    remove_column :arts, :image_file_name
    remove_column :arts, :image_content_type
    remove_column :arts, :image_file_size
    remove_column :arts, :image_updated_at
  end
end
