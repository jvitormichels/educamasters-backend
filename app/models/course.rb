class Course < ApplicationRecord
  validates :name, presence: true
  validates :end_date, presence: true

  mount_uploader :thumbnail, CourseThumbnailUploader

  has_many :course_pages, dependent: :destroy

  def format_api
    {
      id: id,
      name: name,
      description: description,
      end_date: end_date.to_date,
      thumbnail: thumbnail_url,
      pages: get_course_pages
    }
  end

  def get_course_pages
    # será alterado para ordenar de acordo com o parâmetro position, mas por hora sem tempo irmão
    self.course_pages.order(created_at: :asc).map(&:format_api)
  end

  def thumbnail_url
    return "" unless thumbnail.present?
    
    "#{Rails.application.routes.default_url_options[:host]}#{thumbnail.url}"
  end
end
