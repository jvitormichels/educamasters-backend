class Course < ApplicationRecord
  validates :name, presence: true

  def format_api
    {
      id: id,
      name: name,
      description: description,
      created_at: created_at,
      updated_at: updated_at
    }
  end
end