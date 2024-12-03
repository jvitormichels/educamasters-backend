class AddFileSizeToCoursePages < ActiveRecord::Migration[8.0]
  def change
    add_column :course_pages, :file_size, :float
  end
end
