class QuizSessionsController < ApplicationController

  def results
    @quiz_session = QuizSession.find(params[:id])
    @students = @quiz_session.students.order(total_points: :desc)
    render json: @students, status: :ok
  end
end
