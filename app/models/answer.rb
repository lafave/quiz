class Answer < ActiveRecord::Base
  # Relationships
  belongs_to :question, counter_cache: true

  # Validations
  validates :question, presence: true
end
