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
    @answer.points_awarded = correct_answer == @answer.selection ? points_awarded : 0
  end

  def points_awarded
    answer_sent_at = DateTime.parse(params[:timestamp])
    quiz_started_at = @answer.question.started_at_in_epoch
    return 1000 - (quiz_started_at - answer_sent_at)*20
  end
end
