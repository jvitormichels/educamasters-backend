class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update, :destroy]

  def index
    page = params[:page].to_i.zero? ? 1 : params[:page]
    per_page = params[:per_page].to_i.zero? ? 1 : params[:per_page]
    query = params[:query].to_s

    if query.present?
      courses = Course.where("name ILIKE ?", "%#{query}%").page(page).per(per_page)
    else
      courses = Course.all.page(page).per(per_page)
    end

    metadata = {
      total_count: courses&.total_count,
      total_pages: courses&.total_pages,
      current_page: courses&.current_page,
      next_page: courses&.next_page,
      prev_page: courses&.prev_page
    }

    render json: {
      meta: metadata,
      courses: courses.map(&:format_api)
    }
  end

  def show
    render json: @course.format_api
  end

  def create
    # ajustar para retornar corretamente em caso de falha na criação devido à ausência de parâmetros obrigatórios
    course = Course.create(course_params)

    render json: course.format_api, status: :created
  end

  def update
    @course.update(course_params)

    render json: @course.format_api
  end

  def destroy
    @course.destroy
    head :no_content
  end

  private

  def set_course
    id = params[:id].to_i
    @course = Course.find_by(id: id)

    raise CourseException::NotFoundForIdError.new(id) unless @course.present?
  end

  def course_params
    params.require(:course).permit(:name, :description, :end_date)
  end
end
