class Attempt < ActiveRecord::Base
  # Relationships
  belongs_to :user,      counter_cache: true
  belongs_to :quiz
  has_many   :responses, dependent: :destroy

  def score
    correct_answers = quiz.answers.where(correct: true).map(&:id) & responses.map(&:answer_id)
    (correct_answers.size.to_f / quiz.questions_count) * 100
  end
end
