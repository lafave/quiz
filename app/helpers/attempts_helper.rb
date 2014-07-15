module AttemptsHelper
  # @param attempt [Attempt]
  # @param question [Question]
  #
  # @return [String]
  def result_label(attempt, question)
    if attempt.responses.map(&:answer_id).include? question.correct_answer.id
      "correct"
    else
      "incorrect"
    end
  end
end