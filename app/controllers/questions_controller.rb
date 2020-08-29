class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @question.update_attribute(:started_at_in_epoch, Time.now.to_i)
    render json: @question
  end
end
