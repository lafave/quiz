class Answer < ActiveRecord::Base
  # Relationships
  belongs_to :question, counter_cache: true

  # Validations
  validate  :only_correct_answer
  validates :question, presence: true

  # Scopes
  scope :correct, -> { where correct: true }

  private

  def only_correct_answer
    if question.answers.correct.size > 0
      errors.add :question, "A correct answer already exists for this question"
    end
  end
end
