class Answer < ActiveRecord::Base
  # Relationships
  belongs_to :question

  # Validations
  validates :question, presence: true
end
