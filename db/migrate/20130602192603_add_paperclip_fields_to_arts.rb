class AddPaperclipFieldsToArts < ActiveRecord::Migration
  def change
    add_column :arts, :image_file_name, :string
    add_column :arts, :image_content_type, :string
    add_column :arts, :image_file_size, :integer
    add_column :arts, :image_updated_at, :datetime

  end
end
