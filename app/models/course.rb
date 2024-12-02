class Course < ApplicationRecord
  validates :name, presence: true
  validates :end_date, presence: true

  mount_uploader :thumbnail, CourseThumbnailUploader

  def format_api
    {
      id: id,
      name: name,
      description: description,
      end_date: end_date.to_date,
      thumbnail: thumbnail_url
    }
  end

  def thumbnail_url
    return "" unless thumbnail.present?
    
    "#{Rails.application.routes.default_url_options[:host]}#{thumbnail.url}"
  end
end
