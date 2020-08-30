class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :leaderboard, :next_question, :start]

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
    render json: @quiz.to_json(include: [:questions, :students, :professor])
  end

  def leaderboard
    @students = @quiz.students.order(total_points: :desc)
    @quiz.questions.active.update_all(status: :done)
    render json: @students, status: :ok
  end

  def next_question
    next_q = @quiz.next_question

    if next_q.nil?
      render json: {}, status: 204
    else
      next_q.update(started_at_in_epoch: Time.now.to_i, status: "active")
      render json: @quiz.next_question
    end
  end

  def start
    @quiz.questions.update_all(status: "pending")
    @quiz.students.destroy_all
    render json: {}, status: 204
  end

  private
  def quiz_params
    params.permit(:name, :professor_id, :id,
                 questions_attributes: [:id, :query, :option_a, :option_b, :option_c, :option_d, :correct_option])
  end

  def set_quiz
    @quiz = Quiz.find(quiz_params[:id])
  end
end
