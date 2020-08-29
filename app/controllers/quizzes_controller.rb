class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show]

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

  def show
    render json: @quiz.to_json(include: [:questions])
  end

  private
  def quiz_params
    params.permit(:name, :professor_id, :id)
  end

  def set_quiz
    @quiz = Quiz.find(quiz_params[:id])
  end
end
