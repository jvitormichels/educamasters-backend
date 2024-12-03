module CoursePageException
  class NotFoundForIdError < ApplicationError
    def initialize(id)
      @course_page_id = id
      super(message: message, status_code: :not_found, error: "course_page_not_found_for_id")
		end

    def message
      "No course page found for the id #{@course_page_id}"
    end
  end
end