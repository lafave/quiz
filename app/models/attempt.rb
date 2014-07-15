class Attempt < ActiveRecord::Base
  # Relationships
  belongs_to :user,      counter_cache: true
  belongs_to :quiz
  has_many   :responses, dependent: :destroy

  # @return [Answer, nil]
  def answer_for(question)
    responses.joins(:answer => [:question])
      .where("questions.id = ?", question.id)
      .first
      .try(:answer)
  end

  # @return [Array<Integer>]
  def correct_answer_ids
    quiz.answers.where(correct: true).map(&:id) & responses.map(&:answer_id)
  end

  # @return [Float]
  def score
    (correct_answer_ids.size.to_f / quiz.questions_count) * 100
  end
end
