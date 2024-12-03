class CoursePage < ApplicationRecord
  validates :title, presence: true

  mount_uploader :video, PageVideoUploader

  belongs_to :course

  def format_api
    {
      id: id,
      title: title,
      position: position,
      video: video_url
    }
  end

  def video_url
    return "" unless video.present?
    
    "#{Rails.application.routes.default_url_options[:host]}#{video.url}"
  end
end
