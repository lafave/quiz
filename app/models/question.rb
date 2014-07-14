class Question < ActiveRecord::Base
  # Relationships
  belongs_to :quiz
  has_many   :answers, counter_cache: true

  # Validations
  validates :quiz, presence: true
end
