class AnswersController < ApplicationController

  def create
    @answer = Answer.create(answer_params)
    @answer.student = Student.find_by(identifier: params[:student_identifier])
    compute_answer
    if @answer.save
      render json: @answer.to_json, status: :created
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  private
  def answer_params
    params.permit(:id, :selection, :question_id)
  end

  def compute_answer
    correct_answer = @answer.question.correct_option
    #TODO: Compute real points based on timestamps.
    @answer.points_awarded = correct_answer == @answer.selection ? 1 : 0
  end
end
