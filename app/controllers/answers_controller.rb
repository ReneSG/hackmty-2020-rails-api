class AnswersController < ApplicationController

  def create
    @answer = Answer.create(answer_params)
    @answer.question = Quiz.find(params[:quiz_id]).active_question
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
    params.permit(:id, :selection)
  end

  def compute_answer
    correct_answer = @answer.question.correct_option
    #TODO: Compute real points based on timestamps.
    @answer.points_awarded = correct_answer == @answer.selection ? points_awarded : 0
    @answer.student.increase_total_points(@answer.points_awarded)
  end

  def points_awarded
    answer_sent_at = params[:timestamp]
    quiz_started_at = @answer.question.started_at_in_epoch
    return 1000 - (answer_sent_at.to_i - quiz_started_at.to_i)*10
  end
end
