class DashboardController < ApplicationController
  MEGABYTE_DIVIDER = 1024 * 1024

  def expired_and_active_courses_storage
    expired = Course.where('end_date <= ?', Date.today).includes(:course_pages)
    active = Course.where('end_date > ?', Date.today).includes(:course_pages)

    expired_course_storage = expired.sum { |course| course.course_pages.sum(:file_size) } / MEGABYTE_DIVIDER
    active_course_storage = active.sum { |course| course.course_pages.sum(:file_size) } / MEGABYTE_DIVIDER

    render json: { active_course_storage: active_course_storage, expired_course_storage: expired_course_storage }
  end

  def top_courses
    result = []

    courses = Course.joins(:course_pages).select("courses.*, SUM(course_pages.file_size) AS total_size").group(:id).order("total_size DESC").limit(5)
    courses.each do |course| result.push({ id: course.id, name: course.name, total_size: course.total_size / MEGABYTE_DIVIDER }) end
    render json: { courses: result }
  end
end