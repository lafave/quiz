class Answer < ActiveRecord::Base
  # Relationships
  belongs_to :question, counter_cache: true

  # Validations
  validates :question, presence: true

  # Scopes
  scope :correct, -> { where correct: true }
end
