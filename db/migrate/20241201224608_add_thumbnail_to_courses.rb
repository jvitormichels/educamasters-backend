class AddThumbnailToCourses < ActiveRecord::Migration[8.0]
  def change
    add_column :courses, :thumbnail, :string
  end
end
