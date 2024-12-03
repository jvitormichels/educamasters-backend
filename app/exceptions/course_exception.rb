module CourseException
  class NotFoundForIdError < ApplicationError
    def initialize(id)
      @course_id = id
      super(message: message, status_code: :not_found, error: "course_not_found_for_id")
		end

    def message
      "No course found for the id #{@course_id}"
    end
  end
end