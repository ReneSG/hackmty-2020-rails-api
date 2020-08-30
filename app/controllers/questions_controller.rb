class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @question.update(started_at_in_epoch: Time.now.to_i, status: "active")
    render json: @question
  end
end
