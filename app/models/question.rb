class Question < ActiveRecord::Base
  # Relationships
  belongs_to :quiz
  has_many   :answers

  # Validations
  validates :quiz, presence: true
end
