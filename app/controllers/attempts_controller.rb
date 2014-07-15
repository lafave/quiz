class AttemptsController < ApplicationController
  before_action :authenticate_user!

  def show
    @attempt = Attempt.find(params[:id])
    @quiz    = @attempt.quiz
  end

  def new
    @quiz = Quiz.includes(:questions, :answers).find(quiz_id)
  end

  def create
    @quiz    = Quiz.find(quiz_id)
    @attempt = @quiz.attempts.create(user_id: current_user.id)

    params["answers"] && params["answers"].each do |_, answer|
      @attempt.responses.create(answer_id: answer)
    end

    redirect_to @attempt
  end

  private

  def quiz_id
    params[:id] || params[:quiz_id] || Quiz.first.id
  end
end