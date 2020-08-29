class QuizzesController < ApplicationController
  def create
    @quiz = Quiz.create(quiz_params)
    if @quiz.save
      render json: @quiz, status: :created
    else
      render json: @quiz.errors, status: :unprocessable_entity
    end
  end


  def index
    @quizzes = Quiz.all
    render json: @quizzes.to_json
  end

  private

  def quiz_params
    params.permit(:name, :professor_id)
  end
end
