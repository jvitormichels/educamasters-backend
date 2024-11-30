class Course < ApplicationRecord
  validates :name, presence: true
  validates :end_date, presence: true

  def format_api
    {
      id: id,
      name: name,
      description: description,
      end_date: end_date.to_date
    }
  end
end
