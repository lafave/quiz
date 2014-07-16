module ApplicationHelper

  # @return [Quiz, nil]
  def default_quiz
    Quiz.first
  end
end
