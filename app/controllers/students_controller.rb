class StudentsController < ApplicationController

  def create
    @student = Student.create(student_params)
    render json: @student.to_json
  end

  private
  def student_params
    params.permit(:username, :identifier, :id, :quiz_id)
  end
end
