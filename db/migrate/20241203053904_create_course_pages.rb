class CreateCoursePages < ActiveRecord::Migration[8.0]
  def change
    create_table :course_pages do |t|
      t.integer :course_id
      t.string :title
      t.integer :position
      t.string :video
      
      t.timestamps
    end
  end
end
