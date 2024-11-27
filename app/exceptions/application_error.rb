class ApplicationError < StandardError
  attr_reader :status_code, :error

  def initialize(message: nil, status_code: 500, error: nil)
    @status_code = status_code
    @error = error
    super(message)
  end
end