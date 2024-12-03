class CoursePagesController < ApplicationController
  before_action :set_page, only: [:show, :update, :destroy]

  def index
    pages = CoursePage.where(course_id: params[:course_id]).order(position: :asc)

    render json: {
      pages: pages.map(&:format_api)
    }
  end

  def show
    render json: @page.format_api
  end

  def create
    file_size = page_params['video']&.size || 0
    data = page_params.merge({file_size: file_size})
    page = CoursePage.create(data)

    render json: page.format_api, status: :created
  end

  def update
    @page.update(update_page_params)

    render json: @page.format_api
  end

  def destroy
    @page.destroy
    head :no_content
  end

  private

  def set_page
    id = params[:id].to_i
    @page = CoursePage.find_by(id: id)

    raise CoursePageException::NotFoundForIdError.new(id) unless @page.present?
  end

  def page_params
    params.require(:page).permit(:title, :video, :position, :course_id)
  end

  def update_page_params
    params.require(:page).permit(:title, :position, :course_id)
  end
end
