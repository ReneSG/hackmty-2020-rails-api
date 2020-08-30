class StudentsController < ApplicationController

  def create
    @student = Student.create(student_params)
    @student.quiz_session = Quiz.find(params[:quiz_id]).quiz_sessions.active.last
    @student.total_points = 0
    @student.save
    render json: @student.to_json
  end

  private
  def student_params
    params.permit(:username, :identifier, :id)
  end
end
