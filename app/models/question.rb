class Question < ActiveRecord::Base
  # Relationships
  belongs_to :quiz,    counter_cache: true
  has_many   :answers, dependent: :destroy

  # Validations
  validates :quiz, presence: true
  validates_associated :answers

  # @return [Answer, nil]
  def correct_answer
    answers.where(correct: true).first
  end
end
