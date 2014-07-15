class Question < ActiveRecord::Base
  # Relationships
  belongs_to :quiz,    counter_cache: true
  has_many   :answers, dependent: :destroy

  # Validations
  validate  :only_one_correct_answer
  validates :answers, length: { :maximum => 4 }
  validates :quiz,    presence: true

  # @return [Answer, nil]
  def correct_answer
    answers.where(correct: true).first
  end

  private

  # @return [void]
  def only_one_correct_answer
    if answers.correct.size > 0
      errors.add :answers, "A question can only have one correct answer"
    end
  end
end
